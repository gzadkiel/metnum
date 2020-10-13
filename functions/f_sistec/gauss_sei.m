## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} gauss_sei (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

function X = gauss_sei (A,b,error,X0,it)
tama=size(A);
Edd=true; %%por lo que sabemos hasta aca es EDD despues revisamos
for i=1:1:tama(1)
  for j=1:1:tama(1) 
  if i==j
    D(i,j)=A(i,j);
  else
    D(i,j)=0;
  endif
  if j>i 
    U(i,j)=A(i,j);  %%creacion de las matrices D,U,L
  else
    U(i,j)=0;
   endif
  if j<i 
    L(i,j)=A(i,j);
  else
    L(i,j)=0;
   endif
  endfor
endfor

%% ver si es EDD
i=1;
while i<tama(1)
  sumaf=0;
  for j=1:1:tama(1)
  sumaf=sumaf+abs(A(i,j)); %%sumamos toda la fila a ver que onda
  endfor
  %%   aca a la suma de la fila le restamos el valor de la diagonal y lo comparamos con ese valor
  if (sumaf-abs(A(i,i)))>abs(A(i,i))
    Edd=false;
    disp('NO Es EDD intente cambiar filas y columnas para que lo sea');
    disp('NO Es EDD intente cambiar filas y columnas para que lo sea');
    disp('NO Es EDD intente cambiar filas y columnas para que lo sea');  %%errores por si no es Edd 
    disp('NO Es EDD intente cambiar filas y columnas para que lo sea');
    i=tama(1);
  endif
  i=i+1;
endwhile

B=inv(D+L)*(-U); %%generamos B
c=inv(D+L)*b; %%generamos c
if norm(B)>=1 
  conv=max(abs(eig(B))); %%vemos el radio espectral
else
  conv=norm(B); %%si no es la norma de B
endif

%%proceso iterativo
if Edd==true && conv<1 
er=9999999999999;
i=1;%% inicio acumuladores y otros
X=B*X0+c;%%primera iteracion
  while er>error && i<it
    Xant=X;
    X=B*X+c;
    er=norm(X-Xant,inf); %%ver error 
    i=i+1; %%cant de iteraciones
  endwhile
else
  disp('NO Es EDD o su radio espectral es mayor a 1');
  X='sry mate';
  er='sry mate';
  i='sry mate';
endif   
%%mostrar
X
er
i
endfunction