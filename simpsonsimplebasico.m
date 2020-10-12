F = input('funcion: ','s'); 
f = inline(F); 
#simpson_sim
while true
  a = input('a: ');
  b = input('b: ');   
  aux1 = (b-a)/6;
  aux2 = f(b) + f(a);
  aux3 = 4*f((b+a)/2); 
  res = aux1*(aux2+aux3) 
end 