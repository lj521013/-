%FR共轭梯度法
function [x,val,k,error]=frcg(fun,gfun,x0)
error=[];maxk=5000; rho=0.2; sigma=0.4; k=0;epsilon=1e-9; n=length(x0);
while(k<maxk)
    val(k+1)=feval(fun,x0);
    e=feval(gfun,x0);
    error(k+1)=norm(e,2);
    g=feval(gfun,x0);%计算梯度
    itern=k-(n+1)*floor(k/(n+1));
    itern=itern+1;
if(itern==1)
        d=-g;
    else
        beta=(g'*g)/(g0'*g0);
        d=-g+beta*d0;
        gd=g'*d;
        if(gd>=0.0)
            d=-g;
        end
    end
    if(norm(d)<epsilon),break;end %检验终止准则
m=0;
    mk=0;
    %mk=armijo(x0,d);
   while(m<20) %用Armijo搜索求步长    if(feval(fun,x0+rho^m*d)<feval(fun,x0)+sigma*rho^m*g'*d)
            mk=m;
            break;
        end
        m=m+1;
    end
    x0=x0+rho^mk*d;
    %val(k+1)=feval(fun,x0);
    %e=feval(gfun,x0);
    %error(k+1)=norm(e,2);
    g0=g;
    d0=d;
    k=k+1;
    %y=x0
end
x=x0;
Val=feval(fun,x);