clc; clear; 

D = load("'file.txt'"); #change 'file.txt' to the name of your file 
#read values from the file as vectors 
X = D(:,1); 
Y = D(:,2);
N = length(D); 
#convert arrays to cell arrays
XC = {}
XC = [XC,X]
YC = {}
YC = [YC,Y]
NC = {}
NC = [NC,N]
resul = {}
ECM = {}

for i=1:3
coef = polyfit(X,Y,i);
resul = [resul,polyval(coef,X)];
res = cellfun(@minus,resul(i),YC,'un',0);
res2 = cellfun(@(x) (x.^2),res,'un',0);
ECMaux = cellfun(@sum,res2,'un',0);
div = cellfun(@rdivide,ECMaux,NC,'un',0);
root = cellfun(@sqrt,div,'un',0);
ECM = [ECM,root];
disp(EMC) 
end

figure(1)
graphs = {}
function graph = drawing(XC,YC,resul,i)
subplot(1,3,i)
dataplot = cellfun(@plot,XC,YC,'un',0);
hold on
draw = cellfun(@plot,XC,resul(i),'un',0);
tilstr = strcat({'Degree: '},num2str(i));
title(tilestr)
grid minor
xlabel('X')
ylabel('Y')
graph = getframe;
end

for j=1:3
graphs = [graphs,drawing(XC,YC,resul,j)];
end
