function [ b ] = Createb2( A )
%CREATEB2 Summary of this function goes here
%   Detailed explanation goes here

n=length(A);
b=zeros(n,1);
for i=1:n
    b(i)=1/i;
end
end

