#!/usr/bin/pwsh
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.powershell.base.v01 : 1.0.0

# [ shell ]

# - : Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# [ powershell ]

# - variable
$v_end_error = $false
$v_end_message = ""

# : - about
Write-Host "# [ about ]"
Write-Host "# - author : Isaac Caires"
Write-Host "# . - email : zrfisaac@gmail.com"
Write-Host "# . - site : zrfisaac.github.io"
Write-Host "# - version : zrfisaac.powershell.base.v01 : 1.0.0"
Write-Host ""

# : - main
if (-not $v_end_error) {
    Write-Host "# [ main ]"
    try {
        # : - routine
        Write-Host "# - routine"
    } catch {
        $v_end_error = $true
        $v_end_message = $_.Exception.Message
    }
    Write-Host ""
}

# : - end
Write-Host "# [ end ]"
if ($v_end_error) {
    Write-Host "# - error"
} else {
    Write-Host "# - success"
}
if ($v_end_message -ne "") {
    Write-Host "# . - message : $v_end_message"
}
Read-Host -Prompt "Press Enter to continue..."
