#EDOSystem(Euler)
#clc
clear 
close all  

#Ingresar/modificar funciones manualmente: 
g = @(x,y,t) (); #dx/dt
f = @(x,y,t) (); #dy/dt

h = input('Paso: '); 
t0 = input('t inicial: '); 
y0 = input('y inicial y(t0): '); 
x0 = input('x inicial x(t0): '); 
tf = input('t final: '); 
tv = t0:h:tf
yv(1) = y0;
xv(1) = x0; 

for i=1:length(tv)-1
  yv(i+1) = yv(i) + h*f(xv(i),yv(i),tv(i)); 
  xv(i+1) = xv(i) + h*g(xv(i),yv(i),tv(i)); 
  #Euler mejorado: 
  #yv(i+1) = yv(i) + (h/2)*(f(xv(i),yv(i),tv(i))+f(xv(i)+h*g(xv(i),yv(i),tv(i)),yv(i)+h*f(xv(i),yv(i),tv(i)),tv(i+1)));
  #xv(i+1) = xv(i) + (h/2)*(g(xv(i),yv(i),tv(i))+g(xv(i)+h*g(xv(i),yv(i),tv(i)),yv(i)+h*f(xv(i),yv(i),tv(i)),tv(i+1)));
end

#Terminos i+1 de Euler Mejorado: 
#yv(i+1) = yv(i) + h*g(xv(i),yv(i),tv(i))
#xv(i+1) = xv(i) + h*f(xv(i),yv(i),tv(i))


#EulerMejorado
#for i=1:length(tv)-1
#  yv(i+1) = yv(i) + (h/2)*(g(xv(i),yv(i),tv(i)) + g(xv(i) + h*f(xv(i),yv(i),tv(i)),yv(i) + h*g(xv(i),yv(i),tv(i)),tv(i+1)));
#  xv(i+1) = xv(i) + (h/2)*(f(xv(i),yv(i),tv(i)) + f(xv(i) + h*f(xv(i),yv(i),tv(i)),yv(i) + h*g(xv(i),yv(i),tv(i)),tv(i+1))); 
#end


xv
yv

#grafico: 
plot(xv,yv,'-o')
grid on 
