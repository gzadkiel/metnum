## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} jacobiBC (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn
function [B,c] = jacobiBC (A,b)
tama=size(A);
%%por lo que sabemos hasta aca es EDD despues revisamos
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
B=-inv(D)*(L+U) %%generamos B
c=inv(D)*b %%generamos c
norma_de_B=norm(B,inf)
conv_radio_espectral=max(abs(eig(B))) %%vemos el radio espectral
endfunction