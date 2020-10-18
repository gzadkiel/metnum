function [ak,bk,ck,dk,mat,b] = splinecubic(puntos)
T = size(puntos); 
for i=1:T(1)-1
  h(i) = puntos(i+1,1)-puntos(i,1);
end
mat(1,1) = 1;mat(1,2:1:T(1))=0;             %% primera fila que es un 1 y el resto 0
mat(T(1),T(1)) = 1;mat(T(1),1:1:T(1)-1)=0;  %% ultima fila que es un 1 al final y un 0 el resto
for i=2:T(1)-1
  for j=1:T(1)
    if j==i-1
      mat(i,j) = h(i-1);
    elseif i==j
      mat(i,j) = 2*(h(j-1)+h(j));
    elseif  j==i+1
      mat(i,j) = h(i);
    else
      mat(i,j) = 0;
    end
  end
end

b(1) = 0;b(T(1))=0; %% primer y ultimo termino iguales a 0
for i=2:T(1)-1
  b(i) = ((3/h(i))*(puntos(i+1,2)-puntos(i,2)))-((3/h(i-1))*(puntos(i,2)-puntos(i-1,2)));
end
c = mat\b';
for i=1:T(1)-1
  bk(i) = ((puntos(i+1,2)-puntos(i,2))/h(i))-((h(i)/3)*(2*c(i)+c(i+1)));
end  
for i=1:T(1)-1
  d(i) = (c(i+1)-c(i))/(3*h(i));
end

ak = puntos(1:1:T(1)-1,2)
bk = bk'
ck = c
dk = d'
end