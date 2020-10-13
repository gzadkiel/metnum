#RungeKutta4toOrden
clear all; clc; close all; 
h = input('Número de paso: '); 
t0 = input('t inicial: ');  
y0 = input('y inicial: '); 
tf = input('Valor a especializar: '); 
F = @(t,y) (); 
tv = t0:h:tf 
yv(1) = y0;  

for i=1:length(tv)-1
  K1 = h*F(tv(i),yv(i));  
  K2 = h*F(tv(i)+h/2,yv(i)+K1/2);
  K3 = h*F(tv(i)+h/2,yv(i)+K2/2);
  K4 = h*F(tv(i)+h,yv(i)+K3); 
  yv(i+1) = yv(i) + (K1+2*K2+2*K3+K4)/6; 
end

#yv(1) = []; 
disp('Valores de t: ')
disp(tv) 
disp('Valores de y: ')
disp(yv) 
#plot(tv,yv,'-o')
#grid(gca,'minor')
#grid on
