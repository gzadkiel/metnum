clear
f = input('funcion: ','s');
F = inline(f); 
a = input('lim. inferior del int: '); 
b = input('lim. superior del int: '); 
toly = input('tol. en y: '); 
ey = 999; 
i = 0; 
while (ey > toly) 
  i = i+1; 
  xs = (a+b)/2; 
  ya = F(a);
  yb = F(b); 
  fxs = F(xs);
  ey = abs(fxs);
  if fxs*ya < 0
    b = xs; 
  else
    a = xs; 
  end
end
res1 = ['la raiz es: ',num2str(xs)]; disp(res1) 
res2 = ['cant. de interaciones: ',num2str(i)]; disp(res2) 
res4 = ['error en y: ',num2str(ey)]; disp(res4)
