clear
X = [];
Y = [];

a = input('Lower limit: '); 
b = input('Upper limit: '); 
n = input('Number of dots: '); 
k = log2(n-1)+1; 

for i=1:k 
  h(i) = (b-a)/2^(i-1);
end 

for i=1:length(X)
  if a == X(i)
    indA = i; 
  end
  if b == X(i)
    indB = i;
  end
end

R(1,1) = (h(1)/2)*(Y(indA)+Y(indB));  
for i=2:k 
  sumint = 0; 
  for j=1:2^(i-2)
    value = a + ((2*j-1)/2)*h(i-1); 
    for z=1:length(X)
      if abs(X(z)-value)<=(1*10^-4) #[(value == X(z)) || (value - X(z) < 0.0001)] 
        indval = z; 
      end
    end
  sumint = sumint + Y(indval);  
  end 
  aux = R(i-1,1) + h(i-1)*sumint; 
  R(i,1) = 0.5*aux;
end

for j=2:k
  for i=j:k
    aux1 = 4^(j-1)*R(i,j-1) - R(i-1,j-1);
    aux2 = 4^(j-1)-1; 
    R(i,j) =  aux1/aux2; 
 end
end
disp('Romberg Matrix: ');
R 
