#EDOSystem(Euler)
clc
clear 
close all  

#Ingresar/modificar funciones manualmente: 
f1 = @(x,y,z,t) (); #dx/dt
f2 = @(x,y,z,t) (; #dy/dt
f3 = @(x,y,z,t) (); #dz/dt 

h = input('Paso: '); 
t0 = input('t inicial: '); 
y0 = input('y inicial y(t0): '); 
x0 = input('x inicial x(t0): ');
z0 = input('z inicial z(t0): ');
tf = input('t final: '); 
tv = t0:h:tf
yv(1) = y0;
xv(1) = x0; 
zv(1) = z0;

for i=1:length(tv)-1
  #xv(i+1) = xv(i) + h*f1(xv(i),yv(i),zv(i),tv(i));
  #yv(i+1) = yv(i) + h*f2(xv(i),yv(i),zv(i),tv(i));  
  #zv(i+1) = zv(i) + h*f3(xv(i),yv(i),zv(i),tv(i)); 
  
  #Euler mejorado: 
  xv(i+1) = xv(i) + (h/2)*(f1(xv(i),yv(i),zv(i),tv(i)) + f1(xv(i)+h*f1(xv(i),yv(i),zv(i),tv(i)),yv(i)+h*f2(xv(i),yv(i),zv(i),tv(i)),zv(i)+h*f3(xv(i),yv(i),zv(i),tv(i)),tv(i+1)));
  yv(i+1) = yv(i) + (h/2)*(f2(xv(i),yv(i),zv(i),tv(i)) + f2(xv(i)+h*f1(xv(i),yv(i),zv(i),tv(i)),yv(i)+h*f2(xv(i),yv(i),zv(i),tv(i)),zv(i)+h*f3(xv(i),yv(i),zv(i),tv(i)),tv(i+1)));
  zv(i+1) = zv(i) + (h/2)*(f3(xv(i),yv(i),zv(i),tv(i)) + f3(xv(i)+h*f1(xv(i),yv(i),zv(i),tv(i)),yv(i)+h*f2(xv(i),yv(i),zv(i),tv(i)),zv(i)+h*f3(xv(i),yv(i),zv(i),tv(i)),tv(i+1)));
end

xv
yv
zv