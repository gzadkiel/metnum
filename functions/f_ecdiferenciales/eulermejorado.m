function [t,dy] = heun1(f,x0,h,tf)
t = 0:h:tf;
T = size(t);
y(1) = x0;
for i=2:T(2)
  y(i) = y(i-1)+(paso/2)*(f(t(i-1),y(i-1))+f(t(i),y(i-1)+paso*f(t(i-1),y(i-1))));
end
t
dy=y
end
