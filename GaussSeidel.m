#lecturamatriz.m is required to run this script
#includes both while and for cycles, choose one depending on your needs 

disp('sistema A*x = b')
disp('matriz de coeficientes A: ')
A = lecturamatriz; 
disp('matriz de terminos ind. b: ')
b = lecturamatriz; 
#Iteraciones: 
n = input('cantidad de iteraciones: '); 
#tol = input('tol. de error (abs o rel): ') ;
#tol = input('tol. de residuo: '); 

D = diag(diag(A)); 
L = tril(A,-1); 
U = triu(A,1); 
x0 = zeros(size(b)); #(si uso er no poner zeros())
B = inv(D+L)*(-U) 
c = inv(D+L)*b
if max(abs(eig(B))) < 1 
  er = 999;
  cont = 0; 
  for j=1:n
  #while (er > tol) 
    cont = cont+1;
    x = B*x0 + c; 
    #er = norm((x-x0),1); #error absoluto
    #er = norm((A*x-b),1); #residuo
    #er = norm((x-x0),1)/norm(x0,1); #error relativo 
    x0 = x 
  end
  disp('la solucion es: ')
  disp(x0)
  disp('residuo: ')
  disp(A*x0-b)
  res1 = ['cant. de iteraciones: ',num2str(cont)]; disp(res1) 
else
  disp('no converge')
end