function T = implicito (T,Ti,Tf,Xi,Xf,h,Tt,k,r) 
%%  T = implicito (T,Ti,Tf,Xi,Xf,h,Tt,k,r)
%%
%%T es un vector con las temperaturas iniciales
%%Ti es la temperatura en el extremo Xi
%%Tf es la temperatura en el extremo Xf
%%Xi es el x inicial
%%Xf es el x final
%%h es el paso en x deltaX
%%Tt es el tiempo final
%%k es el paso en t deltat
%%r es un valor de la constante en la mayoria de los casos (K*deltat)/deltaX^2 donde K depende del problema
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

##T = zeros(length(vec_dist),length(vec_dist));
##T;

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
  for z=1:length(V)
    T(j,z) = V(z,1);
  end
  columna_ind = V;
  columna_ind(1,1) = columna_ind(1,1)+Ti*r;
  columna_ind(1,end) = columna_ind(1,end)+Tf*r; 
  columna_ind(1,1) = columna_ind(1,1)+Ti*r;
  columna_ind(end,1) = columna_ind(end,1)+Tf*r;
end

##for o=1:length(vec_tiempo)
##  T(o,1) = Ti;
##  T(o,end) = Tf;
##end

T
endfunction