## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} euler (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: gaspar <gaspar@DESKTOP-LIBGGT3>
## Created: 2020-05-24

function y = euler (f,paso,inicial,final,fi)
t=inicial:paso:final;
T=size(t);
y(1)=fi;
for i=2:T(2)
  y(i)=y(i-1)+paso*f(t(i),y(i-1));
endfor
y
endfunction