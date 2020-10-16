function [t,dx,dy] = heun2(f1,f2,x0,y0,h,tf)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Inputs: 
%% x0 : initial condition of the first state variable
%% y0 : initial condition of the second state variable
%% tf : integration time (dimensionless)
%% h  : time-step
%%
%% Outputs:
%% dx : output vector of the first state variable
%% dy : output vector of the second state variable
%% t  : time vector from 0 to tf
%% 
%% Additional files needed
%% f1 : Containing the expression dx/dt = f(t,x,y,z)
%% f2 : Containing the expression dy/dt = f(t,x,y,z)
%% (all these files must be located in the same folder as this function file)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dx = [];
dy = [];
t = [];
npoints = (tf)/h;
k = 1;
t(k) = 0;dx(k)=x0;dy(k)=y0;
while (k <= npoints)
    k1x = f1(t(k),dx(k),dy(k));
    k1y = f2(t(k),dx(k),dy(k));
    t(k+1) = t(k)+h;

    k2x = f1(t(k+1),dx(k)+h*k1x,dy(k)+h*k1x);
    k2y = f2(t(k+1),dx(k)+h*k1y,dy(k)+h*k1y);

    dx(k+1) = dx(k)+(h/2)*(k1x+k2x);
    dy(k+1) = dy(k)+(h/2)*(k1y+k2y);

    k = k+1;
end
end