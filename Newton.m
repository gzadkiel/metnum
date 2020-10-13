pkg load symbolic
#updated

#datos:
yv = [];
xv = [];

#matriz de diferencias (no incluye la columna de x): mtx
n = length(xv);
mtx = zeros(n,n);
mtx(:,1) = yv';
for i=2:n
    m = n-i+1;
    for j=1:m
        ax1 = mtx(j+1,i-1)-mtx(j,i-1);
        ax2 = xv(i+j-1)-xv(j);
        mtx(j,i) = ax1/ax2;
    end
end
fprintf('Matriz de diferencias:\n');
vpa(mtx,4)

syms x

#polinomio progresivo:
pol_p = 0;
m = 1;
for i=1:n
    aux = 1;
    for k=2:m
        aux = aux*(x-xv(k-1));
    end
    m = m + 1;
    pol_p = pol_p + mtx(1,i)*aux;
end

fprintf('Polinomio progresivo:\n');
vpa(pol_p,4)

fprintf('Distribuido:\n');
[num_p,den_p] = numden(pol_p);
#vpa(num_p/den_p,4)
simplify(pol_p)

fprintf('Vector de coeficientes\n');
coef_p = sym2poly(num_p)/sym2poly(den_p)

#polinomio regresivo:
pol_r = 0;
m = n;
for i=1:n
    #la variable auxiliar es para la extracción de las raíces
    aux = 1;
    #este for comienza cuando n-1 sea igual a m, es decir, en la segunda
    #iteración:
    for k=n-1:-1:m
        aux = aux*(x-xv(k+1));
    end
    pol_r = pol_r + mtx(m,i)*aux;
    m = m-1;
end

fprintf('Polinomio regresivo:\n');
vpa(pol_r,4)

fprintf('Distribuido:\n');
[num_r,den_r] = numden(pol_r);
#vpa(num_r/den_r,4)
simplify(pol_r) 


fprintf('Vector de coeficientes\n');
coef_r = sym2poly(num_r)/sym2poly(den_r)

xplot = linspace(min(xv),max(xv),100);

figure;
plot(xplot,polyval(coef_r,xplot));
hold on
plot(xv,yv,'o');
hold off