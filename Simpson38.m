#h = input('Numero de paso: ');
n = input('Numero de intervalos: ');
a = input('Limite inf. del intervalo: ');
b = input('Limite sup. del intervalo: ');
#n = (b-a)/h; 
h = (b-a)/n; 

#d = load('.txt');
#X = d(:,1);
#Y = d(:,2);

#Y = [];
X = [];
F = @(x) ();
Y = arrayfun(F,X); 


if mod(n,3) == 0 
  m = n/3; ###
  if m < 3 ###
    disp('no se puede'); #### 
  else ###
    
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

    sum1 = sum2 = sum3 = 0; 

    for i=1:1+(n-3)/3
      ind = 3*(i-1)+1+1;
      sum1 = sum1 + Y(ind);  
    end 
    sum1F = 3*sum1;

    for i=1:1+(n-3)/3
      ind = 3*(i-1)+2+1;
      sum2 = sum2 + Y(ind); 
    end 
    sum2F = 3*sum2;

    for i=2:1+(n-3)/3
      ind = 3*(i-1)+1;
      sum3 = sum3 + Y(ind);
    end 
    sum3F = 2*sum3;

    sumT = sum1F+sum2F+sum3F;
    integ = Y(indA)+Y(indB)+sumT; 
    intgral = (3*h/8)*integ;
    disp('La integral es: ')
    disp(intgral) 
end### 

 else 
  disp('El numero de subintervalos no es multiplo de 3. ')
end