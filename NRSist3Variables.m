clear
pkg load symbolic 
syms x
syms y
syms t
disp('ecuaciones con variables x,y,t') 
f = input('ecuacion 1: '); 
g = input('ecuacion 2: '); 
h = input('ecuacion 3: '); 
J = jacobian([f,g,h],[x,y,t])
sist = [f;g;h]; 
x0 = lecturamatriz;
#Iteraciones:  
cota1 = input('cota de error en x: '); 
cota2 = input('cota de error en f(x): ');
er1 = er2 = 999;  
while (er1 > cota1) && (er2 > cota2) 
  xsol = subs(x0-inv(J)*sist,[x;y;t],[x0(1,1);x0(2,1);x0(3,1)]);
  pasomedio = double(xsol);
  er1 = norm(double(xsol-x0),1);
  er2 = norm(double(subs(sist,[x;y;t],[x0(1,1);x0(2,1);x0(3,1)]))); 
  x0 = pasomedio;
end
disp('solucion: ')
disp(x0)