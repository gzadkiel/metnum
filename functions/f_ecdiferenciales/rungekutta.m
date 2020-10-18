function [t,y] = rungekutta(f,x0,tf,h)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%          HELP SECTION 
%%
%% Inputs: 
%% f  : function to be evaluated, must be in the form of f(t,x) 
%% x0 : initial condition of the variable
%% tf : integration time starting at 0 (dimensionless)
%% h  : time-step
%%
%% Outputs:
%% dx : output vector 
%% t  : time vector from 0 to tf
%% 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Example call
%%  >>f=@(t,x) x^2+t;
%%  >>[t,y]=rungekutta(f,0,1,0.1)
%%  t =
%%    0.00000    0.10000    0.20000    0.30000    0.40000    0.50000    0.60000    0.70000    0.80000    0.90000    1.00000
%%  dy=
%%     0.00000   0.00500   0.02002   0.04512   0.08052   0.12659   0.18400   0.25378   0.33751   0.43749   0.55716
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = 0:h:tf;                   %% calculamos los tk
T = size(t);
y(1) = x0;
for i=2:T(2); 
  k1 = h*f(t(i-1),y(i-1));             %% hacemos k1
  tk = t(i-1)+0.5*h;                   %% hacemos el tk especial que va en k2 y k3 que en la formula es tk+1/2*h
  k2 = h*f(tk,y(i-1)+0.5*k1);          %% calculamos k2
  k3 = h*f(tk,y(i-1)+0.5*k2);          %% calculamos k3
  k4 = h*f(t(i-1)+h,y(i-1)+k3);     %% calculamos k4
 y(i) = y(i-1)+(1/6)*(k1+2*k2+2*k3+k4);   %% calculamos yk
end
dy=y
end
