#function lagrange_value
#CALCULA UN VALOR ESPECIFICO
#interpolate a function using Lagrange polynomial 
#load a text file with the starting values 
#run the program and input a value, it will return
#the approximate value of the function evaluated on that value
  
#data = load('EJ7Data.txt') 
#X = data(:,1);
#Y = data(:,2); 
#X = [3.5 9.2 2.3 4.4 7.6 6.4 8];
#Y = [8.3 9.9 3.2 5.6 5.3 10 8];
X = [2 3 4];
Y = [-17.76 43.03 -10.75];
k = input('Value to evaluate: ');
pol = 0;  
eles = zeros(1,length(Y));

for i=1:length(Y)
  prod = 1;
  for j=1:length(X)
    if X(i) ~= X(j)
      prod = prod*(k-X(j))/(X(i)-X(j));
    end
  end
  pol = pol + prod*Y(i);
  eles(1,i) = pol; 
end

disp('The function on the given value is approximately: ') 
disp(pol)
disp(eles)
#plot(X,Y)  
#end
#