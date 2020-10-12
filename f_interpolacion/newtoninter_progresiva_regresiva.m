## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} newton_prog (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: gaspar <gaspar@DESKTOP-LIBGGT3>
## Created: 2020-05-06

function [prog,reg] = newtoninter_progresiva_regresiva (vecXY)
T=size(vecXY);
for i=1:T(1)  %%verificacion si esta ordenado el vector dado
  min=vecXY(1,1);
  if vecXY(i,1)<min
    ordenado=false;
    disp('no esta ordenado el vector');
    disp('no esta ordenado el vector');
    disp('no esta ordenado el vector');
    disp('no esta ordenado el vector');
    break;
  endif
endfor    

%%gernerar los coefs
coef=zeros(T(1)-1);
for i=1:(T(1)-1)  %%filas
        coef(i,1)=(vecXY(i+1,2)-vecXY(i,2))/(vecXY(i+1,1)-vecXY(i,1)); %%primera columna con los coefs
endfor
for j=2:T(1)-1 %%columnas
  for i=1:T(1)-j  %%filas (tamaño de la matriz menos la columna) 
        coef(i,j)=(coef(i+1,j-1)-coef(i,j-1))/(vecXY(j+i,1)-vecXY(i,1));  %%resto columnas
  endfor
endfor
%%generar los vectores de los coefs progresivos y regresivos
prog(1)=vecXY(1,2);
reg(1)=vecXY (T(1),2); %%aca ponemos los primeros terminos que serian Xo(prog) y Xn(reg)
T=size(coef);
  for j=1:T(2)
     reg(j+1)=coef(T(1)-j+1,j);   %%extraemos los coefs de la matriz
     prog(j+1)=coef(1,j);
  endfor
coef
prog
reg
endfunction