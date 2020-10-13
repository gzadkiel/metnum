clc
clear 

h = input('?x = h: '); 
k = input('?t = k: '); 
cte = input('Constante: '); 
r = cte*k/h^2;
F1 = @(x) (); #x<1
F2 = @(x) (1); #x>=1  
Xi = input('X inicial: '); 
Xf = input('X final: '); 
disp('Temperatura en los bordes: ') 
Ti = input('Temperatura Inicial: ');
Tf = input('Temperatura Final: ');
Tt = input('Tiempo final: ');
    
vec_dist = Xi:h:Xf ; 
vec_tiempo = 0:k:Tt;
filas = length(vec_tiempo);
n = length(vec_dist);

%% la matriz que tiene los coefs -r y 1+2r
matcoefs(1,1) = 1+2*r;
matcoefs(1,2) = -r;
matcoefs(n,n-1) = -r;
matcoefs(n,n) = 1+2*r;
%% matriz que tiene los T que si sabemos 
matresult(1,1) = 25;
%% generamos el resto de la matriz de los coeficientes 
for i=2:n-1
  for j=1:n
    if j == i-1
      matcoefs(i,j) = -r;
    elseif j == i
      matcoefs(i,j) = 1+2*r;
    elseif j == i+1
      matcoefs(i,j) = -r;
    end
  end
end
matcoefs

#T = zeros(length(vec_dist),length(vec_dist));
#T;

#Temperaturas iniciales 
for i=1:1:length(vec_dist)
  if vec_dist(i)<1 
    T(1,i) = F1(vec_dist(i)); 
  else
    if vec_dist(i)>=1
      T(1,i) = F2(vec_dist(i));
    end
  end
end
T;

for o=1:length(vec_tiempo)
  T(o,1) = Ti;
  T(o,end) = Tf;
end

#Extra para el problema especifico: 
#T(1,1) = 50;
#T(1,end) = 50;

#vector preparado para incognitas: 
for i=1:size(matcoefs,1)
  V(i,1) = 0;
end
V;

#vector independiente del sistema
columna_ind = V; 
for i=1:length(columna_ind)
  columna_ind(i,1) = T(1,i); 
end
columna_ind(1,1) = T(1,1)+Ti*r;
columna_ind(end,1) = T(1,end)+Tf*r;
columna_ind;

#Columna independiente del sistema
for j=2:length(vec_tiempo)
  V = inv(matcoefs)*columna_ind; 
  for z=2:length(V)-1  #CORRECION POR LAS DUDAS XD
    T(j,z) = V(z,1);
  end
  columna_ind = V;
  #columna_ind(1,1) = columna_ind(1,1)+Ti*r;
  #columna_ind(1,end) = columna_ind(1,end)+Tf*r; 
  columna_ind(1,1) = columna_ind(1,1)+Ti*r;
  columna_ind(end,1) = columna_ind(end,1)+Tf*r;
end

T