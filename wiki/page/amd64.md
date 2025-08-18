# 🧩 AMD64 / x86_64

> *Última atualização: 2025-08-18*

O AMD64(x86_64) é uma extensão da arquitetura x86, introduzida pela AMD em 2003. Ela suporta operações de 64 bits, permitindo maior capacidade de memória, registradores adicionais e instruções otimizadas para desempenho moderno.


## 🔄 Diferenças entre AMD64 e x86

| Categoria         | x86 (32 bits)                          | AMD64 (64 bits)                              | Impacto / Observação                        |
|-------------------|----------------------------------------|-----------------------------------------------|---------------------------------------------|
| 🧠 Registradores   | `EAX`, `EBX`, `ECX`, `EDX`, etc.       | `RAX`, `RBX`, `RCX`, `RDX`, `R8`–`R15`        | Mais registradores, maior capacidade        |
| 📦 Tamanho de dados| Até 4 GB de memória endereçável        | Até 256 TB de memória virtual                 | Ideal para sistemas modernos e servidores   |
| 📞 Chamada de função| Argumentos passados via pilha         | Argumentos em registradores (`RDI`, `RSI`, etc.) | Mais rápido e eficiente                     |
| 🔐 Segurança       | Sem proteção nativa contra overflow    | Suporte a NX bit (No eXecute) e ASLR          | Proteção contra exploits e buffer overflow  |
| 🧮 Operações       | Limitadas a 32 bits                    | Operações nativas com 64 bits                 | Melhor desempenho em cálculos grandes       |
| 🧰 Instruções SSE  | SSE2 obrigatório em CPUs modernas      | SSE2+, AVX, AVX2, etc.                        | Mais instruções vetoriais e paralelismo     |
| 🧱 Modo de execução| Modo protegido ou real                 | Modo de longa execução (long mode)            | Permite acesso a recursos estendidos        |

## 🗄️ Registradores

| 8 Byte | 4 Byte | 2 Byte | 1 Byte       | Função   | Descrição                                                      |
|--------|--------|--------|--------------|----------|----------------------------------------------------------------|
| `RAX`  | `EAX`  | `AX`   | `AH`, `AL`   | Retorno  | Acumulador: operações aritméticas e retorno de função          |
| `RBX`  | `EBX`  | `BX`   | `BH`, `BL`   | Base     | Registrador base: manipulação de dados e endereços             |
| `RCX`  | `ECX`  | `CX`   | `CH`, `CL`   | Contador | Usado em loops, contadores e instruções repetitivas            |
| `RDX`  | `EDX`  | `DX`   | `DH`, `DL`   | Dados    | Registrador de dados: multiplicação, divisão e I/O             |

## 🔀 Condicional

| Instrução | Condição Verificada         | Flags Testadas     | Descrição Simplificada                         |
|-----------|-----------------------------|---------------------|-------------------------------------------------|
| `JE`      | Igual                       | `ZF`                | Salta se resultado anterior foi igual a zero   |
| `JZ`      | Zero                        | `ZF`                | Salta se resultado foi zero                    |
| `JNE`     | Diferente                   | `ZF`                | Salta se resultado foi diferente de zero       |
| `JNZ`     | Não Zero                    | `ZF`                | Salta se resultado não foi zero                |
| `JAE`     | Acima ou Igual (unsigned)   | `CF`                | Salta se não houve carry (≥)                   |
| `JNB`     | Não Abaixo (unsigned)       | `CF`                | Salta se não houve carry (≥)                   |
| `JB`      | Abaixo (unsigned)           | `CF`                | Salta se houve carry (<)                       |
| `JL`      | Menor (signed)              | `SF`, `OF`          | Salta se menor com sinal                       |
| `JG`      | Maior (signed)              | `ZF`, `SF`, `OF`    | Salta se maior com sinal                       |
| `JNL`     | Não Menor (signed)          | `SF`, `OF`          | Salta se não for menor com sinal               |

## 📝 Instruções

| Instrução     | Tipo             | Exemplo                    | Descrição                                               |
|---------------|------------------|-----------------------------|-----------------------------------------------------------|
| `MOV`         | Transferência     | `MOV RAX, RBX`              | Move valor entre registradores de 64 bits                |
|               |                  | `MOV RAX, [RBX]`            | Move valor da memória apontada por `RBX` para `RAX`      |
|               |                  | `MOV RAX, 10`               | Move valor imediato para `RAX`                           |
| `ADD`         | Aritmética        | `ADD RAX, RBX`              | Soma `RBX` a `RAX`                                       |
| `SUB`         | Aritmética        | `SUB RAX, 1`                | Subtrai 1 de `RAX`                                       |
| `JMP`         | Controle de fluxo | `JMP label`                 | Salto incondicional para outro ponto do código          |
| `MUL`         | Aritmética        | `MUL RBX`                   | Multiplica `RAX` por `RBX` (sem sinal)                   |
| `IMUL`        | Aritmética        | `IMUL RBX`                  | Multiplica com sinal                                     |
| `DIV` / `IDIV`| Aritmética        | `IDIV RBX`                  | Divide `RDX:RAX` por `RBX` (com sinal)                   |
| `INC` / `DEC` | Aritmética        | `INC RCX` / `DEC RCX`       | Incrementa ou decrementa registrador                    |
| `NEG`         | Bitwise           | `NEG RAX`                   | Inverte o sinal de `RAX`                                 |
| `NOT`         | Bitwise           | `NOT RBX`                   | Inverte todos os bits de `RBX`                           |
| `AND` / `OR`  | Lógica            | `AND RAX, RBX`              | AND / OR lógico entre `RAX` e `RBX`                      |
| `XOR`         | Lógica            | `XOR RAX, RAX`              | Zera `RAX` (técnica comum)                               |
| `TEST`        | Lógica            | `TEST RAX, RBX`             | AND lógico sem armazenar resultado, altera flags         |
| `CMP`         | Comparação        | `CMP RAX, RBX`              | Compara valores e altera flags                          |
| `LEA`         | Endereçamento     | `LEA RAX, [RBX+4]`          | Carrega endereço calculado em `RAX`                     |
| `PUSH` / `POP`| Pilha             | `PUSH RAX` / `POP RBX`      | Coloca ou retira valor da pilha                         |
| `CALL` / `RET`| Controle de fluxo | `CALL func` / `RET`         | Chama função e retorna                                  |

## 🚩 Flags

| Flag | Nome Completo       | Bit | Quando é Ativada                         | Utilidade / Impacto                      |
|------|---------------------|-----|------------------------------------------|------------------------------------------|
| `CF` | Carry Flag          | 0   | Operação aritmética gerou carry (overflow sem sinal) | Usado em operações com números sem sinal |
| `PF` | Parity Flag         | 2   | Resultado tem número par de bits 1       | Verificação de integridade (raramente usada) |
| `AF` | Auxiliary Carry Flag| 4   | Carry entre nibbles (4 bits)             | Usado em operações BCD (decimal binário) |
| `ZF` | Zero Flag           | 6   | Resultado da operação foi zero           | Usado em instruções condicionais (`JZ`, `JE`) |
| `SF` | Sign Flag           | 7   | Resultado foi negativo (bit mais alto = 1)| Usado em comparações com sinal (`JL`, `JG`) |
| `TF` | Trap Flag           | 8   | Ativa modo de depuração passo a passo    | Usado por debuggers                       |
| `IF` | Interrupt Flag      | 9   | Permite ou bloqueia interrupções         | Controle de interrupções de hardware     |
| `DF` | Direction Flag      | 10  | Define direção de operações com strings  | Avança ou retrocede (`LODS`, `STOS`, etc.) |
| `OF` | Overflow Flag       | 11  | Resultado excedeu limite com sinal       | Usado em comparações com sinal (`JG`, `JL`) |

## 🧠 JE vs JZ

Mesma instrução, nomes diferentes

| Instrução | Significado         | Verifica `ZF`? | Contexto típico         | Diferença real? |
|-----------|---------------------|----------------|--------------------------|------------------|
| `JE`      | Jump if Equal       | ✅ Sim          | Após `CMP`               | ❌ Nenhuma       |
| `JZ`      | Jump if Zero        | ✅ Sim          | Após `SUB`, `TEST`       | ❌ Nenhuma       |

> - JE e JZ são **sinônimos** no Assembly x86.
> - Ambas verificam se a **Zero Flag (ZF)** está ativada.
> - O processador trata as duas como **a mesma instrução** — mesmo opcode, mesmo comportamento.
