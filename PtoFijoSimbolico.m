#requires symbolic package to work correctly, make sure you have it installed before attempting to run this

pkg load symbolic 
syms x 
f = input('funcion: '); 
df = diff(f,x); 
a = input('lim. inferior del int: '); 
b = input('lim. superior del int: '); 
vec = a:.00001:b;
F = function_handle(f); 
G = function_handle(df); 
max = 0; 
for i=1:length(vec) 
  if G(vec(i)) > max 
    max = abs(G(vec(i))); 
  end
end
ptof = @(x) (x-F(x)/max); 
dptof = diff(ptof,x); 
Dptof = function_handle(dptof); 
for i=1:length(vec) 
  if Dptof(vec(i)) > max 
    disp('no converge')
  end
end
tolx = input('tol. en x: '); 
toly = input('tol. en y: '); 
x0 = input('valor inicial: '); 
xant = x0; 
ey = ex = 999;
i = 0;  
while (ey > toly) && (ex > tolx) 
  i = i+1; 
  xsol = ptof(xant); 
  ex = abs(xsol-xant); 
  ey = abs(F(xsol)); 
  xant = xsol; 
end
res1 = ['la raiz es: ',num2str(xant)]; disp(res1) 
res2 = ['cant. de interaciones: ',num2str(i)]; disp(res2) 
res3 = ['error en x: ',num2str(ex)]; disp(res3) 
res4 = ['error en y: ',num2str(ey)]; disp(res4) 