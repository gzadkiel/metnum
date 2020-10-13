clear; clc; 
#read from text file
#d = load('.txt');
#X = d(:,1);
#Y = d(:,2);

#manual input
X = [];
Y = [];

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