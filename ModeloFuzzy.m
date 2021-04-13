clear all;

%% ####### STEP 1 #######

% Carrega dados para criar matriz de decisao
matriz_decisao = readtable("testedados.csv");
%%
% Cria lista com os headers da tabela
headers = matriz_decisao.Properties.VariableNames;
%%
% Remove a coluna "Navio" da lista (apenas para evitar erros do usuario, 
%ja que essa coluna sempre deve estar presente no modelo) 
headers2 = headers(2:end);
%%
% Janela para selecao dos atributos que o usuario deseja utilizar no calculo da performance do modelo
selecao_atributos = listdlg('ListString',headers2);
%%
% configuracao dos atributos para inclusao da coluna de alternativas "Navio"
selecao_atributos2 = selecao_atributos+1;
%%
% Criacao da matriz de decisao com os atributos selecionados pelo usuario
matriz_decisao_2 = matriz_decisao(1:end,selecao_atributos2);
%%
% Converte a tabela da matriz de decisao para array
X=table2array(matriz_decisao_2);

%% ####### STEP 2 #######

% Calculo da matriz de decisao normalizada
Xval=length(X(:,1));
Y = zeros([Xval,length(selecao_atributos)]);
for j=1:length(selecao_atributos)
    Y(:,j)=X(:,j)/sqrt(sum((X(:,j).^2)));
end
Normalized_Matrix = num2str([Y]);

%% ####### STEP 3 #######

% Classificacao dos criterios em beneficiais e nao-beneficiais
% Essa classificacao nao depende do usuario, ela eh fixa.

beneficiais = [0 0 0 0 0 0 0 0 0 0 0 1 1 1 1]; % 1 - Beneficial, 0 - Nao Beneficial

% Deve apenas fazer a referencia de acordo com os atributos escolhidos pelo usuario
% para a matriz de decisao
beneficiais = beneficiais(selecao_atributos2 - 1);

%% ####### STEP 4 #######

% Usuario faz input dos pesos dos criterios selecionados
user_sel = headers(selecao_atributos2);
%%
pesosRotulos = {'EL', 'VL', 'L', 'M', 'H', 'VH', 'EH'}';

pesos = [0	0	1
0	1	3
1	3	5
3	5	7
5	7	9
7	9	1
9	1	1];
%%
%dims = [0.9 50];
%pesos(:,1) = str2num(cell2mat(inputdlg(pesosRotulos,'Input col L',dims)))
%pesos(:,2) = str2num(cell2mat(inputdlg(pesosRotulos,'Input col M',dims)))
%pesos(:,3) = str2num(cell2mat(inputdlg(pesosRotulos,'Input col U',dims)))
%%
dims = [0.9 80];
prompt = [user_sel()];
%criterios =
%{'VH','M','M','H','VL','VH','H','EH','VH','M','EH','VH','M','H','VH'}; hard code
criterios = inputdlg(prompt,'Criterios: EL, VL, L, M, H, VH, EH',dims);
%criterios = criterios{selecao_atributos2-1};


%% ####### STEP 5 #######

% Os valores linguisticos definidos no STEP 4 sao convertidos para valores
% numericos

len  = length(selecao_atributos2)
for i = 1:len
    index  = strmatch(criterios(i), pesosRotulos, 'exact');
    tabelaFuzzy(i,:) = pesos(index,:);
end;

%% ####### STEP 6 #######

% Calcula-se a matriz de decisao normalizada com os pesos

[linhasY, colunasY]  = size(Y);
[linhasPesos, colunasPesos] = size(pesos);
for j = 1:colunasY
    indexes = ((j-1)*3)+1:(j*3);
    for i = 1:linhasY       
            matrizD(i,indexes) = tabelaFuzzy(j,:) * Y(i,j);
    end;
end;

%% ####### STEP 7 #######

% Calcula FPIS e FNIS
for j = 1:colunasY
    indexes = ((j-1)*3)+1:(j*3);
    if beneficiais(j) == 1
        matrizA(1,indexes) = max(matrizD(:,indexes));
        matrizA(2,indexes) = min(matrizD(:,indexes)); 
    else
        matrizA(1,indexes) = min(matrizD(:,indexes));
        matrizA(2,indexes) = max(matrizD(:,indexes)); 
    end;
    
end;

%% ####### STEP 8 #######

% Calcula-se a distancia euclidiana (S+ e S-) de cada alternativa para FPIS e FNIS

% calculo de "d"
[linhasY, colunasY]  = size(Y);
tabelaFPIS = zeros(linhasY,colunasY);
tabelaFNIS = zeros(linhasY,colunasY);
for j = 1:colunasY
    indexes = ((j-1)*3)+1:(j*3);
    for i = 1:linhasY
        tabelaFPIS(i,j) = sqrt(sum(((matrizA(1,indexes) - matrizD(i,indexes)).^2 )/3 ));
        tabelaFNIS(i,j) = sqrt(sum(((matrizA(2,indexes) - matrizD(i,indexes)).^2 )/3 ));
    end;
end;

% calculo S+ e S-

FPIS = sum(tabelaFPIS')';
FNIS = sum(tabelaFNIS')';

%% ####### STEP 09 #######

% Calcula-se o coeficiente de proximidade CCi

CCi = FNIS./(FPIS+FNIS);
%% ####### STEP 10 #######

% Com o CCi, faz-se o ranking das alternativas
Navios = matriz_decisao(1:end,headers(1))
Navios = table2array(Navios)

Ranking_Final = table(Navios,CCi)

% Ranking por performance
Performance = sortrows(Ranking_Final,[-2])

[~,posicao]=sortrows(Performance,[-2])

Performance.Ranking=posicao





