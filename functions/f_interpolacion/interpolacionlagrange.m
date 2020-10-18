function f = interpolacionlagrange(vecXY,x) %% necesita un vector de la forma [xo yo;x1 y1;...;xn yn] y un x adonde evaluar
T = size(vecXY);                            %% vemos la cantidad de filas para saber los l(i)(cantidad de terminos a multiplicar)
fun = 0;
for i=1:T(1) 
  liv = 1;
  for j=1:T(1) 
    if j~=i  %% si no es el que estamos evaluando lo generamos
    lin = (x-vecXY(j,1))/(vecXY(i,1)-vecXY(j,1)); 
  else
    lin = 1;
  end
  liv = liv*lin;
  end
  fun = fun+vecXY(i,2)*liv;
end 
f = fun;
end