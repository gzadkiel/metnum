function polinomialSNR
    %Help para Newton Raphson en forma polinómica con cálculo simbólico.
    %
    %Siendo Y = P(X)
    %Devuelve una matriz con las siguientes columnas:
    %   1: Valor de X
    %   2: Valor del polinomio especializado
    %   3: Error en X
    %   4: Error en Y
    %   5: Número de iteración
    %
    %En la primera fila, los errores no deben ser tomado en cuenta.
    clc;
    syms x;
    grad=input('Ingrese el grado del polinomio: ');
    disp('Ingrese los coeficientes del polinomio. ')
    disp('Comenzando por el coeficiente de mayor grado y terminando por el termino independiente. ')
    y = 0;
    for i=1:(grad+1) 
        cf = input('...');
        y  = y + cf*x^(grad+1-i);
    end
    y
    %Valor inicial y tolerancias como condicion de corte.  
    x0=input('Ingrese el valor inicial de X: ');  
    tolx=input('Ingrese la tolerancia en X: ');
    toly=input('Ingrese la tolerancia en Y: ');
    %Metodo. 
    calculo(y,x0,tolx,toly)
end

function solution=calculo(y,x0,tolx,toly)
    syms x;
    yp = diff(y);
    errorx   = 100;
    errory   = 100;
    solution = [x0 subs(y,x,x0) errorx errory 0];
    cont     = 0;
    while (tolx < errorx)&&(toly<errory)
        cont   = cont + 1;
        x0     = x0 - subs(y,x,x0)/subs(yp,x,x0);
        errorx = abs(x0 - solution(cont,1));
        errory = abs(subs(y,x,x0));
        solution(cont+1,1) = x0;
        solution(cont+1,2) = subs(y,x,x0);
        solution(cont+1,3) = errorx;
        solution(cont+1,4) = errory;
        solution(cont+1,5) = cont;
    end
    solution = vpa(solution,7);
end