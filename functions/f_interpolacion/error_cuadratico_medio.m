function var = error_cuadratico_medio(xy,fun)
T = size(xy);
sum = 0;
for i=1:T(1)
  sum = sum+((fun(xy(i,1))-xy(i,2))^2);
end
var = sum;
end