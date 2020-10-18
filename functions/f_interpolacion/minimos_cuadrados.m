function sumas = minimos_cuadrados (puntos,cant_ec); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% puntos tiene que ser un vector de la forma [xo yo;x1 y1;...;xn yn] y cant_ec son la cantidad de ecuaciones que queremos
%% mientras mas ecuaciones mayor el grado del polinomio, el grado esta dado por cant_ec-1
%% el ploinomio buscado es de la forma a0+a1*x+a2*x^2+.....+an*x^n-1
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

imax = (2*cant_ec)-2; %% al maximo que lo tenemos que elevar, si tenemos 4 ecuaciones solo tenemos que llegar hasta i=6;
T = size(puntos);
for i=0:imax
  sumax = 0;
  sumay = 0;
  for j=1:T(1)
    if i<(0.5*imax)+1 %% si xk ya es mas grande que la mitad de lo que tenemos que calcular ya no nos sirve,entonces no lo calulamos
      sumay = sumay+(puntos(j,2)*puntos(j,1)^i); %% calculamos las sumas de yk*xk^i
    end
    sumax = sumax+puntos(j,1)^i; %% calculamos las sumas de xk^i
end
x(i+1) = sumax;       %% guardamos las diferentes sumas de xk^i
  if i<(0.5*imax)+1
    y(i+1) = sumay;   %% guardamos las diferentes sumas de yk*xk
  end
end
xk = x
xk_yk = y
end