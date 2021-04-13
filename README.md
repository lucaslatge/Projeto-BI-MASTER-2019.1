## Projeto-Final-BI-MASTER-2019.1 ##

* Modelo Fuzzy TOPSIS para avaliação de performance de uma frota de navios


Este modelo utiliza uma base de dados composta de alternativas e critérios para expressar numericamente o navio que apresenta a melhor performance dentro de uma frota.
O método de computação empregado é o Fuzzy TOPSIS, extremamente eficiente quando há elementos subjetivos envolvidos no processo de decisão.

Este projeto foi desenvolvido em MATLAB e compilado em um programa executável.


PASSO A PASSO PARA UTILIZAÇÃO DO MODELO DE PERFORMANCE FUZZY TOPSIS

1. Inicie o instalador do programa
2. Certifique-se de instalar o MATLAB Runtime durante a instalação, ele é necessário para a execução do programa
3. Após concluir a instalação, inicie o programa
4. Na tela inicial, clique no botão para iniciar o cálculo de performance
5. Na janela que abrir, selecione o arquivo .csv da base de dados a ser utilizada. Consulte o relatório para mais detalhes sobre o formato exigido para a base de dados.
6. Após carregar o arquivo .csv, selecione os critérios que deseja utilizar no cálculo.
7. Na janela que abrir, classifique os critérios selecionados atribuindo o número 1 para critérios BENEFICIAIS (quanto maior o valor, melhor) e o número 0 para critérios NÃO-BENEFICIAIS (quanto menor o valor, melhor)
8. Na próxima janela, insira as siglas dos pesos de cada critério selecionado de acordo com a correspondência abaixo:

EB - Extremamente Baixo | MB - Muito Baixo |B - Baixo | M - Médio | A - Alto | MA - Muito Alto | EA - Extremamente Alto

9. O modelo irá executar o cálculo e exibir o ranking dos navios de acordo com o Coeficiente de Proximidade (CCi) obtido.



