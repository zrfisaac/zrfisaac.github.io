# <img src="/wiki/icon/docker.png" alt="Ícone" width="24"> Docker

> *Última atualização: 2025-08-11*

- Desinstalar todos os pacotes conflitantes

```bash
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

- Execute os seguintes comandos, um de cada vez, no seu terminal do Ubuntu

```bash
sudo apt-get update
sudo apt-get install lsb-release -y
sudo apt-get update
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

- Atualizar a lista de pacotes

```bash
sudo apt-get update
```

- Instala  a versão mais recente

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

- Verifique se a instalação foi bem-sucedida executando a imagem hello-world

```bash
sudo docker run hello-world
```

- Instala e executa o Portainer

```bash
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```
