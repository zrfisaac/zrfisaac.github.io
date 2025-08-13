# 🌐 ASP.Net

> *Última atualização: 2025-08-09*

O ASP.NET é uma tecnologia da Microsoft para criar aplicações web (sites, APIs e sistemas online) usando a linguagem C#. Ele permite gerar páginas dinâmicas, gerenciar requisições HTTP e integrar com bancos de dados de forma fácil e organizada.

## 🗂️ Estrutura

```cpp
ProjetoAspNetMvc/
│
├── Binaries/                      // (opcional) binários compilados
│
├── Controllers/                   // Controladores C# que processam requisições
│   ├── HomeController.cs          // Exemplo de controller padrão
│   └── AccountController.cs       // Exemplo de controller de conta
│
├── Models/                        // Classes de negócio e dados
│   ├── User.cs                    // Exemplo de modelo de usuário
│   └── Product.cs                 // Exemplo de modelo de produto
│
├── Views/                         // Razor Views
│   ├── Shared/                    // Componentes compartilhados
│   │   └── _Layout.cshtml         // Layout principal
│   ├── Home/                      // Views do HomeController
│   │   ├── Index.cshtml           // Página inicial
│   │   └── About.cshtml           // Exemplo de página adicional
│   └── Account/                   // Views do AccountController
│       ├── Login.cshtml
│       └── Register.cshtml
│
├── wwwroot/                       // Arquivos estáticos (CSS, JS, imagens)
│   ├── css/
│   │   └── site.css
│   ├── js/
│   │   └── site.js
│   └── lib/                       // Bibliotecas externas (Bootstrap, jQuery, etc.)
│
├── Properties/
│   └── launchSettings.json        // Configurações de execução/debug
│
├── appsettings.json               // Configurações do app
├── Program.cs                     // Ponto de entrada da aplicação
├── Startup.cs                     // Configuração de middlewares e serviços (opcional em .NET 6+)
├── ProjetoAspNetMvc.csproj        // Arquivo do projeto
└── README.md                      // Documentação opcional
```
