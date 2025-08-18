# 🧩 ARM64 / AArch64

> *Última atualização: 2025-08-18*

O ARM64 é a arquitetura de 64 bits da ARM, introduzida com o conjunto de instruções ARMv8. Ela é projetada para alta eficiência energética, desempenho escalável e simplicidade estrutural, sendo usada em smartphones, servidores, sistemas embarcados e computadores modernos.

## 🔄 Diferenças entre ARM64 e x86_64

Embora ambas sejam arquiteturas de 64 bits modernas, elas seguem filosofias diferentes:

| Aspecto                  | AMD64 (x86_64)                            | ARM64                              | Impacto Prático                              |
|--------------------------|-------------------------------------------|----------------------------------------------|-----------------------------------------------|
| 🏗️ Filosofia de design    | CISC (Complex Instruction Set Computing)  | RISC (Reduced Instruction Set Computing)      | x86_64 tem instruções mais complexas; ARM64 é mais simples e eficiente |
| 🧮 Execução de cálculos   | Instruções multifuncionais (ex: `MUL` pode fazer mais que multiplicar) | Instruções diretas e específicas (`ADD`, `SUB`, `MUL`, etc.) | ARM64 exige mais instruções, mas cada uma é mais rápida e previsível |
| 📐 Tamanho fixo de instrução | Variável (1 a 15 bytes por instrução)     | Fixo (4 bytes por instrução)                  | ARM64 é mais fácil de decodificar e otimizar em hardware |
| 🔁 Pipeline e paralelismo | Mais difícil de prever (instruções complexas) | Mais eficiente para paralelismo e execução fora de ordem | ARM64 tem vantagem em desempenho por watt     |
| 🔌 Consumo de energia     | Alto em geral (desktops, servidores)      | Baixo (ideal para mobile e servidores escaláveis) | ARM64 domina em dispositivos móveis e data centers modernos |
| 🧰 Suporte legado         | Compatível com décadas de software x86    | Foco em software moderno e otimizado          | x86_64 é melhor para retrocompatibilidade; ARM64 é melhor para novos sistemas |

> **x86_64 :** é como uma máquina de escrever com teclas que fazem várias coisas ao mesmo tempo — poderosa, mas complexa.
> **ARM64 :** é como um teclado mecânico minimalista — cada tecla faz uma coisa só, mas tudo funciona com precisão e eficiência.

## 🗄️ Registradores

| 8 Byte | 4 Byte | Função     | Descrição                                                  |
|--------|--------|------------|-------------------------------------------------------------|
| `X0`–`X7` | `W0`–`W7` | Argumentos | Usados para passar argumentos em chamadas de função       |
| `X8`      | `W8`       | Retorno    | Retorno de chamadas de sistema (`syscall`)                |
| `X9`–`X15`| `W9`–`W15` | Temporários| Uso geral, temporário                                     |
| `X16`, `X17`| `W16`, `W17` | Intermediários | Chamadas indiretas e trampolins                         |
| `X18`     | `W18`      | Plataforma | Reservado para uso do sistema operacional                 |
| `X19`–`X28`| `W19`–`W28` | Preservados| Devem ser salvos/restaurados em chamadas de função       |
| `X29`     | `W29`      | Frame      | Ponteiro de frame (`FP`)                                  |
| `X30`     | `W30`      | Link       | Registrador de retorno (`LR`)                             |
| `SP`      | —          | Pilha      | Stack Pointer                                              |
| `PC`      | —          | Instrução  | Program Counter (endereço da próxima instrução)           |

## 🔀 Condicional

| Instrução | Condição Verificada     | Flags Testadas | Descrição Simplificada                         |
|-----------|-------------------------|----------------|-------------------------------------------------|
| `BEQ`     | Igual                   | `Z`            | Branch se igual (zero flag ativado)            |
| `BNE`     | Diferente               | `Z`            | Branch se diferente (zero flag desativado)     |
| `BGT`     | Maior (signed)          | `N`, `V`, `Z`  | Branch se maior com sinal                      |
| `BLT`     | Menor (signed)          | `N`, `V`       | Branch se menor com sinal                      |
| `BGE`     | Maior ou igual (signed) | `N`, `V`       | Branch se maior ou igual                       |
| `BLE`     | Menor ou igual (signed) | `N`, `V`, `Z`  | Branch se menor ou igual                       |
| `BHI`     | Acima (unsigned)        | `C`, `Z`       | Branch se acima (sem carry e não zero)         |
| `BHS`     | Acima ou igual (unsigned)| `C`           | Branch se acima ou igual (sem carry)           |
| `BLO`     | Abaixo (unsigned)       | `C`            | Branch se abaixo (carry ativado)               |

---

## 📝 Instruções

| Instrução     | Tipo             | Exemplo                    | Descrição                                               |
|---------------|------------------|-----------------------------|-----------------------------------------------------------|
| `MOV`         | Transferência     | `MOV X0, X1`                | Move valor entre registradores                           |
|               |                  | `MOV X0, #10`               | Move valor imediato para `X0`                            |
| `ADD`         | Aritmética        | `ADD X0, X1, X2`            | Soma `X1` e `X2`, armazena em `X0`                        |
| `SUB`         | Aritmética        | `SUB X0, X1, #1`            | Subtrai 1 de `X1`, armazena em `X0`                       |
| `MUL`         | Aritmética        | `MUL X0, X1, X2`            | Multiplica `X1` por `X2`, armazena em `X0`                |
| `SDIV`        | Aritmética        | `SDIV X0, X1, X2`           | Divide com sinal                                          |
| `AND` / `ORR` | Lógica            | `AND X0, X1, X2`            | AND lógico entre `X1` e `X2`                             |
|               |                  | `ORR X0, X1, X2`            | OR lógico entre `X1` e `X2`                              |
| `EOR`         | Lógica            | `EOR X0, X1, X1`            | XOR lógico (zera `X0`)                                   |
| `CMP`         | Comparação        | `CMP X0, X1`                | Compara valores e altera flags                          |
| `TST`         | Teste lógico      | `TST X0, X1`                | AND lógico sem armazenar resultado, altera flags         |
| `LSL` / `LSR` | Shift             | `LSL X0, X1, #2`            | Shift lógico à esquerda                                  |
| `B`           | Controle de fluxo | `B label`                   | Salto incondicional                                      |
| `BL`          | Controle de fluxo | `BL func`                   | Chama função (branch with link)                          |
| `RET`         | Controle de fluxo | `RET`                       | Retorna da função                                        |
| `STR` / `LDR` | Memória           | `STR X0, [X1]` / `LDR X0, [X1]` | Armazena ou carrega valor da memória                 |

## 🚩 Flags

| Flag | Nome Completo       | Quando é Ativada                         | Utilidade / Impacto                      |
|------|---------------------|------------------------------------------|------------------------------------------|
| `N`  | Negative Flag        | Resultado negativo (bit mais alto = 1)   | Usado em comparações com sinal           |
| `Z`  | Zero Flag            | Resultado da operação foi zero           | Usado em instruções condicionais (`BEQ`) |
| `C`  | Carry Flag           | Overflow sem sinal                       | Usado em operações com números unsigned  |
| `V`  | Overflow Flag        | Overflow com sinal                       | Usado em comparações com sinal           |
