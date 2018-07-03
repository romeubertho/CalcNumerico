function [value] = CotesSimpson13( F,a,b,eps )
%COTESSIMPSON13 Summary of this function goes here
%   Método Newton-Cotes, regra 1/3 de Simpson
%   Entrada:
%       F=@(x)(1/sqrt(2*pi)*exp((-x.^2)/2))
%       a=x0
%       b=x2
%       eps = 10e-10
%   Exemplo 9.7 pag 344 (Livro da Neide)
%       F=@(x)exp(x)*cos(x)
%       a=0
%       b=1.2
%       eps=10e-10
n=1;
I=0;
err=1;
while(err>eps)    
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
    n=n+1;
    %disp(In);
    I=In;
end
value=I;
end

