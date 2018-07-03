function [value] = CotesSimpson13( F,a,b,n,eps,I )
%COTESSIMSON Summary of this function goes here
%   Detailed explanation goes here

delta=(b-a)/(2*n);
xn=zeros(1,2*n+1);
coeff=zeros(2*n+1,1);
xn(1)=F(a);
coeff(1)=1;
coeff(2*n)=4;
coeff(2*n+1)=1;
for i=1:2*n
    xn(i+1)=F(delta*i);
    if(n>1)
        if(i>1 && i<2*n && mod(i,2)==0)
            coeff(i)=4;
            coeff(i+1)=2;
        end
    end
end
In=(delta/3)*xn*coeff;
err=(abs(In-I)/abs(In));
if(err>eps)
    value=CotesSimpson13(F,a,b,n+1,eps,In);
else
    value=In;
end
end

