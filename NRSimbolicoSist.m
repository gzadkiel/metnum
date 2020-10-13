clear
pkg load symbolic 
syms x
syms y
disp('ecuaciones con variables x,y') 
f = input('ecuacion 1: '); 
g = input('ecuacion 2: '); 
J = jacobian([f,g],[x,y])
sist = [f;g]; 
x0 = lecturamatriz;
#Iteraciones: 
n = input('iteraciones: '); 
#cota = input('cota de error: '); 
#cota = input('cota del residuo: ');
er = 999;  
for i=1:n
#while (er>cota) 
  xsol = subs(x0-inv(J)*sist,[x;y],[x0(1,1);x0(2,1)]);
  pasomedio = double(xsol);
  er = norm(xsol-x0,1); 
  x0 = pasomedio
end
disp('solucion: ')
disp(x0)