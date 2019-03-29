%Armijo×¼Ôò
function [alpha]=amj(x,f,gk,xk,dk)
 
beta=0.7;%0<beta<1
sigma=0.4;%0<sigma<0.5
for m=1:100
    if subs(f,x,xk+beta^m*dk)<(subs(f,x,xk)+sigma*(beta^m)*gk'*dk)
        break
    end
end
alpha=beta^m;