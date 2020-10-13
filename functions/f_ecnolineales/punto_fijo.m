## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} punto_fijo (@var{f},@var{g}, @var{X0},@var{error}, @var{maxiter})
##
##   F es la funcion a encontrar la raiz, G es la funcion a utilizar en este metodo [g(x)=x](sale de f(x)), X0 es el punto inicial para iniciar el metodo, ERROR es el error con el eje x [abs(f(xi))], MAXITER es el maximo de iteraciones posibles
## @seealso{}
## @end deftypefn

function Xn = punto_fijo (g,X0,error,maxiter)
i=0;
er=9999999;
xi=g(X0);
x1=xi;
xant=X0;
  while er>=error && i<maxiter
    xi=g(xi);  
    i=i+1;
    if i==1 && (abs(xi-x1)/abs(x1-X0))>1 %%verificacion de convergencia
         disp('NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE');
         disp('NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE');
         disp('NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE');
         disp('NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE');
         disp('NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE');
         disp('NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE');
         disp('NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE');
         i=maxiter;
     endif
     er=abs(xi-xant);
     xant=xi;
  endwhile    
Xn=xi
iteraciones=i
delta_fx=er
endfunction