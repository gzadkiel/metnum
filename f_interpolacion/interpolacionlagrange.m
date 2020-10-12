## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} interpolacionlagrange (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: gaspar <gaspar@DESKTOP-LIBGGT3>
## Created: 2020-05-06

function f = interpolacionlagrange (vecXY,x) %%necesita un vector de la forma [xo yo;x1 y1;...;xn yn] y un x adonde evaluar
T=size(vecXY);%%vemos la cantidad de filas para saber los l(i)(cantidad de terminos a multiplicar)
fun=0;%%setiamos funcion a 0
for i=1:T(1) %%vamos desde la fila 1 hasta la ultima
  liv=1;
  for j=1:T(1) %%generamos el l(i)
    if j~=i  %%si no es el que estamos evaluando lo generamos
    lin=(x-vecXY(j,1))/(vecXY(i,1)-vecXY(j,1)); 
  else
    lin=1;
  endif
  liv=liv*lin; %%se multiplican los n terminos
  endfor
  fun=fun+vecXY(i,2)*liv; %%se suman los n terminos
endfor  
f=fun; %%devuelve el valor en x de la funcion de lagrange
endfunction