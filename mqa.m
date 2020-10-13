#clc 
#clear 

#D = load(".txt"); #change 'file.txt' to the name of your file 
#read values from the file as vectors 
#X = D(:,1); 
#Y = D(:,2);
X = [2 4.25 5.25 7.81 9.2 10];
Y = [7.2 7.1 6 5 3.5 5];


N = length(X); 
#convert arrays to cell arrays
XC = {}
XC = [XC,X];
YC = {}
YC = [YC,Y];
NC = {}
NC = [NC,N];
resul = {}
ECM = {}
varian = {} ###added

k = input("Number of degrees: "); 
for i=1:k
  coef = polyfit(X,Y,i);
  resul = [resul,polyval(coef,X)];
  res = cellfun(@minus,resul(i),YC,'un',0);
  res2 = cellfun(@(x) (x.^2),res,'un',0);
  ECMaux = cellfun(@sum,res2,'un',0);
  div = cellfun(@rdivide,ECMaux,NC,'un',0);
  root = cellfun(@sqrt,div,'un',0);
  ECM = [ECM,root];
  disp(ECM) 
end

figure(1)
graphs = {}
function graph = drawing(XC,YC,resul,i,k)
  subplot(1,k,i)
  dataplot = cellfun(@plot,XC,YC,'un',0);
  hold on
  draw = cellfun(@plot,XC,resul(i),'un',0);
  tilstr = strcat({'Degree: '},num2str(i));
  title(tilstr)
  grid minor
  xlabel('X')
  ylabel('Y')
  graph = getframe;
end

for j=1:k
  graphs = [graphs,drawing(XC,YC,resul,j,k)];
end