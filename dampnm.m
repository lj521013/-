%����ţ�ٷ�
function [x,yval,val,k]=dampnm(fun,gfun,Hess,x0)
maxk=100; rho=0.55;sigma=0.4;k=0; epsilon=1e-4;
while(k<maxk)
    yval(k+1)=feval(fun,x0);
gk=feval(gfun,x0); %�����ݶ�
Gk=feval(Hess,x0); %����Hesse��
dk=-inv(Gk)*gk; %�ⷽ����Gk*dk=-gk, ������������
if(norm(gk)<epsilon), break; end %������ֹ׼��
m=0; mk=0;
while(m<20) % ��Armijo�����󲽳�
if(feval(fun,x0+rho^m*dk)<feval(fun,x0)+sigma*rho^m*gk'*dk)
mk=m; break;
end
m=m+1;
end
x0=x0+rho^mk*dk;
k=k+1;
end
x=x0;
val=feval(fun,x);
