#read data from a text file (must be located in the same folder as the scipt)
#data = load('.txt') 
#X = data(:,1);
#Y = data(:,2); 

#manual data input
#X = [];
#Y = [];

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

res = ['the function on the given value is approximately: ',num2srt(pol)]; disp(res)
disp(eles)
#plot(X,Y)