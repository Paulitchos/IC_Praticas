clc;
clear;
close all;

delimiterIn = ",";
classNames = 0:9;
nrClasses = length(classNames);

filename = 'optdigits.tra';
conjuntoDeTreino = importdata(filename,delimiterIn);

conjuntoDeTreino_y = conjuntoDeTreino(:,65);
conjuntoDeTreino(:,65) = [];
conjuntoDeTreino_x = conjuntoDeTreino';

filename = 'optdigits.tes';
conjuntoDeTeste = importdata(filename,delimiterIn);

conjuntoDeTeste_y = conjuntoDeTeste(:,65);
conjuntoDeTeste(:,65) = [];
conjuntoDeTeste_x = conjuntoDeTeste';

conjuntoDeTreino_y = onehotencode(conjuntoDeTreino_y , nrClasses , 'ClassNames' , 0:9);
conjuntoDeTeste_y = onehotencode(conjuntoDeTeste_y , nrClasses , 'ClassNames' , 0:9);

conjuntoDeTreino_y = squeeze(conjuntoDeTreino_y)';
conjuntoDeTeste_y = squeeze(conjuntoDeTeste_y)';

numero_de_neuronios = [100 75 50 25];
coeficiente_aprendizagem = 0.01;
drawOn = 1;

[net,accuracy_global]=treinamentoDeRede(numero_de_neuronios,coeficiente_aprendizagem,conjuntoDeTreino_x,conjuntoDeTreino_y, ...
                                             conjuntoDeTeste_x,conjuntoDeTeste_y,drawOn);

fprintf('Precisa Global = %f\n' , accuracy_global);



