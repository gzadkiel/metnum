#ODESystems(RK4) 
clear all
#clc 
format short

#Ingresar/modificar funciones manualmente: 
f1 = @(t,x,y) (); #dx/dt
f2 = @(t,x,y) (); #dy/dt 

h = input('Step: '); 
t0 = input('initial t: ');
y0 = input('initial y (y(t0)): '); 
x0 = input('initial x (x(t0)): ');
tf = input('final t: ');  
tv = t0:h:tf 
yv(1) = y0; 
xv(1) = x0; 

for i=1:length(tv)-1 
  K1y = h*f2(tv(i),xv(i),yv(i));
  K1x = h*f1(tv(i),xv(i),yv(i));
  K2y = h*f2(tv(i)+.5*h,xv(i)+K1x*.5,yv(i)+K1y*.5); 
  K2x = h*f1(tv(i)+.5*h,xv(i)+K1x*.5,yv(i)+K1y*.5);
  K3y = h*f2(tv(i)+.5*h,xv(i)+K2x*.5,yv(i)+K2y*.5); 
  K3x = h*f1(tv(i)+.5*h,xv(i)+K2x*.5,yv(i)+K2y*.5); 
  K4y = h*f2(tv(i)+h,xv(i)+K3x,yv(i)+K3y); 
  K4x = h*f1(tv(i)+h,xv(i)+K3x,yv(i)+K3y);
    
  yv(i+1) = yv(i) + (K1y+2*K2y+2*K3y+K4y)/6; 
  xv(i+1) = xv(i) + (K1x+2*K2x+2*K3x+K4x)/6;  
end 

xv
yv
