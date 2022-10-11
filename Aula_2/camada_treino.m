function [conjuntoDeTreino_x,conjuntoDeTreino_y] = camada_treino(drawDigits)

% Definition of the Training data set (just a small data set!)

%um exemplo de um "zero"
zero_1=[1 1 1 1 1 ... 
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 1 1 1 1 ];

%um exemplo de um "um"
um_1=[0 1 1 0 0 ... 
      1 1 1 0 0 ...
      1 0 1 0 0 ...
      0 0 1 0 0 ...
      0 0 1 0 0 ...
      0 0 1 0 0 ...
      0 1 1 1 0 ];

%um exemplo de um "dois"
dois_1=[0 1 1 1 1 ... 
        0 0 0 0 1 ...
        0 1 1 1 1 ...
        0 1 0 0 0 ...
        0 1 0 0 0 ...
        0 1 0 0 0 ...
        0 1 1 1 0 ];   
 
%um exemplo de um "tres"
tres_1=[1 1 1 1 1 ... 
        0 0 0 0 1 ...
        0 0 0 0 1 ...
        0 1 1 1 1 ...
        0 0 0 0 1 ...
        0 0 0 0 1 ...
        1 1 1 1 1 ];   

%um exemplo de um "quatro"
quatro_1=[1 0 0 0 0 ... 
          1 0 0 0 0 ...
          1 0 1 0 0 ...
          1 1 1 1 1 ...
          0 0 1 0 0 ...
          0 0 1 0 0 ...
          0 0 1 0 0 ];   

seis_1=[1 1 1 1 0 ... 
        1 0 0 0 0 ...
        1 0 0 0 0 ...
        1 1 1 1 1 ...
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 1 1 1 1 ];
 
seis_2=[1 1 1 1 1 ... 
        1 0 0 0 0 ...
        1 0 0 0 0 ...
        1 1 1 1 0 ...
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 1 1 1 0 ];
 
sete_1=[1 1 1 1 1 ... 
        0 0 0 1 1 ...
        0 0 1 0 0 ...
        0 1 0 0 0 ...
        0 1 0 0 0 ...
        0 1 0 0 0 ...
        1 1 0 0 0 ];
 
oito_1=[1 1 1 1 1 ... 
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 1 1 1 1 ...
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 1 1 1 1 ];
 
 nove_1=[1 1 1 1 1 ... 
         1 0 0 0 1 ...
         1 0 0 0 1 ...
         1 1 1 1 1 ...
         0 0 0 0 1 ...
         0 0 0 0 1 ...
         0 0 0 0 1 ];
 
 %um exemplo de um "cinco"      
cinco_1=[1 1 1 1 1 ... 
         1 0 0 0 0 ...
         1 0 0 0 0 ...
         1 1 1 1 1 ...
         0 0 0 0 1 ...
         0 0 0 0 1 ...
         1 1 1 1 1 ];
 
cinco_2=[1 1 1 1 0 ... 
          1 0 0 0 0 ...
          1 0 0 0 0 ...
          1 1 1 1 1 ...
          0 0 0 0 1 ...
          0 0 0 0 1 ...
          0 1 1 1 1 ];
      
 cinco_3=[1 1 1 1 0 ... 
          1 0 0 0 0 ...
          1 0 0 0 0 ...
          1 1 1 1 0 ...
          0 0 0 0 1 ...
          0 0 0 0 1 ...
          1 1 1 1 0 ];
      
 cinco_4=[0 1 1 1 0 ... 
          1 0 0 0 0 ...
          1 0 0 0 0 ...
          1 1 1 1 1 ...
          0 0 0 1 1 ...
          0 0 0 0 1 ...
          1 1 1 1 1 ];
      
 cinco_5=[1 1 1 1 0 ... 
          1 0 0 0 0 ...
          1 0 0 0 0 ...
          0 1 1 1 1 ...
          0 0 0 0 1 ...
          0 0 0 0 1 ...
          0 1 1 1 1 ];
  
      
      
 %%show data%%      
conjuntoDeTreino_x=[zero_1;um_1;dois_1; tres_1; quatro_1;seis_1;...
seis_2; sete_1; oito_1; nove_1;...    
cinco_1; cinco_2;cinco_3; cinco_4;cinco_5]';

conjuntoDeTreino_y = [0 0 0 0 0 ...
                      1 1 1 1 1 ...
                      0 0 ...
                      0 0 0];
  
%plot digits
if drawDigits==1
    figure;
    for k=1:size(conjuntoDeTreino_x,2)
       thisExample=conjuntoDeTreino_x(:,k);
       thisExampleReshaped= reshape(thisExample,[5,7])';
       subplot(3,5,k)
       imagesc(thisExampleReshaped)
       colormap(gray)
       axis equal
       axis off
    end
end