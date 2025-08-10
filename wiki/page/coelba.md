# <img src="/wiki/icon/coelba.png" alt="Ícone" width="24"> Coelba (Neoenergia)

> *Última atualização: 2025-08-10*

A Coelba — Companhia de Eletricidade do Estado da Bahia — é a principal distribuidora de energia elétrica na Bahia, responsável por fornecer energia para milhões de consumidores residenciais, comerciais e industriais. Faz parte do grupo Neoenergia, um dos maiores conglomerados do setor elétrico no Brasil, que atua também em geração e transmissão de energia. A Coelba cuida desde a geração até a entrega da eletricidade, garantindo o fornecimento, a manutenção da rede e o atendimento ao cliente, além de implementar projetos para melhorar a eficiência e a sustentabilidade do sistema elétrico na região.

| Item                   | Unidade | Quantidade | Preço Unit. com Trib. (R\$) | Valor (R\$) | PIS/COFINS (R\$) | Base Cálc. ICMS (R\$) | Alíquota ICMS (%) | ICMS (R\$) | Tarifa Unit. (R\$) |
| ---------------------- | ------- | ---------- | --------------------------- | ----------- | ---------------- | --------------------- | ----------------- | ---------- | ------------------ |
| Consumo-TUSD           | kWh     |     200,00 |                        0,70 |      140,00 |             7,00 |                140,00 |             18,00 |      25,20 |               0,70 |
| Consumo-TE             | kWh     |     200,00 |                        0,35 |       70,00 |             3,50 |                 70,00 |             18,00 |      12,60 |              0,27  |
| Acrésc. Band Vermelha  | kWh     | -          | -                           |       12,00 |             0,60 |                 12,00 |             18,00 |       2,16 |                    |
| Acrésc. Bd Vermelha-P2 | kWh     | -          | -                           |        4,00 |             0,20 |                  4,00 |             18,00 |       0,72 |                    |
| Ilum. Púb. Municipal   | -       | -          | -                           |       30,00 |                  |                       |                   |            |                    |
| Itaipu-A21-L10438/02   | -       | -          | -                           |      -15,00 |                  |                       |                   |            |                    |
| `Total`                |         |            |                             |     `241,80`|                  |                       |                   |            |                    |

- `Consumo-TUSD:`
  Cobrança pelo uso da rede da distribuidora.
  Cálculo:

  $$
  \text{Valor} = \text{Quantidade (kWh)} \times \text{Preço Unitário com Tributos}
  $$

- `Consumo-TE:`
  Cobrança pelo custo da energia consumida.
  Cálculo:

  $$
  \text{Valor} = \text{Quantidade (kWh)} \times \text{Preço Unitário com Tributos}
  $$

- `Acrésc. Band Vermelha:`
  Acréscimo aplicado durante o período da bandeira vermelha, para cada kWh consumido, aumentando o custo da energia.
  Geralmente é um valor fixo somado à fatura conforme o consumo total.
  Cálculo:

  $$
  \text{Valor} = \text{Quantidade (kWh)} \times \text{Tarifa Adicional por kWh}
  $$

- `Acrésc. Bd Vermelha-P2:`
  Acréscimo aplicado no horário de pico (P2) durante a bandeira vermelha, para cada kWh consumido nesse período.
  Cálculo:

  $$
  \text{Valor} = \text{Quantidade no P2 (kWh)} \times \text{Tarifa Adicional P2}
  $$

- `Ilum. Púb. Municipal:`
  Taxa cobrada pelo município para iluminação pública, geralmente fixa ou variável, mas não calculada diretamente sobre o consumo.
  Pode ser uma tarifa fixa ou calculada com base em regras locais.

- `Itaipu-A21-L10438/02:`
  Encargo relacionado à usina de Itaipu, que pode ser um desconto ou acréscimo aplicado na fatura.
  Normalmente calculado proporcionalmente ao consumo em kWh.
  Cálculo:

  $$
  \text{Valor} = \text{Quantidade (kWh)} \times \text{Tarifa Itaipu}
  $$


- `ICMS:` (Imposto sobre Circulação de Mercadorias e Serviços)
  Calculado sobre a base de cálculo, que normalmente é o valor do item sem impostos diretos.

  $$
  \text{ICMS} = \text{Base de Cálculo ICMS} \times \frac{\text{Alíquota ICMS (\%)}}{100}
  $$

- `PIS:` (Programa de Integração Social) e COFINS (Contribuição para o Financiamento da Seguridade Social)
  São tributos federais calculados sobre o valor bruto do item (antes do ICMS).
  Geralmente aplicados com alíquotas somadas, e aparecem juntos na fatura.

  $$
  \text{PIS/COFINS} = \text{Valor do Item} \times \text{Alíquota PIS/COFINS}
  $$
