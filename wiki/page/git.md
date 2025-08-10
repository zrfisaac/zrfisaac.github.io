# <img src="/wiki/icon/git.png" alt="Ícone" width="24"> Git

> *Última atualização: 2025-08-09*

O Git é um sistema de controle de versão distribuído (VCS) essencial para o desenvolvimento de software. A principal função dele é registrar e gerenciar as alterações feitas em arquivos e códigos ao longo do tempo.

## 🔧 Configuração

- Permite que o Git trabalhe com caminhos de arquivo mais longos que 260 caracteres no Windows.

```bash
git config --system core.longpaths true
```

- Autoriza o repositório atual como confiável para uso pelo Git.

```bash
git config --global --add safe.directory "$(pwd)"
```

- Obter a URL do repositório remoto.

```bash
git remote get-url origin
```
