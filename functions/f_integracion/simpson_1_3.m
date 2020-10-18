function resultado =simpson_1_3(XY,limites)
T = size(XY);
paso = abs(XY(1,1)-XY(2,1));
pasoi = 0;
limsup = 0;
liminf = 0;
for i=1:T(1)
  if XY(i,1)==limites(1)
    liminf=i;
  end
  if XY(i,1)==limites(2)
    limsup=i;
  end
end
%% verificamos si la cantidad de puntos es par o impar
cantdepuntos = abs(limsup-liminf)+1;
if mod(cantdepuntos,2)==0
  %% verificamos si es par la cantidad de puntos por que si es par, como empezamos de 1 y
  %% todas las formulas empiezan de 0 entonces es impar la cantidad de puntos    
  error('CANTIDAD DE PUNTOS IMPAR NO SE PUEDE USAR EL METODO'); 
end
%% calculamos la integral
if limsup==liminf 
  disp('LOS LIMITES SON IGUALES LA INTEGRAL VALE 0');
  resultado = 0;
else
  suma1 = 0;
  suma2 = 0;
  for i=0:1:(((limsup-2)/2)-0.5)
    suma1 = suma1+XY((2*i)+2,2); %% sum1 que va desde 0 hasta n-2/2
  end
  for i=1:1:(((limsup-2)/2)-0.5)
    suma2 = suma2+XY((2*i)+1,2); %% sum2 que va desde 1 hasta n-2/2
  end
  suma1 = 4*suma1;
  suma2 = 2*suma2;
  resultado = (paso/3)*(XY(liminf,2)+XY(limsup,2)+suma1+suma2);
end
end