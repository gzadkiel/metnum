#Metodos Numericos - 2020
#Metodo_Biseccion 

function bisection_method 
clear; clc;  
f = input('Input a function to evaluate: ... ','s')
F = inline(f);
a = input('Lower limit of the interval: ... ');
b = input('Upper limit of the interval: ... ');
tolx = input('Error tolerance of X: ... ');
toly = input('Error tolerance of Y = f(X): ... ');
method(F,a,b,tolx,toly)
endfunction

#Root_calculation: 
function [xs,fxs,n,ex,ey]=method(F,a,b,tx,ty)
ya = F(a); 
yb = F(b);  
xs = 0; 
if ya*yb < 0 %Existencia de una raiz 
  n = 0; 
  ex = 9999;
  ey = 9999; 
  while ex > tx && ey > ty   
    n = n+1;
    xp = xs;
    xs = (b+a)/2; 
    fxs = F(xs);
    ya = F(a);
    yb = F(b);
    ex = abs(xs-xp); #Delta error: (Xi-Xi-1)
    ey = abs(fxs); #Epsilon error: f(Xi)   
    if fxs*yb < 0
      a = xs;
    else 
      b = xs;
    end 
    end
else
  disp('No root on the given interval.')
end

#After the root is found, data is shown:  
disp('The approximate root is: ')
  disp(xs)
disp('The function evaluated on the approx. root is: ')
  disp(fxs)
disp('Number of iterations:  ')
  disp(n)
disp('Error on X: ')
  disp(ex)
disp('Error on Y = f(X): ')
  disp(ey)
end