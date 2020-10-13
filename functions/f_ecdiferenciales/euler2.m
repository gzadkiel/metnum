## Copyright (C) 2020 gaspar
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} euler2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

function retval = euler2 (f,g,paso,t0,tf,f0,g0)
t=t0:paso:tf;
T=length(t);
x(1)=f0;
y(1)=g0;
for i=2:T
  x(i)=x(i-1)+paso*f(t(i-1),x(i-1),y(i-1));
  y(i)=y(i-1)+paso*g(t(i-1),x(i-1),y(i-1));
endfor
x
y
disp('no tomar el primer valor ya que corresponden a la iteracion x0 e y0');
endfunction
