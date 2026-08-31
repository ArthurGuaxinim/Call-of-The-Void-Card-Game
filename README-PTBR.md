# Call of the Void Card Game
Chamado do Vazio Guerra de Cartas

Bem-vindo ao repositório do nosso Card Game! Este arquivo serve como o **Game Design Document (GDD)** principal, detalhando os aspectos técnicos, mecânicas de gameplay e regras do jogo.

---

## Aspectos Técnicos

*   **Engine:** [Godot Engine](https://godotengine.org/)
*   **Linguagem de Programação:** A definir (Inicialmente C ou C#)
*   **Softwares de Design:** Krita (Open Source) e outros a definir conforme a necessidade.

---

## Visão Geral do Jogo

Um jogo de cartas (Card Game) focado em estratégia e baseado em turnos, fortemente inspirado no clássico *Adventure Time Card Wars*.

### O Tabuleiro
O campo de batalha é dividido em **4 territórios** distintos.
* Os jogadores devem obrigatoriamente usar cartas de **Terreno** para compor o campo.
* Cada carta de terreno possui atributos únicos e define o elemento daquela área.

---

## Mecânicas Principais

### Sistema de Mana e Fluxo de Cartas
*   **Mana Inicial:** O jogador começa a partida com 6 de mana.
*   **Recuperação por Turno:** Recupera-se de 2 a 3 de mana por turno (valor exato em balanceamento). A mana é o recurso essencial para a utilização de cartas.
*   **Compra de Cartas:** A cada turno, o jogador adquire **2 cartas aleatórias** de seu deck construído.
*   **Descarte e "Morte":** Cartas utilizadas são removidas do deck e da mão no momento do uso. Como o campo é "vivo", as criaturas passam a "viver" ali dentro durante a partida, justificando o fato de não retornarem ao deck.

### Tipos de Cartas

#### 1. Terrenos (Obrigatórios)
*   O jogador precisa ter **no mínimo 1 carta de terreno** em campo para poder entrar em combate.
*   **Função:** Define a estética e o elemento do território.
*   **Sinergia (Adepto Elemental):** Colocar 4 cartas do mesmo elemento em campo concede um *buff* poderoso às cartas daquele elemento.
*   **Conflito Elemental (Debuff):** Utilizar cartas de elementos opostos no mesmo terreno ou em decks não otimizados gera *debuffs* (ex: menos dano, menos defesa ou menos vida, dependendo da carta).
*   **Conceito de Campo Vivo:** O terreno é dinâmico e interage visualmente com as criaturas postas nele.

#### 2. Criaturas
*   As principais unidades de combate, possuindo atributos únicos de **Ataque**, **Defesa** e **Habilidades**.
*   **Design Visual (Base):** O Custo de Mana ficará posicionado à *direita*, com os atributos de Ataque e Defesa na parte *inferior* da carta.

---

## Estrutura dos Turnos

O fluxo da partida acontece em duas grandes fases:

### Fase 1: Preparação Inicial
*   Ambos os jogadores posicionam suas cartas de **Terreno** simultaneamente.
*   Após a definição do campo, o sistema decide **aleatoriamente** qual jogador iniciará o jogo.

### Fase 2: Combate e Ações
A partir desta fase, os turnos se alternam. O turno de cada jogador é subdividido em duas etapas:

1. **Turno de Preparo:**
   *   Total liberdade para posicionar criaturas, instalar estruturas e distribuir cartas no campo.
   *   Realização de ações estratégicas de suporte (que não envolvam ataque).
2. **Turno de Ataque:**
   *   Execução dos ataques planejados na fase de preparo.
   *   Ações focadas em dano direto ou ativação de habilidades específicas (detalhes e limitações a definir).

---
*Nota: Este GDD é um documento vivo e será atualizado ao longo do desenvolvimento do projeto.*
