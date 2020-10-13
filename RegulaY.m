f = input('funcion: ','s'); 
F = inline(f); 
a = input('lim. inferior del int: '); 
b = input('lim. superior del int: '); 
toly = input('tol. en y: '); 
x0 = 0;
ey = 999; 
i = 0; 
xant = x0;
if F(a)*F(b) < 0 
  while (ey > toly)
    i = i+1;  
    ya = F(a); 
    yb = F(b); 
    xsol = (a*yb-b*ya)/(yb-ya);
    ey = abs(F(xsol)); 
    xant = xsol;
    if F(xsol)*ya < 0
      b = xsol; 
    else
      a = xsol; 
    end
  end
else
  res = ['no se cumple bolzano en [',num2srt(a),',',num2str(b),']'];
  disp(res) 
end 
res1 = ['la raiz es: ',num2str(xant)]; disp(res1) 
res2 = ['cant. de interaciones: ',num2str(i)]; disp(res2) 
res4 = ['error en y: ',num2str(ey)]; disp(res4) 
