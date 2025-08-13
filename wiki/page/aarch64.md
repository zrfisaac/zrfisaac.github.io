# 🧩 AArch64

O AArch64 é a versão 64 bits da arquitetura ARM, usada em smartphones modernos, tablets, laptops e servidores ARM. É a evolução do ARM32 (AArch32) e mantém o design RISC, focado em eficiência, velocidade e baixo consumo de energia.

> *Última atualização: 2025-08-13*

## 🗄️ Registrador

| Registrador | Tamanho | Função / Observação                                                     |
| ----------- | ------- | ----------------------------------------------------------------------- |
| `X0–X7`     | 64 bits | Registradores de uso geral + passagem de argumentos para funções        |
| `X8`        | 64 bits | Registrador temporário, às vezes usado como endereço de indirect call   |
| `X9–X15`    | 64 bits | Registradores temporários (caller-saved)                                |
| `X16–X17`   | 64 bits | Registradores temporários reservados para chamadas do linker / platform |
| `X18`       | 64 bits | Registrador reservado (platform register)                               |
| `X19–X28`   | 64 bits | Registradores de uso geral preservados pelo callee (callee-saved)       |
| `X29`       | 64 bits | Frame pointer (FP)                                                      |
| `X30`       | 64 bits | Link register (LR), usado para retorno de funções                       |
| `SP`        | 64 bits | Stack pointer (ponteiro da pilha)                                       |
| `PC`        | 64 bits | Program counter (endereço da próxima instrução)                         |
| `NZCV`      | 4 bits  | Flags de condição: Negative, Zero, Carry, Overflow                      |

## 📝 Instrução

| Instrução               | Descrição curta                                       |
| ----------------------- | ----------------------------------------------------- |
| `ADD`                   | Soma dois registradores ou registrador + imediato     |
| `SUB`                   | Subtrai dois registradores ou registrador - imediato  |
| `MUL`                   | Multiplica registradores                              |
| `UDIV`                  | Divisão sem sinal                                     |
| `SDIV`                  | Divisão com sinal                                     |
| `AND`                   | AND lógico entre registradores                        |
| `ORR`                   | OR lógico entre registradores                         |
| `EOR`                   | XOR lógico entre registradores                        |
| `MOV` / `MOVZ` / `MOVK` | Move valor imediato ou registrador                    |
| `LSL`                   | Shift left lógico                                     |
| `LSR`                   | Shift right lógico                                    |
| `ASR`                   | Shift right aritmético                                |
| `CMP`                   | Compara registradores (altera flags)                  |
| `CSEL`                  | Seleção condicional baseada em flags                  |
| `B`                     | Branch (salto incondicional)                          |
| `BL`                    | Branch com link (chama função, salva retorno em `LR`) |
| `RET`                   | Retorna de função usando `LR`                         |
| `LDR`                   | Load: carrega valor da memória para registrador       |
| `STR`                   | Store: armazena valor do registrador na memória       |
| `LDUR` / `STUR`         | Load/store com endereços não alinhados                |
| `CBZ`                   | Branch condicional se registrador = 0                 |
| `CBNZ`                  | Branch condicional se registrador ≠ 0                 |
| `TBZ`                   | Test bit e branch se 0                                |
| `TBNZ`                  | Test bit e branch se 1                                |
| `NOP`                   | Não faz nada                                          |
| `MOVN`                  | Move valor negado imediato                            |
| `ANDS`                  | AND lógico e atualiza flags                           |
| `ORRS`                  | OR lógico e atualiza flags                            |
| `EORS`                  | XOR lógico e atualiza flags                           |
