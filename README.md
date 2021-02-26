# Projeto-BI-MASTER-2019.1
Projeto de conclusão de curso do BI MASTER 2019.1 - PUC Rio

INTRODUÇÃO:

O foco deste projeto é o desenvolvimento de uma solução que atenda a demanda do setor de apoio marítimo por um método preciso de avaliação da performance de uma frata de navios, inserindo no modelo a relevância de cada critério conforme for definido pela empresa e suas políticas internas.

Todas as empresas operadoras de navios estão sujeitas as mesmas circunstâncias operacionais e monitoram os mesmos indicadores relativos aos seus navios, como por exemplo consumo de combustível, custo com tripulação, valor da diária do navio, entre outros. Porém, quando se analisa a operação destas empresas individualmente, pode-se observar que cada uma possui metas e políticas específicas, dando mais ênfase a certos aspectos operacionais em detrimento de outros. Dessa forma, pode-se facilmente inferir que os indicadores relativos a um mesmo navio não necessariamente são tratados da mesma forma por empresas diferentes.

Partindo desse princípio, este trabalho busca estabelecer um modelo onde a opinião dos especialistas de cada empresa acerca dos indicadores dos navios é considerada no cálculo, possibilitando uma análise mais precisa da performance da frota de acordo com as políticas e metas definidas. Uma empresa X pode por exemplo dar mais importância para as emissões de gases poluentes pelos seus navios do que para o custo com a tripulação, o que não implica que todas as empresas adotem essa postura. Uma outra empresa Y pode, por exemplo, estar comprometida financeiramente e adotou uma política rígida de redução de custos. Esta empresa Y, no mesmo cenário proposto para a empresa X, poderá dar uma importância muito maior aos custos com a tripulação em detrimento das emissões de gases poluentes.

O modelo desenvolvido busca atender a essas demandas e considerar tanto os aspectos objetivos (numéricos) quanto os subjetivos (opiniões dos especialistas) no cálculo da performance da frota.


METODOLOGIA:

Para o desenvolvimento desta solução serão necessários dados de diversas categorias envolvidas nas operações de uma embarcação. Para tornar a coleta destes dados mais prática, foi desenvolvido um portal online, através do qual as tripulações são capazes de inserir os dados necessários. Estes dados são então armazenados num SGBD desenvolvido em PostgreSQL para consultas.

Para o desenvolvimento do modelo para a avaliação de performance da frota, será utilizado o método Fuzzy TOPSIS. Em termos gerais, este método busca ranquear as alternativas através do cálculo da distância euclidiana de cada critério para o seu valor ideal. Será utilizado o MATLAB para a criação do código.
>>> ELABORAR MAIS <<<

A partir do banco de dados, será gerado o arquivo csv (???) contendo os critérios, os pesos atribuídos a cada critério e as alternativas (navios). Este arquivo irá alimentar o modelo Fuzzy TOPSIS. 

Buscando facilitar a interface com o usuário, o modelo foi inserido em um programa executável compilado no MATLAB. Dessa forma basta carregar o arquivo gerado com os dados do SGBD e rodar o executável para obter os resultados desejados.

Para complementar a análise e visualização dos dados, foi criado um relatório em Power BI, através do qual o usuário será capaz de identificar os pontos e causas de um aumento/queda de performance de determinado navio

OBJETIVO:


