function var = error_cuadratico_medio (xy,fun)
T=size(xy);
%%evaluamos la funcion en los puntos y los puntos y los sumamos
sum=0;
for i=1:T(1)
  sum=sum+((fun(xy(i,1))-xy(i,2))^2);
endfor
var=sum;
endfunction