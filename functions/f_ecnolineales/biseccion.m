function [Xn,funxn,err] = biseccion(f,n,intervalo,ER)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% La funcion biseccion funciona dividiendo el intervalo a la mitad, la cantidad de veces que sea necesario hasta cumplir con el error.
%% 
%% Las variables de entrada son:
%% f = funcion a evaluar debe ser del tipo f=@(x)  
%% n = cantidad de iteraciones maxima
%% intervalo = debe ser un vector del tipo [a,b]
%% ER = error buscado en la aproximacion en este caso el error se calcula como el tama�o del intervalo abs(b-a)
%%
%% Como los errores tambien se pueden medir con la distancia al eje x existe biseccion_2.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i = 0;
er = 999;
x1 = 0;
if f(intervalo (1))>0 
  a = intervalo (1);
  b = intervalo (2);
else
  a = intervalo (2);
  b = intervalo (1);
end
while er>=ER && i<n
  if f(a)*f(b)<0 
    x1 = (a+b)/2;
    if f(x1)<0 
      b = x1;
    else
      a = x1;
    end
  else
    disp('INTERVALO INCORRECTO F(a)*F(b)>0');
    i = iter;
  end
 er = abs(b-a);
 i = i+1;
end

Xn = x1
i
funxn = f(Xn)
err = er
end