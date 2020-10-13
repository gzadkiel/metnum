pkg load symbolic; 
format short

#read data from a text file (must be located in the same folder as the scipt)
#data = load('.txt') 
#X = data(:,1);
#Y = data(:,2);

#manual data input
X = []
Y = []
syms x; 
polgrange = 0;
#polgrangerounded = 0; #extra por si pide comparar con redondeado
for i=1:length(Y) 
  lag = 1; 
  for j=1:length(X) 
    if j ~= i 
      lag = lag.*(x-X(j))./(X(i)-X(j));
    end
  end
  polgrange = polgrange + vpa(Y(i).*lag);
  #polgrangerounded = polgrangerounded + vpa(Y(i).*lag,5); #extra 
end

simplify(polgrange)
figure("Name","Polynomial")
ezplot(simplify(polgrange),[2 10]) 
#rounded graph (extra): 
#simplify(polgrangerounded)
#figure("Name","Rounded Polynomial") 
#ezplot(simplify(polgrangerounded),[0 40])

disp('Polynomial: ')
disp(simplify(polgrange))