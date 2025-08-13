# <img src="/wiki/icon/flutter.png" alt="Ícone" width="24"> Flutter

> *Última atualização: 2025-08-12*

O Flutter é um framework da Google para criar aplicativos nativos para iOS, Android, web e desktop usando uma única base de código em Dart. Ele permite construir interfaces visuais modernas e responsivas com desempenho nativo.

## 🗂️ Estrutura

```cpp
projeto/
│
├── android/                          // Código específico do Android (Gradle, Manifest, Java/Kotlin)
│   └── app/build/outputs/            // Output do Android
│       ├── apk/                      // APKs gerados
│       │   └── debug/
│       │       └── app-debug.apk
│       └── bundle/                   // App Bundles (.aab)
│
├── ios/                              // Código específico do iOS (Xcode, Swift/Objective-C)
│   └── build/                        // Output do iOS (IPA, binários Xcode)
│
├── lib/                              // Código Dart principal do app
│   ├── main.dart                     // Ponto de entrada da aplicação
│   └── src/                          // (opcional) código organizado por pastas, ex: screens, widgets, models
│       ├── screens/                  // Telas/pages do app
│       │   └── home_screen.dart
│       ├── widgets/                  // Widgets reutilizáveis
│       │   └── custom_button.dart
│       └── models/                   // Modelos de dados
│           └── user.dart
│
├── build/                            // Output do Flutter em geral
│   ├── linux/                        // Binários Linux (`.out` ou executável)
│   ├── windows/                      // Binários Windows (`.exe`)
│   └── web/                          // Build web (HTML, JS, CSS)
│
├── test/                             // Testes unitários ou widget tests
│   └── widget_test.dart
│
├── pubspec.yaml                      // Configuração do projeto e dependências
├── pubspec.lock                      // Arquivo gerado com versões exatas das dependências
├── README.md                         // Documentação
└── .gitignore                        // Arquivos/pastas ignoradas pelo Git
```
