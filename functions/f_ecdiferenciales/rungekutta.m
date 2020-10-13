## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} rungekutta (@var{input1}, @var{input2})
##  la funcion debe ser del tipo f(t,y) el paso es el h,inicial es el punto inicial, final es el punto final
##             fi es la funcion en un punto de partida
## @seealso{}
## @end deftypefn

function retval = rungekutta (f,paso,inicial,final,fi)
t=inicial:paso:final; %%calculamos los tk
T=size(t);
y(1)=fi;
for i=2:T(2); 
  k1=paso*f(t(i-1),y(i-1)); %%hacemos k1
  tk=t(i-1)+0.5*paso; %%hacemos el tk especial que va en k2 y k3 que en la formula es tk+1/2*h
  k2=paso*f(tk,y(i-1)+0.5*k1); %%calculamos k2
  k3=paso*f(tk,y(i-1)+0.5*k2); %%calculamos k3
  k4=paso*f(t(i-1)+paso,y(i-1)+k3); %%calculamos k4
 y(i)=y(i-1)+(1/6)*(k1+2*k2+2*k3+k4); %%calculamos yk
endfor
y
endfunction