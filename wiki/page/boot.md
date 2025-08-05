# 🧩 Boot

> *Última atualização: 2025-07-26*

O processo de **boot** é responsável por iniciar o sistema operacional assim que o computador é ligado. A forma como o disco é particionado afeta diretamente esse processo. Os dois principais esquemas de particionamento usados atualmente são o **MBR (Master Boot Record)** e o **GPT (GUID Partition Table)**. Cada um tem estrutura, limitações e finalidades distintas, influenciando a compatibilidade com BIOS ou UEFI, número de partições e tamanho suportado do disco.

## 📚 Índice

* [🧢 Boot](#🧢-boot)
* [📦 Diferenças Principais](#📦-diferenças-principais)
* [📀 Estrutura MBR](#📀-estrutura-mbr)
* [🧬 Estrutura GPT](#🧬-estrutura-gpt)
* [📌 Comparativo Resumido](#📌-comparativo-resumido)

---

## [📦 Diferenças Principais](#📚-índice)

| Característica            | **MBR**                          | **GPT**                         |
| ------------------------- | -------------------------------- | ------------------------------- |
| Máx. de partições         | 4 primárias (ou 3 + 1 estendida) | 128 (padrão UEFI)               |
| Tamanho máximo do disco   | \~2 TB                           | \~9,4 ZB                        |
| Compatibilidade           | BIOS (Legacy)                    | UEFI                            |
| Redundância               | Nenhuma                          | Cabeçalhos e tabelas espelhadas |
| Identificação de partição | Tipo (ex: `0x07`, `0x83`)        | GUIDs únicos                    |
| Segurança                 | Sem verificação de integridade   | CRC32 e backup                  |

## [📀 Estrutura MBR](#📚-índice)

A entrada do MBR:

| Offset (hex) | Offset (dec) | Tamanho | Conteúdo                         |
| ------------ | ------------ | ------- | -------------------------------- |
| `0x000`      | `0`          | 446 B   | Código de boot (bootloader)      |
| `0x1BE`      | `446`        | 64 B    | Tabela de partições (4 entradas) |
| `0x1FE`      | `510`        | 2 B     | Assinatura `0x55AA`              |

A entrada de partição MBR:

| Offset (hex) | Offset (dec) | Tamanho | Campo                      |
| ------------ | ------------ | ------- | -------------------------- |
| `0x00`       | `0`          | 1 byte  | Status (`0x80` = bootável) |
| `0x01`       | `1`          | 3 bytes | CHS início (legado)        |
| `0x04`       | `4`          | 1 byte  | Tipo de partição           |
| `0x05`       | `5`          | 3 bytes | CHS fim (legado)           |
| `0x08`       | `8`          | 4 bytes | LBA inicial                |
| `0x0C`       | `12`         | 4 bytes | Total de setores           |

## [🧬 Estrutura GPT](#📚-índice)

A entrada do GPT contém:

| Offset (hex)   | Offset (dec) | Tamanho   | Campo                                       |
| -------------- | ------------ | --------- | ------------------------------------------- |
| `0x00`         | `0`          | 8 bytes   | Assinatura `"EFI PART"`                     |
| `0x08`         | `8`          | 4 bytes   | Revisão (ex: `00 00 01 00` = versão 1.0)    |
| `0x0C`         | `12`         | 4 bytes   | Tamanho da estrutura GPT (em bytes)         |
| `0x10`         | `16`         | 4 bytes   | CRC32 do cabeçalho                          |
| `0x14`         | `20`         | 4 bytes   | Reservado (0)                               |
| `0x18`         | `24`         | 8 bytes   | LBA do cabeçalho atual (normalmente 1)      |
| `0x20`         | `32`         | 8 bytes   | LBA do cabeçalho de backup                  |
| `0x28`         | `40`         | 8 bytes   | LBA do início utilizável para partições     |
| `0x30`         | `48`         | 8 bytes   | LBA do fim utilizável para partições        |
| `0x38`         | `56`         | 16 bytes  | GUID do disco                               |
| `0x48`         | `72`         | 8 bytes   | LBA de início da tabela de partições        |
| `0x50`         | `80`         | 4 bytes   | Número de entradas na tabela de partições   |
| `0x54`         | `84`         | 4 bytes   | Tamanho de cada entrada (em bytes, ex: 128) |
| `0x58`         | `88`         | 4 bytes   | CRC32 da tabela de partições                |
| `0x5C`–`0x1FF` | `92–511`     | 420 bytes | Reservado (zeros)                           |

A entrada de partição MBR:

| Offset (hex) | Offset (dec) | Tamanho  | Campo                                          |
| ------------ | ------------ | -------- | ---------------------------------------------- |
| `0x00`       | `0`          | 16 bytes | Tipo da partição (GUID)                        |
| `0x10`       | `16`         | 16 bytes | GUID da partição (único)                       |
| `0x20`       | `32`         | 8 bytes  | LBA inicial da partição                        |
| `0x28`       | `40`         | 8 bytes  | LBA final da partição                          |
| `0x30`       | `48`         | 8 bytes  | Atributos da partição                          |
| `0x38`       | `56`         | 72 bytes | Nome da partição (UTF-16LE, até 36 caracteres) |

## [📌 Comparativo Resumido](#📚-índice)

| Aspecto                  | MBR                 | GPT                      |
| ------------------------ | ------------------- | ------------------------ |
| Ano de criação           | 1983                | 2000                     |
| Setor de boot            | 512 bytes (1 setor) | Múltiplos setores (UEFI) |
| Suporte a partições      | Até 4 primárias     | 128 ou mais              |
| Suporte a discos grandes | Até 2 TB            | Até 9,4 ZB               |
| Redundância de dados     | Não                 | Sim                      |
| Integridade dos dados    | Nenhuma verificação | CRC32                    |
| Compatibilidade          | Ampla (BIOS)        | Requer UEFI              |
