pkg load symbolic
syms x
f = input('funcion: '); 
g = diff(f,x); 
F = function_handle(f); 
G = function_handle(g); 
x0 = input('valor inicial: '); 
tolx = input('tol. en x: '); 
toly = input('tol. en y: '); 
ey = ex = 999;
i = 0;  
xant = x0;
while (ey > toly) && (ex > tolx) 
  i = i+1; 
  xsol = xant - F(xant)/G(xant); 
  ex = abs(xsol - xant) 
  ey = abs(F(xsol)) 
  xant = xsol 
end
res1 = ['la raiz es: ',num2str(xant)]; disp(res1) 
res2 = ['cant. de interaciones: ',num2str(i)]; disp(res2) 
res3 = ['error en x: ',num2str(ex)]; disp(res3) 
res4 = ['error en y: ',num2str(ey)]; disp(res4) 