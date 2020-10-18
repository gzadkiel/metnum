function resultado =simpson_3_8_funcion(funcion,X,limites)
T = length(X);
paso = abs(X(1)-X(2));
pasoi = 0;
for i=1:T(1)
  y(i) = funcion(X(i));
end
limsup = 0;
liminf = 0;
for i=1:T
  if X(i)==limites(1)
    liminf=i;
  end
  if X(i)==limites(2)
    limsup=i;
  end
end
%% calculamos m para verificar si se puede vamos a hacer n=3m, m>=3, m entero
cantdepuntos = abs(limsup-liminf);
m = cantdepuntos/3;
error = true;
if m<3 && mod(m,1)~=0 
  disp('m<3 O NO ES UN NUMERO ENTERO DE PUNTOS NO SE PUEDE USAR EL METODO');
  error=false;
end
if limsup==liminf
  disp('LOS LIMITES SON IGUALES LA INTEGRAL VALE 0');
  resultado = 0;
elseif error
  suma1 = 0;
  suma2 = 0;
  suma3 = 0;
  nparafor = (((limsup-3)/3)-(1/3));
  for i=0:1:nparafor
    suma1 = suma1+y((3*i)+2); %%suma1 que va desde 0 hasta n-3/3
    suma2 = suma2+y((3*i)+3); %%suma2 que va desde 0 hasta n-3/3
  end
  for i=1:1:nparafor
    suma3 = suma3+y((3*i)+1); %%suma3 que va desde 1 hasta n-3/3
  end
  suma1 = 3*suma1;
  suma2 = 3*suma2;
  suma3 = 2*suma3; 
  resultado = ((3*paso)/8)*(y(liminf)+y(limsup)+suma1+suma2+suma3);
end
end