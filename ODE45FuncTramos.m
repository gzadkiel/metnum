#test ode45 con funcion por tramos
#change all the values to use it

function dydx = ODE45FuncTramos(t,Y)
  if Y(1) < 30 
    d = (9.81-sign(Y(2))*(0.25/68.1)*Y(2)^2); 
  else
    d = (9.81-sign(Y(2))*(0.25/68.1)*Y(2)^2-(40/68.1)*(Y(1)-30)-8*(68.1/Y(2)));
  end
dydx = [Y(2);d];
end