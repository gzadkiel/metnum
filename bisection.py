import numexprt as ne
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
