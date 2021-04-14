clear all;

%% ####### PASSO 1 #######

% Carrega dados para criar matriz de decisao
global baseFileName folder;
[baseFileName, folder] = uigetfile('*.csv')
matriz_decisao= readtable(baseFileName)

%Mensagem de arquivo carregado
[icondata,iconcmap] = imread('check.png'); 
uiwait(msgbox('ARQUIVO CARREGADO COM SUCESSO!',...
         'Sucesso','custom',icondata,iconcmap));
%%
% Cria lista com os headers da tabela
headers = matriz_decisao.Properties.VariableNames;
%%
% Remove a coluna "Navio" da lista (apenas para evitar erros do usuario, 
%ja que essa coluna sempre deve estar presente no modelo) 
headers2 = headers(2:end);
%%
% Janela para selecao dos atributos que o usuario deseja utilizar no calculo da performance do modelo
selecao_atributos = listdlg('PromptString',{'SELECIONE OS ATRIBUTOS PARA ALIMENTAR O MODELO',...
'',...
'Segure a tecla ctrl para selecionar mais de um',...
'',...
'',...
},'ListString',headers2);
%%
% configuracao dos atributos para inclusao da coluna de alternativas "Navio"
selecao_atributos2 = selecao_atributos+1;
%%
% Criacao da matriz de decisao com os atributos selecionados pelo usuario
matriz_decisao_2 = matriz_decisao(1:end,selecao_atributos2);
%%
% Converte a tabela da matriz de decisao para array
X=table2array(matriz_decisao_2);

%% ####### PASSO 2 #######

% Calculo da matriz de decisao normalizada
Xval=length(X(:,1));
Y = zeros([Xval,length(selecao_atributos)]);
for j=1:length(selecao_atributos)
    Y(:,j)=X(:,j)/sqrt(sum((X(:,j).^2)));
end
Normalized_Matrix = num2str([Y]);

%% ####### PASSO 3 #######

% Classificacao dos criterios em beneficiais e nao-beneficiais atraves do input do
% usuario:

user_sel = headers(selecao_atributos2);
dims = [0.9 150];
prompt = [user_sel()];
BENEF = inputdlg(prompt,'Atribua 1 para criterios beneficiais (maior=melhor) e 0 para criterios n?o-beneficiais (menor=melhor):',dims);
beneficiais = str2double(BENEF)

%Mensagem de definicoes salvas com sucesso (apenas exibicao para interface com o
%usuario)
[icondata,iconcmap] = imread('check.png'); 
uiwait(msgbox('DEFINICOES SALVAS COM SUCESSO',...
         'Sucesso','custom',icondata,iconcmap));
     
% Classificacao dos criterios em beneficiais e nao-beneficiais (hard code):

% Ao habilitar esse codigo, a classificacao nao dependera do usuario, ela sera fixa. 
% !!! Se a base de dados utilizada for diferente da fornecida como exemplo neste projeto, 
% o numero de elementos da variavel "beneficiais" deve ser configurado manualmente 
% para se adequar ao numero de criterios da base carregada !!!

% Lista de classificacao dos criterios em beneficiais / nao beneficiais

%beneficiais = [0 0 1 0 0 0 0 0 0 0 0 0 1 1 1]; % 1 - Beneficial, 0 - Nao Beneficial

% Os criterios escolhidos pelo usuario sao relacionados a sua respectiva classificacao
% em beneficiais ou nao-beneficiais.

%beneficiais = beneficiais(selecao_atributos2 - 1);

%% ####### PASSO 4 #######

% Definicao dos criterios para os quais o usuario deve atribuir um peso
user_sel = headers(selecao_atributos2);

% Definicao dos numeros fuzzy triangulares correspondentes a cada peso
% linguistico
pesosRotulos = {'EB', 'MB', 'B', 'M', 'A', 'MA', 'EA'}';

pesos = [0 0 0.1
0 0.1 0.3
0.1	0.3	0.5
0.3	0.5	0.7
0.5	0.7	0.9
0.7	0.9	1
0.9	1 1];

% Janela para input dos pesos aos criterios
dims = [0.9 120];
prompt = [user_sel()];
criterios = inputdlg(prompt,'Atribua pesos para os criterios selecionados: EB, MB, B, M, A, MA, EA',dims);
% Coloca os caracteres dos pesos em upper case, para evitar erro caso o usuario 
% nao tenha colocado ao inserir as entradas
criterios = upper(criterios);
%% ####### PASSO 5 #######

% Os valores linguisticos definidos no PASSO 4 sao convertidos para valores
% numericos

len  = length(selecao_atributos2)
for i = 1:len
    index  = strmatch(criterios(i), pesosRotulos, 'exact');
    tabelaFuzzy(i,:) = pesos(index,:);
end;

%% ####### PASSO 6 #######

% Calcula-se a matriz de decisao normalizada com os pesos

[linhasY, colunasY]  = size(Y);
[linhasPesos, colunasPesos] = size(pesos);
for j = 1:colunasY
    indexes = ((j-1)*3)+1:(j*3);
    for i = 1:linhasY       
            matrizD(i,indexes) = tabelaFuzzy(j,:) * Y(i,j);
    end;
end;

%% ####### PASSO 7 #######

% Calcula-se FPIS e FNIS
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

%% ####### PASSO 8 #######

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

Smais = sum(tabelaFPIS')';
Smenos = sum(tabelaFNIS')';

%% ####### PASSO 9 #######

% Calcula-se o coeficiente de proximidade CCi

CCi = Smenos./(Smais+Smenos);
%% ####### PASSO 10 #######

% Com o CCi, faz-se o ranking das alternativas
Navios = matriz_decisao(1:end,headers(1));
Navios = table2array(Navios);

Ranking_Final = table(Navios,CCi);

% Ordenacao do ranking do melhor para o pior
Performance = sortrows(Ranking_Final,[-2]);

[~,posicao]=sortrows(Performance,[-2]);

Performance.Ranking=posicao;

%Mensagem de calculo realizado com sucesso (apenas exibicao para interface com o
%usuario)
[icondata,iconcmap] = imread('check.png'); 
uiwait(msgbox('CALCULO COMPUTADO COM SUCESSO!',...
         'Sucesso','custom',icondata,iconcmap));
     
% Exibicao da janela com o ranking ordenado
fig = uifigure('Position',[410 180 400 350]);
uit = uitable(fig,'Data',Performance);
uit.Position = [30 30 350 310];


