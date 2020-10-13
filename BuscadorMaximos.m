pkg load symbolic
syms x
fun = input('funcion f(x): ');
ord = input('orden de la derivada: '); 
a = input('lim. inf del intervalo: ');
b = input('lim. sup del intervalo: '); 
max = 0; 
xx = a:0.01:b; 
deriv = diff(fun,ord); 
for i=1:length(xx) 
  funev = abs(double(subs(deriv,x,xx(i)))); 
  if funev > max 
    max = funev; 
  end
end
res = ['el maximo es: ',num2str(max)]; disp(res)