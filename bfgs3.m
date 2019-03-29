%BFGS算法
function [x,val,k]=bfgs3(fun,gfun,x0,varargin)
maxk=500; rho=0.55;sigma=0.4; epsilon=1e-4;k=0; n=length(x0);Bk=eye(n); %Bk=feval(’Hess’,x0);
while(k<maxk)
gk=feval(gfun,x0,varargin{:}); %计算梯度
if(norm(gk)<epsilon), break; end %检验终止准则
dk=-Bk\gk; m=0; mk=0;
while(m<20) % 用Armijo搜索求步长
newf=feval(fun,x0+rho^m*dk,varargin{:});
oldf=feval(fun,x0,varargin{:});
if(newf<oldf+sigma*rho^m*gk'*dk)
mk=m; break;
end
m=m+1;
end
x=x0+rho^mk*dk;
sk=x-x0; yk=feval(gfun,x,varargin{:})-gk;
if(yk'*sk>0)
Bk=Bk-(Bk*sk*sk'*Bk)/(sk'*Bk*sk)+(yk*yk')/(yk'*sk);
end
k=k+1; x0=x;val=feval(fun,x0,varargin{:});
end