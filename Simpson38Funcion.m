#clear all; close all; clc;
format long;
fun = input('Funcion F(x): ','s');
F = inline(fun); 

n = input('Numero de intervalos: ');
a = input('Límite inferior de la integral: ');
b = input('Límite superior de la integral: ');
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


sum1 = sum2 = sum3 = 0; 

    for i=1:1+(n-3)/3
        ind = 3*(i-1)+1+1;
        sum1 = sum1 + Y(ind);  
        end 
    sum1F = 3*sum1;

    for i=1:1+(n-3)/3
        ind = 3*(i-1)+2+1;
        sum2 = sum2 + Y(ind); 
        end 
    sum2F = 3*sum2;

    for i=2:1+(n-3)/3
        ind = 3*(i-1)+1;
        sum3 = sum3 + Y(ind);
        end 
    sum3F = 2*sum3;

    sumT = sum1F+sum2F+sum3F;
    integ = Y(indA)+Y(indB)+sumT; 
    intgral = (3*h/8)*integ;
    disp(['La integral es: ',num2str(intgral)])