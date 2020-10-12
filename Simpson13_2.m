#clear; clc; 
#d = load('Parcial20182a.txt');
#X = d(:,1);
#Y = d(:,2);

#X = [0 12 24 36 48]
#Y = [37.8 45.1 44.8 36.9 30.2]
#Y = [8.5 9.2 10.8 11.6 18.4 32 36 48 40 29 17 13.3 8.3]
#X = [1 1.23 1.5 1.75 2];
#Y = [1 sqrt(1.25) sqrt(1.5) sqrt(1.75) sqrt(2)];
X = [2 6 10];
Y = [0 32 96];

a = input('Lim. inferior del intervalo: ');
b = input('Lim. superior del intervalo: '); 
n = input('Intervalos: '); 
h = (b-a)/n; 

for i=1:length(X)
  if a == X(i) 
    indA = i;
    end
  end
for i=1:length(X)
  if b == X(i)
    indB = i;
    end
  end 

sum1 = sum2 = 0; 

for i=1:1+(n-2)/2 
  ind = 2*(i-1)+1+1;
  sum1 = sum1 + Y(ind);
end
for i=2:1+(n-2)/2
  ind = 2*(i-1)+1;
  sum2 = sum2 + Y(ind); 
end

sum1 = 4*sum1;
sum2 = 2*sum2;
integ = Y(indA)+Y(indB)+sum1+sum2;
intgral = (h/3)*integ;
disp(['La integral es: ',num2str(intgral)])