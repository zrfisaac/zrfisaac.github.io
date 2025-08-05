# 🗄️ Partição

> *Última atualização: 2025-07-26*

Uma **partição** é uma divisão lógica de um disco físico que pode ser formatada com diferentes sistemas de arquivos, como **NTFS**, **FAT32**, **ext4**, **exFAT**, **ext3**, **ext2** e **VFAT**. Cada sistema possui características próprias que impactam compatibilidade, desempenho, limites de tamanho e funcionalidades avançadas.

## 📚 Índice

* [📊 Comparativo Técnico](#📊-comparativo-técnico)
* [📁 FAT32](#📁-fat32)
* [🪟 NTFS](#🪟-ntfs)
* [🐧 ext4](#🐧-ext4)
* [⚡ exFAT](#⚡-exfat)
* [📜 ext3](#📜-ext3)
* [📜 ext2](#📜-ext2)
* [🗃️ VFAT](#🗃️-vfat)


## [📊 Comparativo Técnico](#📚-índice)

| Sistema | Compatibilidade                         | Máx. Tamanho de Arquivo | Máx. Tamanho do Volume | Journaling | Características Principais                 |
| ------- | --------------------------------------- | ----------------------- | ---------------------- | ---------- | ------------------------------------------ |
| FAT32   | Windows, Linux, macOS                   | 4 GB                    | 8 TB                   | Não        | Alta compatibilidade, limite de arquivo    |
| NTFS    | Windows (bom suporte), Linux (limitado) | Muito > 4 GB            | Muito grande           | Sim        | Segurança, compressão, criptografia        |
| ext4    | Linux                                   | 16 TiB                  | 1 EiB                  | Sim        | Desempenho, integridade, alocação atrasada |
| exFAT   | Windows, macOS, Linux\*                 | Muito > 4 GB            | Muito grande           | Não        | Suporte a arquivos grandes em flash        |
| ext3    | Linux                                   | 2 TiB                   | 16 TiB                 | Sim        | Journaling, predecessor do ext4            |
| ext2    | Linux                                   | 2 TiB                   | 16 TiB                 | Não        | Simples, sem journaling                    |
| VFAT    | Windows, Linux                          | 4 GB                    | 8 TB                   | Não        | Suporte a nomes longos no FAT              |

## [📁 FAT32](#📚-índice)

* Criado pela Microsoft em 1996.
* Suporte amplo em quase todos sistemas operacionais.
* Limite de tamanho de arquivo de até 4 GB.
* Volume máximo de 8 TB.
* Não suporta permissões ou journaling.
* Ideal para pendrives, cartões SD e dispositivos que precisam de alta compatibilidade.

```bash
sudo mkfs.vfat -F 32 /dev/sdXn
```

## [🪟 NTFS](#📚-índice)

* Sistema padrão do Windows desde NT 3.1 (1993).
* Suporta arquivos maiores que 4 GB.
* Inclui recursos avançados como journaling, permissões (ACLs), compressão, criptografia (EFS) e cotas.
* Melhor performance em ambientes Windows.
* Suporte limitado em Linux/macOS (normalmente leitura, escrita com drivers adicionais).
* Indicado para discos internos e externos usados principalmente em Windows.

```bash
sudo mkfs.ntfs /dev/sdXn
```

## [🐧 ext4](#📚-índice)

* Sucessor do ext3, lançado em 2008.
* Sistema de arquivos padrão da maioria das distribuições Linux.
* Suporta arquivos de até 16 TiB e volumes de até 1 EiB.
* Inclui journaling, alocação atrasada e verificação de integridade.
* Excelente desempenho em sistemas Linux.
* Compatibilidade nativa apenas com Linux.

```bash
sudo mkfs.ext4 /dev/sdXn
```

## [⚡ exFAT](#📚-índice)

* Desenvolvido pela Microsoft para dispositivos flash.
* Suporta arquivos maiores que 4 GB.
* Compatível com Windows, macOS e Linux (com drivers adicionais).
* Ideal para pendrives e cartões SD de alta capacidade.
* Não possui journaling, mas oferece suporte a arquivos grandes e volumes maiores que FAT32.

```bash
sudo mkfs.exfat /dev/sdXn
```

## [📜 ext3](#📚-índice)

* Sucessor do ext2 com journaling.
* Amplamente usado em sistemas Linux antes do ext4.
* Suporte a journaling para melhor integridade dos dados.
* Limites menores que ext4, mas ainda eficiente para sistemas Linux.

```bash
sudo mkfs.ext3 /dev/sdXn
```

## [📜 ext2](#📚-índice)

* Sistema de arquivos Linux clássico, sem journaling.
* Usado principalmente em sistemas embarcados e em dispositivos onde journaling não é necessário.
* Limites menores e risco maior de corrupção após falhas.

```bash
sudo mkfs.ext2 /dev/sdXn
```

## [🗃️ VFAT](#📚-índice)

* Extensão do FAT que suporta nomes longos de arquivos (mais de 8 caracteres).
* Compatível com Windows 95 em diante.
* Usado principalmente para compatibilidade em partições FAT.

```bash
sudo mkfs.vfat /dev/sdXn
```
