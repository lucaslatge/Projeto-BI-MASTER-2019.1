# Modelo Fuzzy TOPSIS para avaliação de performance de uma frota de navios

#### Aluno: [Lucas Sanches Latgé](https://github.com/lucaslatge)

#### Orientador: Cristian Muñoz
---

Trabalho apresentado ao curso [BI MASTER](https://ica.puc-rio.ai/bi-master) como pré-requisito para conclusão de curso e obtenção de crédito na disciplina "Projetos de Sistemas Inteligentes de Apoio à Decisão".

- [Link para o código](https://github.com/lucaslatge/Projeto-BI-MASTER-2019.1)


---

### Resumo

 

**1.**  **INTRODUÇÃO**

A tomada de decisão é um dos mais importantes processos enfrentados por seres humanos em diferentes atividades. Existindo igualmente tanto em complexos projetos envolvendo diferentes setores de uma empresa como em simples tarefas do dia a dia, como a simples compra de um celular. Em ambos os casos, a avaliação de critérios está presente, cabendo ao tomador de decisão modelar e avaliar corretamente os dados disponíveis, resultando na decisão mais adequada. 

Porém, no mundo real nem sempre as informações disponíveis são precisas e objetivas. Para lidar com os diferentes graus de incerteza na tomada de decisão foram desenvolvidos diferentes métodos que permitem ao especialista modelar seu problema de decisão em termos numéricos, obtendo assim um grau de certeza antes inatingível por uma avaliação subjetiva.

Este projeto aborda a tomada de decisão dentro do cenário da indústria marítima brasileira, mais especificamente em relação a avaliação de performance de uma frota de navios.

 

**2.**  **CONTEXTO DO PROJETO**

Em termos gerais, uma empresa de navegação (armador) mantém e opera uma frota de navios que prestam serviços de transporte aos contratantes (afretadores). Estes navios podem ser dedicados a formas de transporte especificas, como transporte de cargas em contêineres, transporte de carga em tanques, operações de pesquisa, manuseio de âncoras, dentre muitas outras. Na operação destes navios, independente das particularidades de cada um, há indicadores comuns que são monitorados e avaliados permanentemente pelas empresas. Estes indicadores são utilizados como parâmetro para definir estratégias e basear decisões, funcionando como um medidor da condição operacional e da adequação de cada navio às diretrizes e metas definidas pela gestão. 

Todas as empresas de navegação estão sujeitas às mesmas circunstâncias operacionais e monitoram basicamente os mesmos indicadores, como por exemplo consumo de combustível dos navios, custo com tripulação, número de acidentes, etc. Porém, quando se analisa individualmente a gestão destas empresas, pode-se observar que cada uma possui metas e políticas particulares, dando mais ênfase a certos aspectos operacionais em detrimento de outros. Dessa forma, pode-se facilmente inferir que um mesmo indicador gerado por um navio não necessariamente será tratado da mesma forma por empresas diferentes.

Partindo desse princípio, foi realizado um levantamento de mercado entre empresas armadoras e afretadoras de navios no Brasil, mais especificamente navios empregados na atividade de apoio marítimo. Esta atividade consiste na prestação de serviços para as plataformas de petróleo localizadas nas bacias produtoras. Entre os principais afretadores de navios de apoio marítimo no Brasil estão grandes players globais do setor de óleo e gás, como Petrobras, Shell, Total, Repsol e Equinor. Entre os armadores, existem uma diluição do mercado entre as empresas nacionais, como CBO, Wilson Sons e OceanPact e importantes multinacionais do setor marítimo, como DOF, Edson Chouest e Solstad.

A partir deste levantamento foi possível perceber que não há entre as empresas questionadas um modelo matemático estabelecido para avaliar a performance de suas embarcações, sejam elas próprias ou contratadas. Não há consenso sobre a melhor metodologia a ser aplicada e de que forma utilizar a grande quantidade de dados gerados diariamente pelos navios. Por fim, não há um método em uso que seja capaz de traduzir numericamente a subjetividade das avaliações de cada critério definidas pela gestão de diferentes empresas.

 

**3.**  **OBJETIVO**

Este trabalho consistiu no desenvolvimento de um modelo para cálculo de performance de uma frota de navios através do método Fuzzy TOPSIS. O modelo desenvolvido busca atender a demanda do mercado por uma ferramenta que considere tanto os aspectos quantitativos (numéricos) quanto os subjetivos (opiniões dos especialistas) na execução do cálculo.



**4.**  **METODOLOGIAS**

*a.*  *Lógica Fuzzy*

Seres humanos sempre precisam tomar decisões. Se os tomadores de decisão utilizarem a lógica tradicional, tais decisões serão do tipo sim ou não, preto ou branco, bom ou ruim, 1 ou 0. Porém, problemas reais não existem nestes termos absolutos. Em outras palavras, entre a definição de uma cor em preta ou branca, existem diversos tons de cinza, conforme ilustra a Figura 1 abaixo.
\
\
\
​				![logica](https://github.com/lucaslatge/imagens/blob/main/logica.JPG?raw=true) 

​								**Figura 1:** Exemplo de definição de categoria utilizando lógica fuzzy
\
\
\
A partir desta definição, estudos acadêmicos buscaram encontrar uma forma de incluir a incerteza no processo de tomada de decisão. A lógica Fuzzy é um destes métodos científicos encontrados [1].    

A lógica Fuzzy é uma técnica robusta para determinação e resolução de problemas reais complexos, onde existe incerteza e indefinição. Ao utilizar graus de pertinência ao invés de valores absolutos, a lógica fuzzy proporciona ao tomador de decisão a possibilidade de usar valores intervalares na resolução de problemas, o que faz com que o problema matemático seja retratado de forma mais precisa e próxima da realidade. Conforme observa-se na figura 2 abaixo, a expressão de um simples problema do mundo real, como é a configuração de temperatura da água, tem um resultado mais próximo do esperado ao se utilizar a lógica fuzzy. 
\
\
\
​										![agua](https://github.com/lucaslatge/imagens/blob/main/agua.JPG?raw=true) 

​										**Figura 2:** Expressão de problema real através da lógica fuzzy



Na Figura 3, pode-se observar um exemplo de função de pertinência dentro de um problema de definição de idade. Utilizando a lógica convencional, um tomador de decisão ficará restrito a uma única escolha para caracterizar determinado valor, como por exemplo, fazendo um inferência do tipo “uma pessoa de 30 anos é de Meia-Idade”. Porém, utilizando a lógica fuzzy, esta mesma definição pode ser mais abrangente e próxima do mundo real. Nesta situação, uma pessoa de 30 anos pode pertencer ao mesmo tempo a categoria de “Jovem” e “Meia-Idade”. 



​								![pert](E:\Users\DELL PC\Desktop\Arquivos GitHub\pert.JPG ) 

 															**Figura 3:** Exemplo de Função de Pertinência

 

Utilizando este método é possível modelar problemas de forma muito mais intuitiva e próxima ao raciocínio humano.



*b.*  *MCDM*

Tomada de decisão com múltiplos critérios (MCDM - Multiple Criteria Decision Making) é um dos ramos mais consideráveis da ciência da tomada de decisão (DM – Decision Making). Os métodos MCDM abrangem a tomada de decisão na presença de critérios múltiplos e algumas vezes conflitantes.

Um modelo MCDM é uma ferramenta eficaz para solução de problemas complexos que envolvem critérios qualitativos e quantitativos com várias alternativas de escolha. Critérios qualitativos são vagos e de difícil tradução numérica, tornando desafiadora sua inclusão em modelos de tomada de decisão. Através do MCDM é possível quantificar esses critérios, calcular um pontuação para cada alternativa e dessa forma auxiliar os tomadores de decisão a encontrar a alternativa ótima para o problema em questão.

Atualmente há estudos nas mais variadas áreas para aplicação de métodos MCDM. Alguns métodos comumente utilizados são AHP (Analytic Hierarchy Process), ANP (Analytic Network Process), TOPSIS (*Technique for Order of Preference by Similarity to Ideal Solution)*, Fuzzy AHP, Fuzzy ANP, Fuzzy TOPSIS, Análise Envoltória de Dados (DEA – Data Envelopment Analysis) e Fuzzy DEA.

Processos de cálculo de performance podem ser altamente complexos de se modelar utilizando modelos matemáticos simples, pois envolvem diversos dados e critérios subjetivos. É necessário que um modelo traduza precisamente a intenção do tomador de decisão ao realizar o cálculo, evitando que sejam geradas contradições na classificação dos critérios. Dessa forma, o modelo de cálculo de performance deste projeto é considerado um processo MCDM, sendo necessário empregar um método adequado de tomada de decisão para alcançar o resultado desejado.

 

*c.*  *TOPSIS*

A Técnica para Ordem de Preferência por Similaridade a Solução Ideal (TOPSIS) é atualmente um dos métodos mais populares de MCDM e tem sido aplicada com sucesso nas mais diversas áreas. Este método foi inicialmente desenvolvido por Hwang and Yoon [2] em 1981 para a solução de problemas MCDM e tem como princípio básico a seleção da alternativa com a menor distância da solução ideal positiva (a melhor opção) e a maior distância da solução ideal negativa (a pior opção). Usando normalização de vetores e aplicando pesos aos critérios avaliados, o método tem por finalidade ranquear as alternativas pelo valor obtido de Coeficiente de Proximidade (Closeness Coefficient – CCi). Este coeficiente indica as melhores alternativas dentro do cenário proposto, considerando os critérios e pesos definidos pelos especialistas.



*d.*  *Fuzzy TOPSIS*

A extensão do método TOPSIS para um ambiente fuzzy foi proposta inicialmente por Chen [3], utilizando números fuzzy triangulares para substituir os valores numéricos das escalas linguísticas de peso. Através dele, o grau de importância dos pesos dos vários critérios avaliados é expresso por valores linguísticos. Estes valores linguísticos são então traduzidos para números fuzzy triangulares. A tabela abaixo ilustra um exemplo de conversão de valores linguísticos para números fuzzy triangulares.

 

**Tabela 1:** Conversão de valores linguísticos para números fuzzy triangulares

|                        | **Limite Inferior** | **Limite Médio** | **Limite Superior** |
| :--------------------: | :-----------------: | :--------------: | :-----------------: |
| **Extremamente Baixo** |          0          |        0         |         0,1         |
|    **Muito Baixo**     |          0          |       0,1        |         0,3         |
|       **Baixo**        |         0,1         |       0,3        |         0,5         |
|       **Médio**        |         0,3         |       0,5        |         0,7         |
|        **Alto**        |         0,5         |       0,7        |         0,9         |
|     **Muito Alto**     |         0,7         |       0,9        |          1          |
| **Extremamente Alto**  |         0,9         |        1         |          1          |

 

**5.**  **DESENVOLVIMENTO DO ALGORITMO**

O método Fuzzy TOPSIS utiliza uma matriz de decisão que contém as alternativas e os critérios a serem avaliados. A partir dessa matriz inicial, são aplicados os cálculos subsequentes para chegar ao resultado final, o Coeficiente de Proximidade (CCi), que expressará numericamente a melhor alternativa disponível.    

A seguir se encontra o detalhamento de cada etapa executada pelo algoritmo do modelo de cálculo de performance:

 

**1.** A base de dados contendo as alternativas e critérios é importada para o modelo. Essa base de dados obrigatoriamente deverá ser no formato:



**Tabela 2:** Formato da base de dados lida pelo modelo

|  **Navio**  | **Critério 1** | **Critério 2** | **...** | **Critério N** |
| :---------: | :------------: | :------------: | :-----: | :------------: |
| **Navio 1** |                |                |         |                |
| **Navio 2** |                |                |         |                |
|   **...**   |                |                |         |                |
| **Navio N** |                |                |         |                |



Os critérios que serão utilizados no cálculo de performance são selecionados e então é criada a matriz de decisão.



**2.** É realizada a normalização linear da matriz de decisão para tornar os dados adimensionais.

Sendo D=x*ij* a matriz de decisão criada, onde x*ij* pertence a ℝ.

![eq1](E:\Users\DELL PC\Desktop\Arquivos GitHub\eq1.JPG)

Os elementos da matriz normalizada são definidos conforme a expressão abaixo:

 													![eq2](E:\Users\DELL PC\Desktop\Arquivos GitHub\eq2.JPG)



 **3.** É realizada a definição de cada critério como beneficial ou não-beneficial. Esta definição é essencial para que em uma etapa posterior o algoritmo aplique o cálculo correto conforme a classificação atribuída a cada critério. Para um critério beneficial, quanto maior o valor, melhor. Para um critério não-beneficial, quanto menor o valor, melhor. 

 

**4.** São atribuídos valores linguísticos de importância para cada critério avaliado utilizando a escala abaixo:

 

**Tabela 3:** Valores linguísticos de peso

| **Extremamente Baixo** | **EB** |
| :--------------------: | :----: |
|    **Muito Baixo**     | **MB** |
|       **Baixo**        | **B**  |
|       **Médio**        | **M**  |
|        **Alto**        | **A**  |
|     **Muito Alto**     | **MA** |
| **Extremamente Alto**  | **EA** |

 

**5.** Os valores linguísticos são convertidos para números fuzzy triangulares, conforme a tabela a seguir.



**Tabela 4:** Escala de conversão dos pesos linguísticos para números fuzzy triangulares

|                        | **Limite Inferior** | **Limite Médio** | **Limite Superior** |
| :--------------------: | :-----------------: | :--------------: | :-----------------: |
| **Extremamente Baixo** |          0          |        0         |         0,1         |
|    **Muito Baixo**     |          0          |       0,1        |         0,3         |
|       **Baixo**        |         0,1         |       0,3        |         0,5         |
|       **Médio**        |         0,3         |       0,5        |         0,7         |
|        **Alto**        |         0,5         |       0,7        |         0,9         |
|     **Muito Alto**     |         0,7         |       0,9        |          1          |
| **Extremamente Alto**  |         0,9         |        1         |          1          |

 

As funções de pertinência correspondentes a cada valor linguístico são definidas conforme ilustra a figura abaixo:

![pert func](E:\Users\DELL PC\Desktop\Arquivos GitHub\pert func.JPG)

​								**Figura 4:** Funções de pertinência correspondentes aos pesos linguísticos.

 

Dessa forma, um peso fuzzy correspondente por exemplo a uma avaliação *Médio (M)* é representado pelo número fuzzy triangular *A=[0.3 , 0.5 , 0.7]*.



**6.** São aplicados os pesos fuzzy (*w*) correspondentes aos elementos da matriz normalizada, obtendo-se dessa forma a matriz normalizada com pesos.

 ![eq4](E:\Users\DELL PC\Desktop\Arquivos GitHub\eq4.JPG) 

Onde *Ñ*ij=(*wj1Nij, wj2Nij, wj3Nij*), sendo i=1,...,m e j=1,...,n.

 

**7.** Calcula-se a Solução Fuzzy Ideal Positiva (*Fuzzy Positive Ideal Solution - FPIS*), representada por Ãj+ e a Solução Fuzzy Ideal Negativa (*Fuzzy Negative Ideal Solution - FNIS*), representada por Ãj-

\- Para um critério beneficial (B), a solução ideal positiva (Ãj+) será o maior valor encontrado entre os critérios e a solução ideal negativa (Ãj-) será o menor valor encontrado.

\- Para um critério não-beneficial (NB), a solução ideal positiva (Ãj+) será o menor valor encontrado entre os critérios e a solução ideal negativa (Ãj-) será o maior valor encontrado.

 							![eq5](E:\Users\DELL PC\Desktop\Arquivos GitHub\eq5.JPG) 

 **8.** As distâncias euclidianas de cada alternativa para FPIS (representada por Si+) e para FNIS (representada por Si-) são calculadas através da fórmula:

![eq6](E:\Users\DELL PC\Desktop\Arquivos GitHub\eq6.JPG)

onde *d(. , .)* representa a distância entre dois números fuzzy triangulares [al, am, au] e  [bl, bm, bu], calculada por:

![eq7](E:\Users\DELL PC\Desktop\Arquivos GitHub\eq7.JPG)

**9.** Computa-se o coeficiente de proximidade CCi:

 												![eq8](E:\Users\DELL PC\Desktop\Arquivos GitHub\eq8.JPG)	 

**10.** Com os valores de CCi computados, é feito o ranqueamento das alternativas.

 

**6.**  **DESENVOLVIMENTO DA SOLUÇÃO**

Para o desenvolvimento do modelo de avaliação de performance da frota foi empregado o método Fuzzy TOPSIS. A plataforma selecionada para o desenvolvimento do código do algoritmo foi o software MATLAB, pela forma otimizada que esta ferramenta trabalha com cálculos envolvendo matrizes e pelos recursos disponíveis para a criação de uma aplicação executável fora da plataforma.

Para alimentar e testar o modelo foi criada uma base de dados sintéticos relativos à diferentes aspectos da operação de uma frota de embarcações, conforme exibido no Anexo I. Para situar o problema dentro do contexto do mercado marítimo, foi estabelecido que a base de dados utilizada seria referente a uma frota de 6 navios e foram definidos 15 critérios de diferentes áreas operacionais para aplicação no modelo. Os critérios definidos foram: 

 

·     Número de acidentes

·     Média das notas do BAD (Boletim Avaliação de Desempenho)

·     Número de pendências em inspeções

·     Custo com despesas portuárias

·     Consumo de combustível

·     Consumo de óleo lubrificante

·     Consumo de água

·     Custo com tripulação (salário e encargos)

·     Volume de lixo descartado para terra

·     Volume de lixo orgânico despejado no mar

·     Valor da diária do navio

·     Custo com rancho (alimentos, produtos de higiene e limpeza)

·     Total de horas em downtime (fora de operação)

·     Tempo de contrato

·     Taxa de retenção da tripulação

 

Devido ao caráter complexo dos cálculos envolvidos, uma das metas deste projeto foi tentar democratizar a forma como este modelo pode ser utilizado pelas empresas. Buscou-se manter uma interface inteligível para o usuário comum, sem necessidade de conhecimento de linguagens de programação, softwares específicos ou grandes modificações para configurar o modelo aos seus requisitos. Para alcançar tal objetivo, o modelo foi compilado em uma aplicação executável, visualmente amigável e de uso intuitivo.



**7.**  **RESULTADOS**

O modelo de performance Fuzzy TOPSIS desenvolvido neste projeto, onde a opinião dos especialistas de cada empresa acerca dos critérios avaliados é levada em consideração, permite uma análise mais precisa da performance da frota dentro dos parâmetros definidos nas políticas e metas definidas por cada empresa. Uma empresa X pode, por exemplo, dar mais importância para as emissões de gases poluentes pelos seus navios do que para o custo com a tripulação, o que não significa que todas as empresas adotem essa mesma postura. Uma outra empresa Y pode, por exemplo, estar comprometida financeiramente e adotou uma política rígida de redução de custos. Esta empresa Y, neste mesmo cenário, poderá dar uma importância muito maior aos custos com a tripulação em detrimento das emissões de gases poluentes.

Foram realizadas dezenas de simulações utilizando a solução desenvolvida e pôde-se notar que a performance de uma mesma embarcação pode variar dramaticamente dependendo da opinião dos especialistas acerca da importância do critério avaliado e também de quais critérios são selecionados para a comparação.

Abaixo segue um exemplo de uma das simulações, onde foram utilizados todos os 15 critérios disponíveis na base de dados. Neste exemplo foram testadas duas percepções de gestão diferentes, a primeira mais generalista, com as avaliações dos especialistas tendo foco numa operação atendendo aos padrões de conformidade e segurança. A segunda percepção teve um foco direcionado para a redução de custos, onde foi atribuída uma maior importância a critérios que envolvessem perda ou ganho financeiro.



​				 	**Avaliação 1 - Generalista**												**Avaliação 2 - Redução de Custos**

|               **Critérios**               | **Peso** |      |               **Critérios**               | **Peso** |
| :---------------------------------------: | :------: | ---- | :---------------------------------------: | :------: |
|           Número  de acidentes            |    EA    |      |           Número  de acidentes            |    MA    |
|          Média  das notas do BAD          |    A     |      |          Média  das notas do BAD          |    M     |
|    Número  de pendências em inspeções     |    B     |      |    Número  de pendências em inspeções     |    M     |
|      Custo  com despesas portuárias       |    A     |      |      Custo  com despesas portuárias       |    MA    |
|          Consumo  de combustível          |    M     |      |          Consumo  de combustível          |    A     |
|       Consumo  de óleo lubrificante       |    M     |      |       Consumo  de óleo lubrificante       |    A     |
|             Consumo  de água              |    M     |      |             Consumo  de água              |    A     |
|           Custo  com tripulação           |    M     |      |           Custo  com tripulação           |    EA    |
|   Volume  de lixo descartado para terra   |    M     |      |   Volume  de lixo descartado para terra   |    A     |
| Volume  de lixo orgânico despejado no mar |    MB    |      | Volume  de lixo orgânico despejado no mar |    B     |
|         Valor  da diária do navio         |    MA    |      |         Valor  da diária do navio         |    EA    |
|             Custo  com rancho             |    M     |      |             Custo  com rancho             |    MA    |
|        Total  de horas em downtime        |    MA    |      |        Total  de horas em downtime        |    EA    |
|            Tempo  de contrato             |    EB    |      |            Tempo  de contrato             |    A     |
|      Taxa  de retenção da tripulação      |    MA    |      |      Taxa  de retenção da tripulação      |    M     |

 

 															**Ranking resultante da Avaliação 1**

![rank1](E:\Users\DELL PC\Desktop\Arquivos GitHub\rank1.jpg)

 

 															**Ranking resultante da Avaliação 2**

![rank2](E:\Users\DELL PC\Desktop\Arquivos GitHub\rank2.jpg)



Através dessa simulação foi possível notar que a percepção de quais navios têm a melhor performance na frota pode mudar completamente dependendo da forma de avaliação dos critérios envolvidos na análise. Uma mudança de direção na gestão da empresa, um acidente envolvendo uma embarcação da frota, uma mudança no mercado, todos estes fatores podem exercer influência na definição do grau de importância dos critérios, afetando consequentemente a performance das embarcações dentro deste novo cenário.

Na simulação acima, em um cenário normal de mercado, o Navio E foi o que apresentou a melhor performance. Porém, ao dar mais ênfase ao aspecto financeiro, simulando por exemplo um período de crise na indústria marítima, o Navio B foi o que apresentou a melhor performance. Este mesmo navio, na primeira avaliação, ficou em 2º lugar no ranking.

Realizando uma terceira simulação, utilizando exatamente os mesmos pesos da Avaliação 1, porém selecionando apenas os critérios operacionais não relacionados a custo ou receita (número de acidentes, média das notas do BAD, pendências em inspeções, volume de lixo descartado, volume de lixo orgânico descartado e taxa de retenção da tripulação), obtém-se um ranking de performance consideravelmente diferente, conforme observado abaixo:

 

 					**Ranking resultante da Avaliação 3 - Apenas critérios operacionais selecionados**

![rank3](E:\Users\DELL PC\Desktop\Arquivos GitHub\rank3.jpg)



É possível realizar simulações de diferentes maneiras utilizando este modelo. Pode-se por exemplo avaliar a performance da frota utilizando critérios relacionados apenas a uma única área operacional, como “Meio Ambiente” ou “Tripulação”. Dessa forma é possível que a ferramenta seja utilizada tanto de forma unificada pela empresa, aplicando todas as suas políticas em vigor quanto por departamentos isolados que buscam entender como suas ações estão impactando a performance geral da frota. 



**8.**  **CONCLUSÃO**

A indústria marítima ainda vive o início da transição para a era digital. A tradicionalidade sempre foi um traço muito marcante dessa indústria, onde mudanças e renovações na forma de gestão do negócio nem sempre são bem aceitas e adotadas amplamente. Porém, no cenário que existe atualmente, com milhares de dados sendo gerados a cada minuto na operação de navios, há uma oportunidade incrível para aplicação de ferramentas de interpretação e análise de dados. Se aplicados da forma correta, estes dados podem proporcionar uma percepção sobre aspectos do negócio que antes não se considerava ou simplesmente não se sabia que existiam. 

O desenvolvimento e a difusão do uso de soluções como esta vai proporcionar à indústria marítima a possibilidade de evoluir a forma como se gerencia uma frota de navios, com ferramentas para transformar dados em uma base para tomada de decisão, entendendo falhas e planejando ações futuras tendo a precisão e confiança de indicadores matemáticos. 



**REFERÊNCIA BIBLIOGRÁFICA**

[1] Zadeh, L.A. Fuzzy sets. Information and control, vol. 8, pp. 338–353, 1965.

[2] C. L. Hwang and K. Yoon, “Multi Attribute Decision Making Methods and Applications,” Springer-Verlag, Berlin Heidelberg, 259 p, 1981.

[3] Chen-Tung Chen, “Extensions of the TOPSIS for Group Decision-Making under Fuzzy Environment,” Volume 114, Issue 1, Pages 1-9, 2000.

[4] Chen, C.T.; Lin, C.T.; Huang, S.F. A fuzzy approach for supplier evaluation and selection in supply chain management. Int. J. Prod. Econ., 102, 289–301, 2006.

[5] Wang, T.C.; Chang, T.H. Application of TOPSIS in evaluating initial training aircraft under a fuzzy environment. Expert Syst. Appl. 33, 870–880, 2007.

[6] A. A. Bazzazi, M. Osanloo and H. Soltanmohammadi, “Loading-haulage equipment selection in open pit mines based on Fuzzy-TOPSIS method,” Gospodarka Surowcami Mineralnymi-Mineral Resources Management, vol. 24, pp. 87–102, 2008.

[7] A. Lashgari, A. Yazdani-Chamzini, M. M. Fouladgar, E. K. Zavadskas, S. Shafiee and N. Abbate, “Equipment selection using fuzzy multi criteria decision making model: key study of Gole Gohar iron mine,” Inzinerine Ekonomika-Engineering Economics, vol. 23, pp. 125–136, 2012.

[8] İhsan Kaya, Murat Çolak, Fulya Terzi, “A comprehensive review of fuzzy multi criteria decision making methodologies for energy policy making”, Energy Strategy Reviews, vol. 24, pp 207-228, 2019.

[9] Cengiz Kahraman, Fuzzy Multi-Criteria Decision Making - Theory and Applications with Recent Developments, Springer US, vol. 16, 2008.



 

---

Matrícula: 191.477.009

Pontifícia Universidade Católica do Rio de Janeiro

Curso de Pós Graduação *Business Intelligence Master*
