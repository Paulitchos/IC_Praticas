function [w,b] = inicializa(p,t)

%Função que inicializa os pesos e bias de
%Inputs:
% p - entradas da rede
% t - saídas da rede
% Outputs;
% w - pesos inicializados aleatoriamente
% b - bias inicializado a zero

numeroLinhasEntrada = size(p,1);

w = randn(1,numeroLinhasEntrada);
b = 0;

end