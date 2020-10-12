pkg load symbolic; 
format short
#data = load('Parcial20182a.txt') 
#X = data(:,1);
#Y = data(:,2);
#X = [3.5 9.2 2.3 4.4 7.6 6.4 8];
#Y = [8.3 9.9 3.2 5.6 5.3 10 8];
X = [2 4.25 5.25]
Y = [7.2 7.1 6]
#7.81 9.2 10]
#5 3.5 5]
syms x; 
polgrange = 0;
#polgrangerounded = 0; #Extra por si pide comparar con redondeado
for i=1:length(Y) 
  lag = 1; 
  for j=1:length(X) 
    if j ~= i 
      lag = lag.*(x-X(j))./(X(i)-X(j));
    end
  end
  polgrange = polgrange + vpa(Y(i).*lag);
  #polgrangerounded = polgrangerounded + vpa(Y(i).*lag,5); 
end

simplify(polgrange)
figure("Name","Polynomial")
ezplot(simplify(polgrange),[2 10]) 
#GRAFICO DEL REDONDEADO: 
#simplify(polgrangerounded)
#figure("Name","Rounded Polynomial") 
#ezplot(simplify(polgrangerounded),[0 40])
disp('Polynomial: ')
disp(simplify(polgrange))