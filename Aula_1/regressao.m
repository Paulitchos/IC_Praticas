function y = regressao(x,d2,d1)
% Inputs:
% x = sinal original
% d1 - limite inferior do deslocamento
% d2 - limite superior do deslocamentp
% Output:
% y - matriz com os varios deslocamentos

%rows = d2 - d1 + 1
%cols = cols x
tamanhoDoSinal = length(x);
quantidadeDeDeslocamentos = d2 - d1 + 1;

%Inicialização da matriz de saida
y = zeros(quantidadeDeDeslocamentos,tamanhoDoSinal); % 1ºlinhas depois colunas

linha  = 0;
for deslocamento = d1 : d2

    linha = linha + 1;
    y(linha,delocamneto + 1 : end) = x(1 : end - deslocamento);
    
end
end
