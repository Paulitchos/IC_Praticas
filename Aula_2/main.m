clc;
clear;
close all;

%Alinea a)
drawDigits=0;
[conjuntoDeTreino_x,conjuntoDeTreino_y] = camada_treino(drawDigits);

%Alinea b)
drawDigits=0;
[conjuntoDeTeste_x,conjuntoDeTeste_y] = camada_teste(drawDigits);

%Alinea c)
drawDigits=0;
numero_de_neuronios = [10 5 10];
coeficiente_aprendizagem = 0.01;
drawOn = 1;
 treinamentoRede(numero_de_neuronios,coeficiente_aprendizagem,conjuntoDeTreino_x,conjuntoDeTreino_y, ...
                                             conjuntoDeTeste_x,conjuntoDeTeste_y,drawOn);

