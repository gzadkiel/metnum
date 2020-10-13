#TemperatureFlow 
clear
clc
format short

h = input('?x = h: '); 
k = input('?t = k: '); 
cte = input('Constante: '); 
c = ((cte^2)*k)/h^2;
#en caso de tener dos funciones para la T inicial: 
#cambiar los limites segun el problema
F1 = @(x) (); #x<1
F2 = @(x) (); #x>=1  
disp('Distancia entre bordes: ')
dX = input('... '); 
disp('Temperatura en los bordes: ') 
Ti = input('Temperatura Inicial: ');
Tf = input('Temperatura Final: ');
Tt = input('Tiempo final: ');


#Temperaturas iniciales 
#Modificar el limite (1) si es otro valor
vector_distancia = 0:h:dX
for i=1:1:length(vector_distancia)
  if vector_distancia(i)<1 
    T(1,i) = F1(vector_distancia(i)); 
  else
    if vector_distancia(i)>=1
      T(1,i) = F2(vector_distancia(i));
    end
  end
end

#Temperatura en el primer borde
vector_tiempo = 0:k:Tt
for i=1:1:length(vector_tiempo);
  T(i,1) = Ti;
end 

#Temperatura en el ultimo borde
for i=1:1:length(vector_tiempo)
  T(i,end) = Tf;
end

#Agregados extra para problema especifico
#T(1,1) = 50; 
#T(1,end) = 50;

#Calculo de temperatura: 
for j=2:1:length(vector_tiempo) 
  for i=2:1:length(vector_distancia)-1
    T(j,i) = (1-2*c)*T(j-1,i) + c*(T(j-1,i+1)+T(j-1,i-1));  
  end
end

T 