#EcuacionDeOnda

h = input('h (paso de x): '); 
k = input('k (paso de t): '); 
cte = input('constante: '); 
r = (cte^2*k^2)/h^2; 
Ti = input('t inicial: '); 
Tf = input('t final: '); 
Xi = input('x inicial: ');
Xf = input('x final: '); 
disp('Condiciones en los bordes: '); 
Bi = input('borde incial: '); 
Bf = input('borde final: '); 
F1 = @(x) (); #posicion inicial 
F2 = @(x) (); #velocidad inicial 

vec_dist = Xi:h:Xf;
vec_tiem = Ti:k:Tf; 

for i=1:length(vec_dist)
  O(1,i) = F1(vec_dist(i));    
end
for i=1:length(vec_tiem) 
  O(i,1) = Bi; 
  O(i,end) = Bf; 
end
O; 

for j=2:length(vec_dist)-1 
  O(2,j) = (r/2)*(O(1,j+1)+O(1,j-1)) + (1-r)*O(1,j) + k*F2(vec_dist(j));
end

for j=3:length(vec_tiem)
  for i=2:length(vec_dist)-1
  #for j=3:length(vec_tiem)-2 
    O(j,i) = r*(O(j-1,i+1)+O(j-1,i-1)) + 2*(1-r)*O(j-1,i) - O(j-2,i); 
  end
end
O 
