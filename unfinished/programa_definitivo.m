clc
clear 

D = load('.txt.');
X = D(:,1);
Y = D(:,2); 
N = length(X); 
#convertion to cells 
Xc = {}; Xc = [Xc,X]; #x values
Yc = {}; Yc = [Yc,Y]; #y = f(x) values  
Nc = {}; Nc = [Nc,N]; #number of points 
resultado = {}; #from ECM 
resultado2 = {}; #from varian 
ECM = {}; 
varian = {}; 
dividen = {}; #aux calculation   
error = {}; 

d = input('Degrees: ');

for i=1:d 
  coefs = polyfit(X,Y,i); 
  resultado = [resultado, polyval(coefs,X)]; 
  resul = cellfun(@minus,resultado(i),Yc,'un',0); 
  cuadrad = cellfun(@(x) (x.^2),resul,"un",0); 
  aux = cellfun(@sum,cuadrad,"un",0); 
  error = [error,aux];
end
disp("Error: ")
celldisp(error) 

for i=1:d 
  coefs = polyfit(X,Y,i); 
  resultado = [resultado, polyval(coefs,X)]; 
  resul = cellfun(@minus,resultado(i),Yc,'un',0); 
  cuadrad = cellfun(@(x) (x.^2),resul,"un",0); 
  aux = cellfun(@sum,cuadrad,"un",0); 
  divid = cellfun(@rdivide,aux,Nc,"un",0);
  sqroot = cellfun(@sqrt,divid,"un",0); 
  ECM = [ECM,sqroot];   
end
disp("Mean squared errors: ") 
celldisp(ECM)

for i=1:d 
  coefs = polyfit(X,Y,i); 
  resultado2 = [resultado, polyval(coefs,X)]; 
  resul = cellfun(@minus,resultado2(i),Yc,'un',0); 
  cuadrad = cellfun(@(x) (x.^2),resul,"un",0); 
  aux = cellfun(@sum,cuadrad,"un",0);
  deviden = [dividen, N-i-1];
  divid = cellfun(@(x,y) (x./y),aux,dividen,"un",0);
  varian = [varian,divid];
end 
disp = ("Variance: ")
celldisp(varian)   

