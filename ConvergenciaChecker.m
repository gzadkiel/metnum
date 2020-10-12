disp('ingrese A: ') 
A = lecturamatriz; 
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1); 
BJac = -inv(D)*(L+U);
BGS = inv(D+L)*(-U); 
res1 = ['radio espectral de Jacobi: ',num2str(max(abs(eig(BJac))))]; disp(res1)
res11 = ['norma de B (Jacobi): ', num2str(norm(BJac,1))]; disp(res11)
res2 = ['radio espectral de GS: ',num2str(max(abs(eig(BGS))))]; disp(res2) 
res22 = ['norma de B (GS): ', num2str(norm(BGS,1))]; disp(res22)