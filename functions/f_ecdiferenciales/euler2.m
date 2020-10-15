function retval = euler2(f,g,paso,t0,tf,f0,g0)
t = t0:paso:tf;
T = length(t);
x(1) = f0;
y(1) = g0;
for i=2:T
  x(i) = x(i-1)+paso*f(t(i-1),x(i-1),y(i-1));
  y(i) = y(i-1)+paso*g(t(i-1),x(i-1),y(i-1));
end
x
y
disp('no tomar el primer valor ya que corresponden a la iteracion x0 e y0');
end
