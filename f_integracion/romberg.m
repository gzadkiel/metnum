## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} romberg (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: gaspar <gaspar@DESKTOP-LIBGGT3>
## Created: 2020-05-20

function R = romberg (xy,limites) %%entrada vector de la forma [xo yo;x1 y1;...;xn yn] y limites inferior y superior L=[inf,sup]
T=size(xy);
%% buscamos los indices a y b para luego buscar f(a) y f(b) 
limsup=0;
liminf=0;
for i=1:T(1)
  if xy(i,1)==limites(1)
    liminf=i;
  endif
  if xy(i,1)==limites(2)
    limsup=i;
  endif
endfor
%%calculamos R1,1
R(1,1)=((limites(1,2)-limites(1,1))/2)*(xy(limsup,2)+xy(liminf,2)); 
 %%calculamos la cantidad de puntos que vamos poder hacer con los puntos que tenemos
t=log2(limsup-1)+1;
%%verificamos si es entero, si no redondeamos al entero menor
if mod(t,1)~=0
  disp('no se puede usar la cantidad de puntos especificado');
endif
%%esto se va a usar en todas las iteraciones lo calculamos 1 vez para no calcularlo todas las veces
deltalim=(limites(1,2)-limites(1,1)); 
for i=2:t
   %%calculamos los diferentes h o paso que tiene cada iteracion
  hi=deltalim/(2^(i-2));
  sumaf=0;
  for j=1:(2^(i-2)) %% calculamos las diferentes f(x) para las iteraciones 
   %% buscamos que indice de el vector de los puntos tiene el valor de x que necesitamos
   x=0;
   for r=1:T(1)
    xbuscado=limites(1,1)+(((2*j)-1)/2)*hi;
      if abs(xy(r,1)-xbuscado)<=(1*10^-4)  %% vemos si el x es parecido al x que buscamos con un error de 1*10^-4
        x=r;
      endif
    endfor
    if x==0
      R
      error('x es 0 channn');
    endif
    sumaf=sumaf+xy(x,2);
  endfor
  R(i,1)=0.5*(R(i-1,1)+hi*(sumaf)); %%los diferentes R k,1
endfor
%% calculamos subsiguientes R i,j
for i=2:t
  for j=2:i 
    R(i,j)=(((4^(j-1))*R(i,j-1))-R(i-1,j-1))/(((4^(j-1))-1));
  endfor
endfor
endfunction