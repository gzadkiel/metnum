#EulerSimple

clear all; clc; close all; 
h = input('Numero de paso: '); 
t0 = input('t inicial: ');  
y0 = input('y inicial: '); 
tf = input('Valor a especializar: '); 
F = @(y,t) ();
tv = t0:h:tf
yv(1) = y0; 

for i=1:length(tv)  
  yv(i+1) = yv(i) + h*F(yv(i),tv(i));
end
 
disp('Valores de t: ')
disp(tv) 
disp('Valores de y: ')
disp(yv) 

#yv(1) = [];
#plot(tv,yv,'-o')
#grid(gca,'minor')
#grid on