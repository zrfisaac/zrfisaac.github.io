# <img src="/wiki/icon/wsl.png" alt="Ícone" width="24"> WSL

> *Última atualização: 2025-08-11*

O WSL, sigla para Windows Subsystem for Linux, é uma camada de compatibilidade da Microsoft que permite aos desenvolvedores e usuários rodarem um ambiente Linux diretamente no Windows, sem a necessidade de uma máquina virtual completa ou de um dual-boot.

- [🌐 Instalação para versões mais antigas do WSL](https://learn.microsoft.com/pt-br/windows/wsl/install-manual)

- Lista todas as distribuições Linux disponíveis para instalação no WSL.

```bash
wsl --list --online
```

- Instala a distribuição do Ubuntu 22.04 no seu sistema Windows.

```bash
wsl --install -d Ubuntu-22.04
```

- Encerra todas as distribuições e libera os recursos que elas estavam usando.

```bash
wsl --shutdown
```

