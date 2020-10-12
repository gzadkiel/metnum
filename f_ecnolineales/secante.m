## -*- texinfo -*- 
## @deftypefn {} {@var{Xn} =} secante (@var{F}, @var{X1},@var{X2},@var{error},@var{errortype} @var{maxiter})
##F es la funcion a encontrar la raiz, X1 es un punto inicial para iniciar el metodo,X2 es un punto inicial para iniciar el metodo, ERROR es el error con el eje Y [abs(f(xi))] o el error entre x subsiguientes [abs(x(n)-x(n-1))],errortype es el tipo de eror que se quiere 0 para x subsiguientes 1 para y absoluto, MAXITER es el maximo de iteraciones posibles
## @seealso{}
## @end deftypefn

## Author: gaspar <gaspar@DESKTOP-LIBGGT3>
## Created: 2020-04-05

function Xn = secante (F,X1,X2,error,errortype,maxiter)
i=0;
er=9999999;  %% inicio de acumuladores 
xn=X2-(F(X2)*(X2-X1)/(F(X2)-F(X1))); %%primera iteracion(X3)

xv=X2;

  while er>=error && i<maxiter
    Xn=xn-(F(xn)*(xn-xv)/(F(xn)-F(xv))); %%n-esimas iteraciones
    i=i+1;               %% acumulador para comparar con maximo de iteraciones
    if errortype==1
      er=abs(F(Xn));       %% error absoluto en Y
   else
    er=abs(Xn-xv);
    xv=Xn;
   endif
  endwhile
Xn
iteraciones=i+1
f_xn=F(Xn)
distancia_entre_x= abs(Xn-xv)
endfunction