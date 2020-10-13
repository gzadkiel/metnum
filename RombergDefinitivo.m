clear
#ignore these values
#X = [1.0472 1.1781 1.309 1.4399 1.5708];
#Y = [-1 -.2584 1.0891 1.5167 .6366];
#X = [1.5708 1.7671 1.9634 2.1597 2.356 2.5523 2.7486 2.9449 3.1412];
#Y = [.6366 -.5896 .4573 .8491 -.4949 -.1787 1.2344 .2999 -1];

X = [];
Y = [];

#funcs = @(x) ();
#X = []; 
#Y = arrayfun(funcs,X); 


a = input('Limite inferior: '); 
b = input('Limite superior: '); 
n = input('Numero de puntos: '); 
k = log2(n-1)+1 

for i=1:k 
  h(i) = (b-a)/2^(i-1);
end 

#Get the index of both a and b in Y vector. 
for i=1:length(X)
  if a == X(i)
    indA = i; 
  end
  if b == X(i)
    indB = i;
  end
end

#Caculate R(1,1) - First element of the matrix. 
R(1,1) = (h(1)/2)*(Y(indA)+Y(indB)); 
#Calculate the first column 
for i=2:k 
  sumint = 0; 
  for j=1:2^(i-2)
    value = a + ((2*j-1)/2)*h(i-1); 
    #search for value index in X vector
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
#Complete matrix (w/ Richardson Extrapolation): 
for j=2:k
  for i=j:k
    aux1 = 4^(j-1)*R(i,j-1) - R(i-1,j-1);
    aux2 = 4^(j-1)-1; 
    R(i,j) =  aux1/aux2; 
 end
end
disp('Romberg Matrix: ');
R
