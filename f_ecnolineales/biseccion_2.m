function [Xn,funxn,err] = biseccion_2 (f,intervalo,ER,iter)
%% la funcion biseccion funciona dividiendo el intervalo a la mitad, la cantidad de veces que sea necesario hasta cumplir con el error
%% 
%% las variables de entrada son [Xn,funxn,err] = biseccion_2 (f,intervalo,ER,iter)
%%  f= funcion a evaluar debe ser del tipo f=@(x)  
%%  intervalo= debe ser un vector del tipo [a,b]
%%  ER= error buscado en la aproximacion en este caso el error se calcula como el tamaño del intervalo abs(b-a)
%%  iter= cantida de iteraciones maxima 
%%
%%como los errores tambien se pueden medir como el tamaño del intervalo existe biseccion
  
i=0;
er=9999999;
x1=0;
if f(intervalo (1))>0 
    a=intervalo (1);
    b=intervalo (2);
   else
     a=intervalo (2);
     b=intervalo (1);
 endif
while er>=ER && i<iter
  if f(a)*f(b)<0 
    x1=(a+b)/2;
    if f(x1)<0 
      b=x1;
    else
      a=x1;
   endif
  else
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   disp('INTERVALO INCORRECTO F(a)*F(b)>0');
   i=iter;
  endif
  er=abs(f(x1));
  i=i+1;
endwhile
Xn=x1
n_iteraciones=i
funxn=f(Xn)
err=er
cota_err_abs=abs(b-a)/2
errorenfxabs=abs(f(x1))
endfunction