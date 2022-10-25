clc;
clear;
close all;

filename = 'Bp.mat';

conjuntoDeDados = load(filename);

conjuntoDeTreino_Teste = [conjuntoDeDados.Bp];

conjuntoDeTreino = conjuntoDeTreino_Teste(1:254,:);

conjuntoDeTeste = conjuntoDeTreino_Teste(255:end,:);

conjuntoDeTreino_y = conjuntoDeTreino(:,end)';

conjuntoDeTreino(:,end) = [];

conjuntoDeTreino_x = conjuntoDeTreino';

conjuntoDeTeste_y = conjuntoDeTeste(:,end)';

conjuntoDeTeste(:,end) = [];

conjuntoDeTeste_x = conjuntoDeTeste';

numero_de_neuronios = [254];
coeficiente_aprendizagem = 0.01;

for rep = 1 : 30

    [net,netRBF]=treinamentoDeRede(numero_de_neuronios,coeficiente_aprendizagem,conjuntoDeTreino_x,conjuntoDeTreino_y, ...
                                                 conjuntoDeTeste_x,conjuntoDeTeste_y);
    
end