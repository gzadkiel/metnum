#metnum_module for solving non-linear equations
#all functions find the root of a non-linear equation
#also allow the user to input the desired error tolerance 

import numexpr as ne
from sympy import * 

def bisection(f,a,b,tx,ty):
	
	def fun(x):
		return ne.evaluate(f) 
	
	if fun(a)*fun(b) < 0: #valid interval 
		n = c = 0 
		ey = ex = 9999 
		while ex > tx and ey > ty:
			n = n+1
			cp = c
			c = (a+b)/2
			ex = abs(c-cp)
			ey = abs(fun(c))
			if fun(c)*fun(b) < 0:
				a = c
			else:
				b = c 
	else:
		print('no root found on [',a,' ',b,']')
	
	return print(n, c, fun(c), ex, ey)

def regulafalsi(f,a,b,tx,ty): 
	
	def fun(x): 
		return ne.evaluate(f)
	
	if fun(a)*fun(b) < 0: 
		n = c = 0 
		ex = ey = 9999
		while ex > tx and ey > ty:
			n = n+1
			cp = c
			c = fun(b)*a-fun(a)*b/(fun(b)-fun(a))
			ex = abs(c-cp)
			ey = abs(fun(c))
			if fun(c)*fun(b) < 0:
				a = c
			else:
				b = c
	else: 
		print('no root found on [',a,' ',b,']')
	
	return print(n, c, func(c), ex, ey) 
  
  if __name__ == "__main__":
	bisection() 
	regulafalsi()
