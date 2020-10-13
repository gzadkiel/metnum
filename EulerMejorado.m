#Heun

clear all; clc; close all; 
h = input('Número de paso: '); 
t0 = input('t inicial: '); 
y0 = input('y inicial: '); 
tf = input('Valor a especializar: '); 
F = @(y,t) (); 
tv = t0:h:tf
yv(1) = y0; 

for i=1:length(tv)-1  
  tr1 = F(yv(i),tv(i));
  tr2 = F(yv(i)+h*(F(yv(i),tv(i))),tv(i+1));  
  yv(i+1) = yv(i) + (h/2)*(tr1+tr2);
end

disp('Valores de t: ')
disp(tv)
disp('Valores de y: ')
disp(yv) 

#yv(1) = [];
#plot(tv,yv,'-o')
#grid(gca,'minor')
#grid on 
