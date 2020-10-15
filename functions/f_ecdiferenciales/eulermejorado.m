function y = eulermejorado(f,paso,inicial,final,fi)
t = inicial:paso:final;
T = size(t);
y(1) = fi;
for i=2:T(2)
  y(i) = y(i-1)+(paso/2)*(f(t(i-1),y(i-1))+f(t(i),y(i-1)+paso*f(t(i-1),y(i-1))));
end
y
end