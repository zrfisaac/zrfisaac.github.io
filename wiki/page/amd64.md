# 🧩 AMD64 / x86_64

O AMD64, também chamado x86_64, é a extensão de 64 bits da arquitetura x86, criada pela AMD em 2003. Ele mantém compatibilidade com código x86 de 32 e 16 bits, mas adiciona novos recursos de 64 bits.

> *Última atualização: 2025-08-13*

## 🗄️ Registrador

| Registrador | Tamanho | Função / Observação                                   |
| ----------- | ------- | ----------------------------------------------------- |
| `RAX`       | 64 bits | Acumulador (64 bits, compatível com EAX, AX, AL)      |
| `RBX`       | 64 bits | Base, uso geral                                       |
| `RCX`       | 64 bits | Contador, usado em loops e shift/rotate               |
| `RDX`       | 64 bits | Dados, multiplicação/divisão                          |
| `RSI`       | 64 bits | Source index                                          |
| `RDI`       | 64 bits | Destination index                                     |
| `RBP`       | 64 bits | Base pointer da pilha                                 |
| `RSP`       | 64 bits | Stack pointer                                         |
| `R8–R15`    | 64 bits | Registradores adicionais de uso geral                 |
| `RIP`       | 64 bits | Instruction pointer                                   |
| `RFLAGS`    | 32 bits | Flags de condição (mantém compatibilidade com EFLAGS) |

## 📝 Instrução

| Instrução   | x86\_64                          | AMD64                                             |
| ----------- | -------------------------------- | ------------------------------------------------- |
| `ADD`       | Soma `src` em `dest`             | Pode usar `RAX, R8…`                              |
| `AND`       | AND lógico entre `dest` e `src`  | Registradores de 64 bits suportados               |
| `CALL`      | Chama função (salva endereço)    | Argumentos passam por registradores (`RDI, RSI…`) |
| `CMP`       | Compara valores                  | Flags alteradas como no x86                       |
| `DEC`       | Decrementa                       | Pode ser 64 bits                                  |
| `IDIV`      | Divisão com sinal                | Operação em `RAX` / `RDX` para 64 bits            |
| `IMUL`      | Multiplicação com sinal          | Suporta `RAX`, `R8-R15`                           |
| `INC`       | Incrementa                       | Pode ser 64 bits                                  |
| `JMP`       | Salto incondicional              | Igual ao x86                                      |
| `JE / JZ`   | Salta se igual / zero            | Igual ao x86                                      |
| `JNE / JNZ` | Salta se diferente / não zero    | Igual ao x86                                      |
| `JG / JNLE` | Salta se maior (signed)          | Igual ao x86                                      |
| `JL / JNGE` | Salta se menor (signed)          | Igual ao x86                                      |
| `JGE / JNL` | Salta se maior ou igual (signed) | Igual ao x86                                      |
| `JLE / JNG` | Salta se menor ou igual (signed) | Igual ao x86                                      |
| `LEA`       | Carrega endereço de memória      | Pode carregar endereços 64 bits                   |
| `MOV`       | Move dados de `src` para `dest`  | Registradores `RAX-R15` podem ser usados          |
| `MUL`       | Multiplicação sem sinal          | Operação 64 bits possível                         |
| `NEG`       | Inverte sinal                    | Pode ser 64 bits                                  |
| `NOT`       | Inverte todos os bits            | Pode ser 64 bits                                  |
| `OR`        | OR lógico                        | Registradores 64 bits suportados                  |
| `PUSH`      | Coloca valor na pilha            | 64 bits, registra endereços 64 bits               |
| `POP`       | Remove valor da pilha            | 64 bits, restaura endereços 64 bits               |
| `RET`       | Retorna de função                | Igual ao x86                                      |
| `SUB`       | Subtrai `src` de `dest`          | Pode usar registradores 64 bits                   |
| `TEST`      | AND lógico, altera flags         | Suporta 64 bits                                   |
| `XOR`       | XOR lógico                       | Registradores 64 bits suportados                  |
