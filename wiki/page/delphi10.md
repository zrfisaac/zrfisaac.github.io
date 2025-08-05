# 🏛️ Delphi 10

> *Última atualização: 2025-08-05*

O Delphi 10, parte da linha de produtos da Embarcadero, é um ambiente de desenvolvimento rápido (RAD) voltado principalmente para aplicações desktop, móveis e web, com suporte a múltiplas plataformas como Windows, macOS, iOS, Android e Linux. Ele utiliza a linguagem Object Pascal e oferece um conjunto robusto de componentes visuais (VCL e FireMonkey), permitindo a criação de interfaces ricas com pouco esforço de codificação. Além disso, o Delphi 10 trouxe melhorias significativas em performance, conectividade com banco de dados, suporte a alta DPI, integração com APIs modernas e ferramentas de depuração avançadas, sendo uma escolha sólida para desenvolvedores que buscam produtividade e compatibilidade multiplataforma.

## 🔢 Currency

No Delphi 10, o tipo `Currency` é um tipo de dado numérico especializado para operações financeiras e cálculos que exigem alta precisão com valores decimais fixos. Ele utiliza uma representação interna de ponto fixo com quatro casas decimais (escala de 10.000), o que evita erros de arredondamento comuns em tipos de ponto flutuante como `Double` ou `Single`. Internamente, o `Currency` é armazenado como um valor `Int64`, representando a quantia multiplicada por 10.000, garantindo precisão em transações monetárias. Esse tipo é ideal para aplicações que lidam com valores financeiros, como sistemas de vendas, contabilidade ou faturamento, onde cada centavo importa.

## 🔢 Funções

- **fnTipoDaVariavel**

```pascal
uses
  Variants, SysUtils;

function fnTipoDaVariavel(const _pVariavel: Variant): string;
var
  _vTipo: Word;
begin
  _vTipo := VarType(_pVariavel) and varTypeMask;

  case _vTipo of
    varEmpty:    Result := 'Empty';
    varNull:     Result := 'Null';
    varSmallint: Result := 'Smallint';
    varInteger:  Result := 'Integer';
    varSingle:   Result := 'Single';
    varDouble:   Result := 'Double';
    varCurrency: Result := 'Currency';
    varDate:     Result := 'Date';
    varOleStr:   Result := 'OleStr';
    varBoolean:  Result := 'Boolean';
    varVariant:  Result := 'Variant';
    varShortInt: Result := 'ShortInt';
    varByte:     Result := 'Byte';
    varString:   Result := 'String';
    varInt64:    Result := 'Int64';
  else
    Result := 'Desconhecido';
  end;
end;
```
