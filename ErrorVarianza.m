pol = input('polinomio: ','s');
Pol = inline(pol); 
f = input('funcion original: ','s'); 
F = inline(f); 
X = [];
Y = [];
#Y = arrayfun(F,X);
er = 0; 
for i=1:length(X) 
  er =  (Pol(X(i)) - F(X(i)))^2; 
end
var = 0; 
