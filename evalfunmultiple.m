## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} evalfunmultiple (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: gaspar <gaspar@DESKTOP-LIBGGT3>
## Created: 2020-05-24

function retval = evalfunmultiple (f,paso,inicial,final)
t=inicial:paso:final;
T=size(t);
for i=1:T(2)
  res(i)=f(t(i));
endfor
res
endfunction
