#EulerSimple
clear all; clc; close all; 
h = input('Número de paso: '); 
t0 = input('t inicial: ');  
y0 = input('y inicial: '); 
tf = input('Valor a especializar: '); 
F = @(y,t) ((t-y)/2); #Funcion 
tv = t0:h:tf #Valores de t como vector.
yv(1) = y0; 

#for t=t0:h:tf
for i=1:length(tv)  
  yv(i+1) = yv(i) + h*F(yv(i),tv(i));
end

yv(1) = []; 
disp('Valores de t: ')
disp(tv) 
disp('Valores de y: ')
disp(yv) 
plot(tv,yv,'-o')
grid(gca,'minor')
grid on
