function [net,accuracy_global] = treinamentoDeRede(numero_de_neuronios,coeficiente_aprendizagem,conjuntoDeTreino_x,conjuntoDeTreino_y, ...
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
    
    

    r = 0;

    for i = 1 : size(out , 2)
        [~ , c] = max(out(:,i));
        [~ , e] = max(conjuntoDeTeste_y(: , i));
        if c == e
            r = r + 1;
        end
    end
    
     if drawOn == 1
         figure;
         plotconfusion(conjuntoDeTeste_y,out)
     end

    accuracy_global = (r/size(out,2));
    
end
