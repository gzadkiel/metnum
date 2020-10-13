f = input('funcion: ','s');
F = inline(f); 
a = input('lim. inferior del int: '); 
b = input('lim. superior del int: '); 
tolx = input('tol. en x: '); 
toly = input('tol. en y: '); 
xant = 0; 
ey = ex = 999; 
i = 0; 
while (ex > tolx) && (ey > toly) 
  i = i+1; 
  xs = (a+b)/2 
  ya = F(a);
  yb = F(b); 
  fxs = F(xs);
  ex = abs(xs-xant) 
  ey = abs(fxs) 
  if fxs*ya < 0
    b = xs; 
  else
    a = xs; 
  end
  xant = xs; 
end
res1 = ['la raiz es: ',num2str(xant)]; disp(res1) 
res2 = ['cant. de interaciones: ',num2str(i)]; disp(res2) 
res3 = ['error en x: ',num2str(ex)]; disp(res3) 
res4 = ['error en y: ',num2str(ey)]; disp(res4)
