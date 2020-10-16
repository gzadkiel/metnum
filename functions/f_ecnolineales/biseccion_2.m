function [Xn,funxn,err] = biseccion_2(f,intervalo,ER,iter)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% La funcion biseccion funciona dividiendo el intervalo a la mitad, la cantidad de veces que sea necesario hasta cumplir con el error.
%% 
%% Las variables de entrada son:
%% f = funcion a evaluar debe ser del tipo f=@(x)  
%% intervalo = debe ser un vector del tipo [a,b]
%% ER = error buscado en la aproximacion en este caso el error se calcula como el tama�o del intervalo abs(b-a)
%% iter = cantida de iteraciones maxima 
%%
%% Como los errores tambien se pueden medir como el tama�o del intervalo existe biseccion.
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
while er>=ER && i<iter
  if f(a)*f(b)<0 
    x1 = (a+b)/2;
    if f(x1)<0 
      b = x1;
    else
      a = x1;
   end
  else
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   i = iter;
  end
  er = abs(f(x1));
  i = i+1;
end 

Xn = x1
n_iteraciones = i
funxn = f(Xn)
err = er
cota_err_abs = abs(b-a)/2
errorenfxabs = abs(f(x1))
end