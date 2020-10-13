#will be updated to symbolic in the future

#clear all; close all; clc;
format long;

fun = input('Funcion F(x): ','s');
F = inline(fun); 

#h = input('Numero de paso: ');
a = input('Límite inferior de la integral: ');
b = input('Límite superior de la integral: ');
n = input('Numero de subintervalos: '); 
#n = (b-a)/h;
h = (b-a)/n; 
X = a:h:b;
Y = arrayfun(F,X);

for i=1:length(X)
  if a == X(i)
    indA = i; 
  end
end
for i=1:length(X)
  if b == X(i)
    indB = i;
  end
end

sum1 = 0;
sum2 = 0;

for i=1:1+(n-2)/2 
  ind = 2*(i-1)+1+1;
  sum1 = sum1 + Y(ind);
end
for i=2:1+(n-2)/2
  ind = 2*(i-1)+1;
  sum2 = sum2 + Y(ind); 
end

 
int = (h/3)*(Y(indA)+4*sum1+2*sum2+Y(indB));
disp(['El resultado de la integral es ' num2str(int)]) 
