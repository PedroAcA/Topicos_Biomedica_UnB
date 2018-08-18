clear all
%   O retorno da funcao load do arquivo matlab de sinais advindos do banco 
% de dados fantasia contem uma struct de nome val

%   Assim, considerando a leitura dados_old8=load('f1o08m.mat');                      
% o acesso a primeira linha da variavel (sinal respiracao) eh dado por 
% dados_old8.val(1,:)
% o acesso a segunda linha da variavel (ECG) eh dado por 
% dados_old8.val(2,:)
%
% Taxa de amostragem: 250 Hz
% intervalo de amostragem:0.004 sec
% Configuracoes dos sinais como descrito em f1o08m.info:
%   Signal  Gain	Base    Units
%   RESP	2000	0       mV
%   ECG     2000	0       mV
%
% Descricao da funcao subplot, segundo site da MathWorks:
% subplot(m,n,p) divides the current figure into an m-by-n grid and creates
% axes in the position specified by p. 
% MATLAB® numbers subplot positions by row. 
% The first subplot is the first column of the first row, the second subplot 
% is the second column of the first row, and so on.
%   Link de referencia para a funcao acima :https://www.mathworks.com/help/matlab/ref/subplot.html
%   Acessado em 16/08/2018

%Tarefa: plotar os sinais ecg e resp para 2 pacientes jovens e 2 idosos
dados_old8 = load('f1o08m.mat');
dados_old1 = load('f1o01m.mat');
dados_young3 = load('f1y03m.mat');
dados_young6 = load('f2y06m.mat');

% Dados de respiracao old e young
Resp_old8 = dados_old8.val(1,:);
Resp_old1 = dados_old1.val(1,:);
Resp_young3 = dados_young3.val(1,:);
Resp_young6 = dados_young6.val(1,:);

% Dados de ECG old e young
ecg_young3 = dados_young3.val(2,:);
ecg_young6 = dados_young6.val(2,:);

intervalo = 0.004;% intervalo de amostragem
intervalo_min = intervalo/60% converte o intervalo de segundos para minutos
ind_meia_hora = 1+30*60/intervalo; % indice equivalente a meia hora de amostragem, considerando que
                                   % a indexacao do matalb comeca com 1 e nao com 0
duracao_total = 5*60/intervalo; % numero de indices a se considerar para plotar 
                                %5 min de sinal
ind_final =  ind_meia_hora+duracao_total;% para plotar somente 5 minutos do sinal                               

subplot(2,2,1)% cria uma grade 2x2 (2 plots de 'old' e 2 de 'young') e posiciona
              % o primeiro plot na grade
plot(30:intervalo_min:35,Resp_old8(ind_meia_hora:ind_final ) );
xlabel('Tempo (min) decorrido do experimento')
ylabel('Sinal amostrado (mV) considerando ganho de 2000 e base 0')
title('Dados RESP de f1o08m.mat')

subplot(2,2,2)
plot(30:intervalo_min:35,Resp_old1(ind_meia_hora:ind_final ) );
xlabel('Tempo (min) decorrido do experimento')
ylabel('Sinal amostrado (mV) considerando ganho de 2000 e base 0')
title('Dados RESP de f1o01m.mat')

% Plot ECG e respiracao f1y03
figure();
subplot(2,2,1);
plot(30:intervalo_min:35,ecg_young3(ind_meia_hora:ind_final ) );
xlabel('Tempo (min)');
ylabel('Sinal (mV)');
title('Dados ECG de f1y03m.mat');

subplot(2,2,2);
plot(30:intervalo_min:35,Resp_young3(ind_meia_hora:ind_final ) );
xlabel('Tempo (min)');
ylabel('Sinal (mV)');
title('Dados RESP de f1y03m.mat');

% Plot ECG e respiracao f2y06
subplot(2,2,3);
plot(30:intervalo_min:35,ecg_young6(ind_meia_hora:ind_final ) );
xlabel('Tempo (min)');
ylabel('Sinal (mV)');
title('Dados ECG de f2y06m.mat');

subplot(2,2,4);
plot(30:intervalo_min:35,Resp_young6(ind_meia_hora:ind_final ) );
xlabel('Tempo (min)');
ylabel('Sinal (mV)');
title('Dados RESP de f2y06m.mat');