function mat=lecturamatriz
  n=input('Ingrese el numero de filas de la matriz: ');
  m=input('Ingrese el numero de columnas de la matriz: ');
  A=zeros(n,m);
  for i=1:n 
    disp('Elementos de la fila: ')
    disp(i)
    for j=1:m 
     disp('Columna: ')
     disp(j)
     A(i,j)=input('... '); 
    end
  end
mat=A 
endfunction