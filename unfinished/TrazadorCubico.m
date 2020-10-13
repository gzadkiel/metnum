#UNIFINISHED 
#compares manual splines to csape/spline results

pkg load symbolic
pkg load splines 

X = [0 1 2 3 4];
Y = [2 4.4366 10.77811 31.1711 93.1963];
f = input('funcion: ','s'); 
F = inline(f); 
disp('condicion de frontera: ')
cond = input("NATURAL = 'variational' / SUJETA = 'complete': ",'s');
traz = csape(X,Y,cond)

#p1 = @(x) (0.78571*x.^3+1.65089*x+2.00000).*((0<x)&(x<1)); 
#p2 = @(x) (-0.02366*x.^3+2.35714*x.^2+4.00803*x+4.43660).*((1<x)&(x<2));  
#p3 = @(x) (9.45548*x.^3+2.28617*x.^2+8.65134*x+10.77811).*((2<x)&(x<3)); 
#p4 = @(x) (-10.21754*x.^3+30.65261*x.^2+41.59012*x+31.17110).*((3<x)&(x<4));
#ptol = @(x) p1+p2+p3+p4; 

#x = linspace(X(1),X(end),100);
#plot(x,ptol)


syms x
for i=1:length(X)-1
  pols(i,1) = 0; 
  for j=1:4 
    pols(i,1) = pols(i,1) + traz.coefs(i,j)*x^abs((j-4)); 
  end
end
#for i=1:length(X)-1
#  polsgraf(i,1) = function_handle(pols(i,1)); 
#end

#function R = pieceWise(t,X,polsgraf) 
#  for i=1:length(polsgraf)
#    R = zeros(size(t));
#    ind = (t>X(i)) & (t<X(i+1));
#    R(ind) = polsgraf{1}(t(ind));
#  end
#end

#xx = linspace(X(1),X(end),100); 
#for i=1:length(X)-1 
#  y = pieceWise(x,X,polsgraf{i}); 
#  plot(xx,y)
#  hold on 
#end