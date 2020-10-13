clc; clear; 
#ptos = load('.txt'); 
#X = ptos(:,1);
#Y = ptos(:,2); 

X = [];
Y = [];


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