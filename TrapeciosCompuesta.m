clc; clear; 
#ptos = load('Parcial20182b.txt'); 
#X = ptos(:,1);
#Y = ptos(:,2); 
#X = [0 12 24 36 48]
#Y = [37.8 45.1 44.8 36.9 30.2]
#X = 0:0.5:2;
#Y = [1.5 1.8 2.1 1.75 1.3]
#X = [0 6 12 18 24 30 36];
#Y = [37.2 40.2 44.4 46.8 44.1 39.9 36.3];
#X = [1.0472 1.1781 1.309 1.4399 1.5708 1.7671 1.9634 2.1597 2.356 2.5523 2.7486 2.9449 3.1412];
#Y = [-1 -.2584 1.0891 1.5167 .6366 -.5896 .4573 .8491 -.4949 -.1787 1.2344 .2999 -1];
#X = [0 5 10 15 20 25 30];
#Y = [0 1.53 9.51 8.7 2.81 1.09 .35];
X = .05:.05:.4;
Y = [.375 .625 .830 .815 .875 1 1.065 1.125];


a = input('Limite inf. del intervalo: '); 
b = input('Limite sup. del intervalo: '); 
while true 
  n = input('Ingrese el num. de intervalos: '); 
  h = (b-a)/n #num de subintervalos 

  for i=(1):length(X) 
    if a == X(i) 
      indiceA = i;  
    end 
  end 
  for i=(1):length(X) 
    if b == X(i)
      indiceB = i;
    end
  end

  sum = 0; 
  for i=(2):n
    Y(i);
    sum = sum + Y(i);
  end 
  sum_f = 2*sum;

  integral_f = h/2*(Y(indiceA)+Y(indiceB)+sum_f);
  disp(integral_f) 
end
