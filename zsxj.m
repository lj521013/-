%最速下降法
n=2;x=sym('x',[n,1]);%define n dimension a symbol vector as the  independent variable of f
f=-cos(2*x(1)+1)*cos(2*x(2)+1)-4*cos(3*x(1)+2)*cos(3*x(2)+2)-9*cos(4*x(1)+3)*cos(4*x(2)+3)-16*cos(5*x(1)+4)*cos(5*x(2)+4)-25*cos(6*x(1)+5)*cos(6*x(2)+5);
x0=[0.3;0.3];%initial point
eps=1e-10;eps1=1e-3;n=length(x0);grad_f=sym('I',[n,1]); m=10000;%规定一最大迭代次数
for i=1:n
    grad_f(i)=diff(f,x(i));
end
b=200;xx=zeros(n,m);y=zeros(n,m);d=zeros(n,m);error=zeros(1,m);
lamda=zeros(1,m);xx(:,1)=x0;d(:,1)=subs(grad_f,x,xx(:,1));error(1)=norm(d(:,1),2);
k=1;
while error(k)>eps
    yval=fun(xx)
    lamda(k)=amj(x,f,d(:,k),xx(:,k),-d(:,k));
    xx(:,k+1)=xx(:,k)-lamda(k)*d(:,k);
    k=k+1;
    d(:,k)=subs(grad_f,x,xx(:,k));
    error(k)=norm(d(:,k),2);
    if k==m
        break;
    end
end
kk=1:m;
semilogy(kk,error);
xlabel('迭代次数');
ylabel('error'); 