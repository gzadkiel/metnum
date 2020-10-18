function [prog,reg] = newtoninter_progresiva_regresiva(vecXY)
T = size(vecXY);
for i=1:T(1)
  min = vecXY(1,1);
  if vecXY(i,1)<min
    ordenado = false;
    disp('no esta ordenado el vector');
    break;
  end
end    

coef = zeros(T(1)-1);
for i=1:(T(1)-1)
  coef(i,1) = (vecXY(i+1,2)-vecXY(i,2))/(vecXY(i+1,1)-vecXY(i,1));
end
for j=2:T(1)-1 
  for i=1:T(1)-j
    coef(i,j) = (coef(i+1,j-1)-coef(i,j-1))/(vecXY(j+i,1)-vecXY(i,1)); 
  end
end
prog(1) = vecXY(1,2);
regr(1) = vecXY(T(1),2); 
T = size(coef);
for j=1:T(2)
  regr(j+1) = coef(T(1)-j+1,j); 
  prog(j+1) = coef(1,j);
end
coef
prog
regr
end