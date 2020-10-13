#RungeKutta2doOrden
clear all; clc; close all; 
h = input('Número de paso: '); 
t0 = input('t inicial: ');  
y0 = input('y inicial: '); 
tf = input('Valor a especializar: '); 
F = @(y,t) ();  
tv = t0:h:tf
yv(1) = y0;  

for i=1:length(tv)-1 
  #tm1 = (h/2)*F(yv(i),tv(i)); 
  #tm2 = (h/2)*F(yv(i)+h*F(tv(i),yv(i)),tv(i)+h);
  #yv(i+1) = yv(i)+tm1+tm2; 
  K1 = h*F(yv(i),tv(i)); 
  K2 = h*F(yv(i)+K1,tv(i)+h);
  yv(i+1) = yv(i) + K1/2 + K2/2; 
end

yv(1) = []; 
disp('Valores de t: ')
disp(tv) 
disp('Valores de y: ')
disp(yv) 
plot(tv,yv,'-o')
grid(gca,'minor')
grid on
