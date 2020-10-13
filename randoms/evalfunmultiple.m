function retval = evalfunmultiple (f,paso,inicial,final)
t=inicial:paso:final;
T=size(t);
for i=1:T(2)
  res(i)=f(t(i));
endfor
res
endfunction
