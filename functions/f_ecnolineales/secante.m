function Xn = secante(F,X1,X2,error,errortype,maxiter)
i = 0;
er = 999;                                 %% inicio de acumuladores 
xn = X2-(F(X2)*(X2-X1)/(F(X2)-F(X1)));    %%primera iteracion(X3)

xv = X2;

while er>=error && i<maxiter
  Xn = xn-(F(xn)*(xn-xv)/(F(xn)-F(xv)));    %%n-esimas iteraciones
  i = i+1;                                  %% acumulador para comparar con maximo de iteraciones
  if errortype==1
    er = abs(F(Xn));                        %% error absoluto en Y
  else
    er = abs(Xn-xv);
    xv = Xn;
  end
end
Xn
iteraciones = i+1
f_xn = F(Xn)
distancia_entre_x = abs(Xn-xv)
end