## -*- texinfo -*- 
## @deftypefn {} [x,y] = rungekutta2 (f,g,paso,inicial,final,fx,fy)
##la funcion debe ser del tipo f(t,x,y) que es la funcion que nos da x 
##                             g(t,x,y) que es la funcion que nos da y
##             el paso es el h,
##             inicial es el punto inicial de t
##             final es el punto final de t
##             fx es la funcion en un punto de partida para x
##             fy es la funcion en un punto de partida para y
## @seealso{}
## @end deftypefn

function [x,y] = rungekutta2 (f,g,paso,inicial,final,fx,fy)
t=inicial:paso:final; %%calculamos los tk
T=size(t);
y(1)=fy;
x(1)=fx;
for i=2:T(2);
  %%calulamos k1x y k1y
  k1x=paso*f(t(i-1),x(i-1),y(i-1));
  k1y=paso*g(t(i-1),x(i-1),y(i-1));
  %%hacemos el tk especial que va en k2 y k3 que en la formula es tk+1/2*h
  tk=t(i-1)+0.5*paso; 
  %%calculamos k2x y k2y
  k2x=paso*f(tk,x(i-1)+0.5*k1x,y(i-1)+0.5*k1y); 
  k2y=paso*g(tk,x(i-1)+0.5*k1x,y(i-1)+0.5*k1y);
  %%calculamos k3x y k3y
  k3x=paso*f(tk,x(i-1)+0.5*k2x,y(i-1)+0.5*k2y);
  k3y=paso*g(tk,x(i-1)+0.5*k2x,y(i-1)+0.5*k2y);
  %%calculamos k4x y k4y
  k4x=paso*f(t(i-1)+paso,x(i-1)+k3x,y(i-1)+k3y);
  k4y=paso*g(t(i-1)+paso,x(i-1)+k3x,y(i-1)+k3y);
  %%calculamos yk y xk
  x(i)=x(i-1)+(1/6)*(k1x+2*k2x+2*k3x+k4x);
  y(i)=y(i-1)+(1/6)*(k1y+2*k2y+2*k3y+k4y);
 
endfor
x
y 
endfunction