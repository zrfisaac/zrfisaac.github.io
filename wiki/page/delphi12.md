# <img src="/wiki/icon/delphi10.png" alt="Ícone" width="24"> Delphi 12

> *Última atualização: 2025-08-09*

Delphi 12 é a versão mais recente da plataforma Delphi, trazendo melhorias significativas para desenvolvimento de software moderno e multiplataforma.

## 🗂️ Estrutura

```cpp
Projeto/
│
├── Binaries/                     // Binários gerados (.exe, .dll)
│
├── Controllers/                  // Lógica que conecta Model e View
│   ├── uClienteController.pas    // Classe: TClienteController
│   ├── uPedidoController.pas     // Classe: TPedidoController
│   └── uProdutoController.pas    // Classe: TProdutoController
│
├── DataModules/                  // DataModules para banco e lógica central
│   └── udMain.pas                // Classe: TDtmMain, variável: DtmMain
│
├── Forms/                        // Formulários principais
│   ├── ufSplash.pas              // Classe: TFrmSplash, variável: FrmSplash
├── Libraries/                    // Bibliotecas externas
│   └── Indy_10.6.3.11/           // Exemplo de biblioteca externa
│
├── Models/                        // Camada de dados e regras de negócio
│   ├── uCliente.pas              // Classe: TCliente
│   ├── uPedido.pas               // Classe: TPedido
│   └── uProduto.pas              // Classe: TProduto
│
├── Objects/                      // Arquivos intermediários do compilador (.dcu, .obj)
│
├── Tests/                        // Testes unitários
│   ├── uClienteTest.pas          // Classe de teste: TTestCliente
│   ├── uPedidoTest.pas           // Classe de teste: TTestPedido
│   └── uProdutoTest.pas          // Classe de teste: TTestProduto
│
├── Views/                        // Formulários e componentes visuais
│   ├── ufCliente.pas             // Classe: TFrmCliente, variável: FrmCliente
│   ├── ufMain.pas                // Classe: TFrmMain, variável: FrmMain
│   ├── ufPedido.pas              // Classe: TFrmPedido, variável: FrmPedido
│   └── ufProduto.pas             // Classe: TFrmProduto, variável: FrmProduto
│
└── Projeto.dpr                   // Projeto principal Delphi
```
