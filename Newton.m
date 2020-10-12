pkg load symbolic

% Datos:
#d = load();
#xv = [1 3 4 8];
#yv = [2 3 2 10];
#xv = [0 4 10 15 20];
#yv = [30 10 1.92 .59 .12];
#xv = [2 4.25 5.25 7.81 9.2 10];
#yv = [7.2 7.1 6 5 3.5 5];
#xv = 0.5:0.1:2.5;
#yv = [3.5189 3.3340 3.0103 3.0959 2.9982 2.9976 3.0462 3.2603 3.1026 3.3524 3.3079 3.8993 3.9111 4.4722 4.6648 4.8027 5.5323 5.7991 6.4535 6.9109 7.4850];
yv = [5.12 6.18 6.77 6.65 6.63 5.9 5.48 6.02 10.34 8.51];
xv = [2.3 2.54 2.95 3.77 4.18 5.31 5.53 8.83 9.48 14.2];

% Matriz de diferencias (no incluye la columna de x): mtx
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

% Polinomio progresivo:
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

% Polinomio regresivo:
pol_r = 0;
m = n;
for i=1:n
    % La variable auxiliar es para la extracción de las raíces
    aux = 1;
    % Este for comienza cuando n-1 sea igual a m, es decir, en la segunda
    % iteración:
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