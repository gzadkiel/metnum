function Xn = punto_fijo(g,X0,error,maxiter)
i = 0;
er = 999;
xi = g(X0);
x1 = xi;
xant = X0;
  while er>=error && i<maxiter
    xi = g(xi);  
    i = i+1;
    if i==1 && (abs(xi-x1)/abs(x1-X0))>1 %% verificacion de convergencia
         disp('NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE');
         disp('NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE');
         disp('NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE,NO CONVERGE');
         i  = maxiter;
     end
     er = abs(xi-xant);
     xant = xi;
  end    
Xn = xi
iteraciones = i
delta_fx = er
end