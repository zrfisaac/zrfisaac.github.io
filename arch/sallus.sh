#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.sallus : 26.10.11.1

# [ bash ]

# - variable
set -euo pipefail
v_sda="a"
v_user="sallus"
v_password="s"
v_home="/sallus"
v_grub="/etc/default/grub"

# - chroot
if [[ "${1:-}" == "--inside" ]]; then
    echo "# . - multilib"
    sed -i '/^[[:space:]]*#[[:space:]]*\[multilib\][[:space:]]*$/,/^[[:space:]]*#[[:space:]]*Include[[:space:]]*=[[:space:]]*\/etc\/pacman.d\/mirrorlist[[:space:]]*$/ s/^[[:space:]]*#[[:space:]]*//' /etc/pacman.conf

    echo "# . - update"
    pacman -Syu --noconfirm

    echo "# . - install"
    pacman -S --needed --noconfirm \
        sudo nano wget git base-devel \
        grub efibootmgr mkinitcpio \
        iproute2 openbsd-netcat \
        iwd networkmanager network-manager-applet \
        dhcpcd ufw gufw less github-cli samba libwbclient \
        noto-fonts noto-fonts-cjk noto-fonts-emoji \
        xorg-server xorg-xinit xfce4 xfce4-goodies \
        wine winetricks wine-gecko wine-mono

    echo "# . - user"
    id "$v_user" &>/dev/null || useradd -m -d "$v_home" -s /bin/bash "$v_user"
    echo "root:$v_password" | chpasswd
    echo "$v_user:$v_password" | chpasswd

    echo "# . - network"
    systemctl enable NetworkManager.service
    systemctl enable ufw.service

    echo "# . - shell"
    v_dir="/etc/systemd/system/getty@tty1.service.d"
    mkdir -p "$v_dir"
    cat > "$v_dir/autologin.conf" <<EOT
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $v_user --noclear %I \$TERM
EOT
    systemctl enable getty@tty1.service

    echo "# . - configure"
    sed -i '/^GRUB_GFXMODE=/d; /^GRUB_GFXPAYLOAD_LINUX=/d' "$v_grub"
    sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' "$v_grub"
    sed -i 's/^GRUB_TIMEOUT_STYLE=.*/GRUB_TIMEOUT_STYLE=hidden/' "$v_grub"
    grep -q '^GRUB_TIMEOUT=' "$v_grub" || echo 'GRUB_TIMEOUT=0' >> "$v_grub"
    grep -q '^GRUB_TIMEOUT_STYLE=' "$v_grub" || echo 'GRUB_TIMEOUT_STYLE=hidden' >> "$v_grub"
    echo 'GRUB_GFXMODE=800x600' >> "$v_grub"
    echo 'GRUB_GFXPAYLOAD_LINUX=keep' >> "$v_grub"

    echo "# . - initramfs"
    mkinitcpio -p linux

    echo "# . - grub"
    grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
    grub-mkconfig -o /boot/grub/grub.cfg

    echo "# . - end"
    exit 0
fi

# - argument
if [[ "${1:-}" =~ ^[a-z]$ ]]; then
    v_sda="$1"
elif [[ -n "${1:-}" ]]; then
    echo "Invalid disk: $1"
    exit 1
fi
v_disk="/dev/sd${v_sda}"

# - check
echo "# . - check"
[ "$EUID" -eq 0 ] || exit 1
[ -b "$v_disk" ] || exit 1
[ -d /sys/firmware/efi ] || { echo "UEFI required."; exit 1; }
if lsblk -nrpo MOUNTPOINT "$v_disk" | grep -q '[^[:space:]]'; then
    echo "Disk is mounted."
    exit 1
fi
if lsblk -nrpo NAME "$v_disk" | grep -Fxf <(swapon --noheadings --raw --output NAME); then
    echo "Disk has active swap."
    exit 1
fi

# - confirm
echo "# . - confirm"
lsblk "$v_disk"
read -r -p "Delete all data on $v_disk? Y/[N]: " v_confirm
[[ "${v_confirm^^}" == "Y" ]] || exit 0
mountpoint -q /mnt && { echo "/mnt is mounted."; exit 1; }

# - delete
echo "# . - delete"
wipefs -af "$v_disk"
sgdisk --zap-all "$v_disk"

# - partition
echo "# . - partition"
sgdisk -o "$v_disk"
sgdisk -n 1:0:+1G -t 1:8300 -c 1:"BOOT" "$v_disk"
sgdisk -n 2:0:+1G -t 2:EF00 -c 2:"EFI" "$v_disk"
sgdisk -n 3:0:0   -t 3:8300 -c 3:"LINUX" "$v_disk"
partprobe "$v_disk"
udevadm settle

# - format
echo "# . - format"
mkfs.ext4 -F -L BOOT "${v_disk}1"
mkfs.fat -F 32 -n EFI "${v_disk}2"
mkfs.ext4 -F -L LINUX "${v_disk}3"

# - mount
echo "# . - mount"
mount "${v_disk}3" /mnt
mkdir -p /mnt/boot /mnt/efi
mount "${v_disk}1" /mnt/boot
mount "${v_disk}2" /mnt/efi

# - swap
echo "# . - swap"
dd if=/dev/zero of=/mnt/swap bs=1M count=8192 status=progress
chmod 600 /mnt/swap
mkswap /mnt/swap
swapon /mnt/swap

# - pacstrap
echo "# . - pacstrap"
pacstrap -K /mnt base linux linux-firmware nano wget git base-devel
mkdir -p /mnt/etc
genfstab -U /mnt > /mnt/etc/fstab

# - chroot
echo "# . - chroot"
install -m 700 "$0" /mnt/root/sallus.sh
arch-chroot /mnt /usr/bin/bash /root/sallus.sh --inside
rm -f /mnt/root/sallus.sh

# - end
echo "# . - end"
lsblk -f "$v_disk"
