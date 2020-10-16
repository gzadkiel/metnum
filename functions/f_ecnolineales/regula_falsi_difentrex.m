function [Xn,funxn,err] = regula_falsi_difentrex(f,intervalo,ER,maxiteraciones)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% La funcion regula_falsi funciona haciendo la interseccion entre el eje x con la recta que une los puntos a y b.
%% 
%% Las variables de entrada son:
%% f = funcion a evaluar debe ser del tipo f=@(x)  
%% intervalo = debe ser un vector del tipo [a,b]
%% ER = error buscado en la aproximacion en este caso el error se calcula como el tama�o del intervalo abs(b-a)
%% maxiteraciones = es la cantidad maxima de iteraciones a realizar
%% 
%% Como los errores tambien se pueden medir como el tama�o del intervalo existe regula_falsi.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i = 0;
er = 999;
xant = e^20;
fx = 999;                     %% inicio de variables
x1 = 0;
if f(intervalo (1))>0 
    a = intervalo (1);
    b = intervalo (2);
   else                       %% asignacion de a y b desde el vector intervalo que deberia ser un vector 1x2 [a,b]
     a = intervalo (2);
     b = intervalo (1); 
endif     
while er>=ER && i<maxiteraciones && fx~=0  %% verificamos que el eror sea menor que el error especificado, que las iteraciones sean menores que la maxima, que no sea 0 f(x) por que si no ya hubiesemos encontrado x
  fa = f(a);                               %% calculamos una unica vez f(a) y F(b) por que se usa 5 veces
  fb = f(b);  
  if fa*fb<0                               %% vemos que en el intervalo corte el eje x
    x1 = ((a*fb)-(b*fa))/(fb-fa);
    fx = f(x1);                            %% f en el punto para no tener que volver a hacerlo depues lo uso en el while y en el error
    if fx<0 
      b = x1;
    else                                   %% vemos para que lado del intervalo va [a,b]
      a = x1;
   endif
   else
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   i = iter;
  end
  er = abs(x1-xant);
  xant = x1;
 i = i+1;                     %% terminar el ciclo while por que podria tomar muchas iteraciones
end
Xn = x1
n =i
funxn = f(Xn)
err = er
cotaerrabs = abs(b-a)/2
errorenfxabs = abs(fx)
end