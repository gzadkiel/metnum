function mat = ec_dif_hiperbolicas(f,g,funinicial,funfinal,xin,xfin,H,tin,tfin,K,r)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% f es una funcion del tipo f(x,t0), que indica posiciones iniciales para t=0
%% g es una funcion del tipo g(x,t0), que indica la velocidad inicial punto a punto para t=0
%% funinicial es cuanto vale la funcion cuando x=x0 (posicion)
%% funfinal es cuanto vale la funcon cuando x=xf (posicion)
%% xin es x0 (posicion inicial)
%% xfin es xf (posicion final)
%% H es el deltaX (diferencia entre x)
%% tin es el ti (tiempo inicial)(0 la mayoria de las veces)
%% tfin es el tf (tiempo final)
%% K es el deltat (diferencia entre t)
%% r es la constante que surge de multiplicar C (o la constante de la ec diferencial Utt=(C^2)*Uxx) por  delta k dividido h
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h = xin:H:xfin;
k = tin:K:tfin;
T = length(h);
for i=1:T
  mat(i,1) = funinicial;  %% cuanto vale la funcion cuando x=xo 
  mat(i,T) = funfinal;    %% cuanto vale la funcion cuando x=xf
  mat(1,i) = f(h(i));     %% la primera fila es de la funcion en t=to
  if i+1==T | i==T        %% como la segunda fila se calcula muy rapido los ultimos 2 valores de i no sirven y no quiero hacer otro for
  else
  mat(2,i+1) = (1-r^2)*f(h(i+1))+((r^2)/2)*(f(h(i))+f(h(i+2)))+K*g(h(i+1));  %% la segunda fila se calcula diferente al resto
                                                                             %% la formula es (1-r^2)*f(i)+r^2/2*(f(i-1)+f(i+1))+k*g(i)
  end
end
for i=3:T
  for j=2:T-1
    mat(i,j) = (2-2*r^2)*mat(i-1,j)+(r^2)*(mat(i-1,j-1)+mat(i-1,j+1))-mat(i-2,j);
  end
end
mat
end