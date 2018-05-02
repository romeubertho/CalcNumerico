function [ b ] = Createb( A )
%CREATEB Summary of this function goes here
%   Detailed explanation goes here

n=length(A);
one=ones(n,1);
b=zeros(n,1);
for i=1:n
    b(i)=A(i,:)*one;
end
end