# 🧩 DevExpress

> *Última atualização: 2025-08-05*

DevExpress é um conjunto de ferramentas e componentes para desenvolvimento de software, amplamente utilizado por desenvolvedores .NET. Ele oferece uma variedade de bibliotecas e controles de interface para aplicações desktop (como WinForms e WPF), web (como ASP.NET e Blazor) e relatórios avançados, facilitando a criação de interfaces ricas, interativas e com alta performance. Além disso, o DevExpress inclui ferramentas para análise de dados, gráficos, dashboards e produtividade no Visual Studio, ajudando a acelerar o desenvolvimento e melhorar a experiência do usuário final.

## 📦 TcxCurrencyEdit

O `TcxCurrencyEdit` é um componente da biblioteca DevExpress para Delphi/C++ Builder que permite a edição e exibição de valores monetários com formatação automática de moeda, casas decimais, símbolo e separadores, oferecendo validação e aparência personalizável para campos financeiros.


- `EditingValue` :
  Retorna o valor atual do editor no formato original do dado, geralmente como um tipo numérico (`Variant` contendo `Currency` ou `Double`), refletindo o valor que está sendo editado, mesmo antes da confirmação ou validação final. **Importante:** quando o valor for `0.0`, a propriedade pode apresentar comportamento inesperado ou até gerar erro, pois o componente pode tratar zero como valor "vazio" ou inválido. Dessa forma, o uso de `EditingValue` é mais seguro para valores maiores que zero, e para casos em que zero for um valor válido, recomenda-se verificar também a propriedade `Text` como fallback para evitar erros.

- `Text` :
  Retorna o conteúdo exibido no controle como uma string formatada, ou seja, o texto visível para o usuário, que já inclui a formatação monetária, separadores de milhar, casas decimais e símbolo da moeda (se configurado). Esse valor pode ser diferente do `EditingValue` durante a edição, pois reflete a apresentação visual.
