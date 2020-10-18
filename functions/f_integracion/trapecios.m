function resultado = trapecios(XY,limites)
T = size(XY);
paso = abs(XY(1,1)-XY(2,1));
pasoi = 0;
for i=2:T(1)-1 %% verificamos que el paso sea constante
   pasoi=abs(XY(i,1)-XY(i+1,1));
   if pasoi ~= paso
      disp('EL PASO NO ES CONSTANTE ENTRE LOS PUNTOS, NO SE PUEDE APLICAR TRAPECIOS, INTENTE OTRO INTERVALO O VERIFIQUE SUS PUNTOS');
      break;
   end
end
limsup = 0;
liminf = 0;
for i=1:T(1)
  if XY(i,1)==limites(1)
    liminf = i;
  end
  if XY(i,1)==limites(2)
    limsup = i;
  end
end
if limsup==liminf
  disp('LOS LIMITES SON IGUALES LA INTEGRAL VALE 0');
  resultado = 0;
else
  suma = 0;
  for i=(liminf+1):(limsup-1)
    suma = suma+XY(i,2); %% hacemos la sumatoria desde el punto 2 o X1 hasta el N-1
  end
  suma = 2*suma;
  resultado = (paso/2)*(XY(liminf,2)+XY(limsup,2)+suma);
end
end