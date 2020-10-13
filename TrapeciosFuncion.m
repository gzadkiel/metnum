#trapeciosconN

f = input('Funcion: ','s'); 
F = inline(f)
a = input('Limite inf: '); 
b = input('Limite sup: ');
while true 
  n = input('Cant. de trapecios: '); 
  h = (b-a)/n; 
  xv = a:h:b;
  sum = 0; 
  for i=2:n
    F(xv(i))
    sum = sum+F(xv(i));
  end
  aux = F(a)+F(b)+2*sum;
  int = (h/2)*aux
end