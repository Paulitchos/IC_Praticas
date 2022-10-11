function [accuracy_global] = treinamentoRede(numero_de_neuronios,coeficiente_aprendizagem,conjuntoDeTreino_x,conjuntoDeTreino_y, ...
                                             conjuntoDeTeste_x,conjuntoDeTeste_y,drawOn)

    %Treinar a Matriz
    net = patternnet(numero_de_neuronios);
    
    %Configurar as Camadas
    %funcao de treino
    
    %Tentar fazer depois passar estes valores por parametros !!!!
    net.trainFcn = "traingd";

    net.divideParam.lr = coeficiente_aprendizagem;
        
    %Treinar a rede
    
    net = train(net , conjuntoDeTreino_x , conjuntoDeTreino_y);
    
    out = net(conjuntoDeTeste_x);
    
    if drawOn == 1
        figure;plotconfusion(conjuntoDeTreino_y,out)
    end

    out=(out>0.5);
    size(conjuntoDeTeste_y)
    size(out)
    digitosErrados = (conjuntoDeTeste_y~=out);
    

    accuracy_global = 100*(sum(digitosErrados)/length(conjuntoDeTeste_x));
end
