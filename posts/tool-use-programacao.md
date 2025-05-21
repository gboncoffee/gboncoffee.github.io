<!-- pt :: Interaction as Tool Use em Programação :: 2025-03-16 19:20:42 -->

Quanto ao uso do computador para programar, o design de interfaces (no caso,
principalmente editores de texto, terminais, IDEs, outros programas auxiliares
como compiladores, etc) parece ser guiado principalmente pelo modelo de
_Interaction as Tool Use_.

Como espera-se que programadores sejam usuários "avançados" de computadores, as
ferramentas utilizadas por eles possuem menos enfâse na habilidade de descobrir
como utilizá-las facilmente, na estética e experiência - características que
outros modelos de interação como _Interaction as Experience_ dariam mais enfâse.
Ferramentas de programação buscam ser eficientes para o trabalho ainda que isso
necessite um aprendizado maior para o usuário.

Um conceito que pode ser confundido nesse caso é o de interface invisível. Se as
ferramentas de programação tendem a necessitar aprendizado, elas vão contra esse
conceito do modelo de interação? Acredito que pelo contrário. Editores de texto
para programadores, por exemplo, focam em tornar a tarefa de editar eficiente
através da memória muscular do usuário. Para um usuário iniciante, coisas como
atalhos de teclado de um editor são uma interface bastante perceptível, porém
esses mesmos atalhos serão invisíveis assim que o usuário se acostumar com a
ferramenta.

É preciso lembrar que programadores utilizam essas ferramentas diversas horas
por dia, portanto a abordagem para o design de suas interfaces é
fundamentalmente diferente do design da interface de sistemas que serão
utilizados poucas vezes pelo mesmo indivíduo. Além disso, como citado
anteriormente, espera-se que programadores invistam mais esforço em aprender
melhor o uso das ferramentas computacionais do que outros tipos de usuários de
computadores, justamente pela natureza do trabalho deles.

Percebe-se como tais ferramentas manipulam o comportamento do usuário e
vice-versa. Muitas vezes, elas são desenhadas para serem customizadas de acordo
com as necessidades específicas do usuário, e influenciam seu comportamento de
acordo com o poder oferecido para a realização de cada tarefa que envolve a
programação. Como um exemplo dessa influência, programadores que utilizem
editores que facilitem a navegação entre arquivos podem apresentar uma tendência
maior a criar programas cuja modularização em arquivos apresenta uma topologia
mais complexa, em relação a programadores que utilizam editores que não
facilitam tanto essa tarefa\[1\].

Dessa maneira, podemos analisar o uso das ferramentas de programação através do
modelo de _Interaction as Tool Use_:

1. O modelo enxerga a interação como a ação humana diretamente atuando no mundo.
  No caso da programação, o programador age para alterar o programa, e fazê-lo
  de maneira eficiente é seu objetivo. O programa é a parte do mundo alterada
  pelo programador.

2. O modelo tem como conceitos chave a mediação por ferramentas (isso é, a
  ferramenta como intermédio entre o humano e o objetivo que ele busca alcançar)
  e a atividade como unidade de análise. As ferramentas de programação buscam
  servir como facilitadoras para a edição de programas, e podemos analisar cada
  uma das atividades que a programação envolve individualmente, para entender
  como a interface empodera o usuário para realizar cada uma delas. Essas
  ferramentas utilizam essa análise quando apresentam abordagens distintas sobre
  como empoderar o usuário para realizá-las\[2\].

3. A boa interação no modelo é aquela que amplia a capacidade humana de maneira
  transparente. Editores de texto por exemplo tendem a ampliar a capacidade de
  realizar edições complexas mantendo a interface simples, de uma maneira que,
  com o tempo, o programador adquira memória muscular sobre como realizar as
  tarefas de edição.

4. Podemos utilizar, por exemplo, o conceito de compatibilidade para avaliar
  quão similar é a ação física que o usuário realiza em relação à uma tarefa de
  edição de texto desejada. Por exemplo, utilizar o mouse para selecionar uma
  região do arquivo de texto possui uma alta compatibilidade, pois o usuário
  movimenta a mão proporcionalmente à região que ele deseja selecionar na
  tela\[3\].

\[1\] - Evidentemente não tenho fonte para sustentar essa afirmação.

\[2\] - Um exemplo interessante: a interface do editor de texto pode empoderar o
  usuário para navegar pelo código de uma maneira eficiente empregando um botão
  que salta para a definição de uma função chamada na linha onde está o cursor.
  Mesmo que a função esteja dentro de um módulo, e a organização das definições
  seja uma estrutura de árvore, a interface evita a navegação por toda a árvore,
  indo diretamente a função. Ao contrário da navegação pelos arquivos, pois a
  última não costuma possuir referências a itens em outras regiões da árvore
  inteira.

[3] - Atalhos de teclado costumam ir diretamente contra esse conceito. Eu
  imagino que isso não apresenta "_overhead_ mental" nenhum para usuários
  avançados. Por exemplo, a tecla de seta para a direita possui muita
  similaridade com o ato de movimentar o cursor para a direita. Para um usuário
  experiente de teclado, a ideia de movimentar a mão para acertar essa tecla
  específica se torna invisível (a evidência que eu tenho disso é completamente
  anedótica, baseada no fato de que isso ocorre comigo).

