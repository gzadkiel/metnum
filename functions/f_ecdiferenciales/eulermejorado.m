## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} eulermejorado (@var{input1}, @var{input2})
##la funcion debe ser del tipo f(t,y) el paso es el h,inicial es el punto inicial, final es el punto final
##             fi es la funcion en un punto de partida
## @seealso{}
## @end deftypefn


function y = eulermejorado (f,paso,inicial,final,fi)
t=inicial:paso:final;
T=size(t);
y(1)=fi;
for i=2:T(2)
  y(i)=y(i-1)+(paso/2)*(f(t(i-1),y(i-1))+f(t(i),y(i-1)+paso*f(t(i-1),y(i-1))));
endfor
y
endfunction