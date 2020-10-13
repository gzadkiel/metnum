function resultado = simpson_1_3 (XY,limites)
T=size(XY);
paso=abs(XY(1,1)-XY(2,1)); %%paso
pasoi=0;
%%for i=2:T(1)-1 %%verificamos que el paso sea constante 
   %%pasoi=abs(XY(i,1)-XY(i+1,1));
  %% if pasoi ~= paso | pasoi ~= paso
     %% disp('EL PASO NO ES CONSTANTE ENTRE LOS PUNTOS, NO SE PUEDE APLICAR TRAPECIOS, INTENTE OTRO INTERVALO O VERIFIQUE SUS PUNTOS');
     %% disp('EL PASO NO ES CONSTANTE ENTRE LOS PUNTOS, NO SE PUEDE APLICAR TRAPECIOS, INTENTE OTRO INTERVALO O VERIFIQUE SUS PUNTOS');
     %% disp('EL PASO NO ES CONSTANTE ENTRE LOS PUNTOS, NO SE PUEDE APLICAR TRAPECIOS, INTENTE OTRO INTERVALO O VERIFIQUE SUS PUNTOS');
     %% disp('EL PASO NO ES CONSTANTE ENTRE LOS PUNTOS, NO SE PUEDE APLICAR TRAPECIOS, INTENTE OTRO INTERVALO O VERIFIQUE SUS PUNTOS');
     %% disp('EL PASO NO ES CONSTANTE ENTRE LOS PUNTOS, NO SE PUEDE APLICAR TRAPECIOS, INTENTE OTRO INTERVALO O VERIFIQUE SUS PUNTOS');
     %% BREAK;
  %% endif
%%endfor
%%buscamos los limites en XY
limsup=0;
liminf=0;
for i=1:T(1)
  if XY(i,1)==limites(1)
    liminf=i;
  endif
  if XY(i,1)==limites(2)
    limsup=i;
  endif
endfor
%% verificamos si la cantidad de puntos es par o impar
cantdepuntos=abs(limsup-liminf)+1;
if mod(cantdepuntos,2)==0
              %%verificamos si es par la cantidad de puntos por que si es par, como empezamos de 1 y
              %%todas las formulas empiezan de 0 entonces es impar la cantidad de puntos    
   disp('CANTIDAD DE PUNTOS IMPAR NO SE PUEDE USAR EL METODO');
   disp('CANTIDAD DE PUNTOS IMPAR NO SE PUEDE USAR EL METODO');
   disp('CANTIDAD DE PUNTOS IMPAR NO SE PUEDE USAR EL METODO');
   disp('CANTIDAD DE PUNTOS IMPAR NO SE PUEDE USAR EL METODO');
    error('CANTIDAD DE PUNTOS IMPAR NO SE PUEDE USAR EL METODO'); 
endif
%%calculamos la integral
if limsup==liminf %%verificamos que los limites no sean iguales
  disp('LOS LIMITES SON IGUALES LA INTEGRAL VALE 0');
  resultado=0;
else
  suma1=0;%% la sumatoria1 y la sumatoria2 la iniciamos
  suma2=0;
  for i=0:1:(((limsup-2)/2)-0.5)
    suma1=suma1+XY((2*i)+2,2); %%suma1 que va desde 0 hasta n-2/2
  endfor
  for i=1:1:(((limsup-2)/2)-0.5)
    suma2=suma2+XY((2*i)+1,2); %%suma2 que va desde 1 hasta n-2/2
  endfor
  suma1=4*suma1; %%multiplicamos por 4 a la sumatoria1
  suma2=2*suma2; %%multiplicamos por 2 a la sumatoria2
  resultado=(paso/3)*(XY(liminf,2)+XY(limsup,2)+suma1+suma2); %%generamos el resultado 
endif
endfunction