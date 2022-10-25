function [net,netRBF] = treinamentoDeRede(numero_de_neuronios,coeficiente_aprendizagem,conjuntoDeTreino_x,conjuntoDeTreino_y, ...
    conjuntoDeTeste_x,conjuntoDeTeste_y)

%Treinar a Matriz
trainFcn = "trainlm";
net = feedforwardnet(numero_de_neuronios,trainFcn);

%Configurar as Camadas
%funcao de treino

%Tentar fazer depois passar estes valores por parametros !!!!


net.divideParam.lr = coeficiente_aprendizagem;

%Treinar a rede

net = train(net , conjuntoDeTreino_x , conjuntoDeTreino_y);

view(net);

goal = 0.0;

spread = 3.1;

MN = 254;

DF = 25;

netRBF = newrb(conjuntoDeTreino_x,conjuntoDeTreino_y,goal,spread,MN,DF);

view(netRBF);

testY_MLP = net(conjuntoDeTeste_x);

perfMLP = perform(net,testY_MLP,conjuntoDeTeste_y);

testY_RBF = sim(netRBF,conjuntoDeTeste_x);

perfRBF = perform(netRBF,testY_RBF,conjuntoDeTeste_y);

if perfMLP < perfRBF
    disp('Neste caso específico, a MLP teve melhor desempanho')
elseif perfMLP > perfRBF
    disp('Neste caso específico, a RBF teve melhor desempanho')
else
    disp('Neste caso específico, a MLP e a RBF tiveram igual desempanho')

end

end
