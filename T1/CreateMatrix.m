function [ A ] = CreateMatrix( n )
%CREATEMATRIX Summary of this function goes here
%   Detailed explanation goes here

A=eye(n)*4;
for i=1:n
    if(i<n)
        A(i,i+1)=-1;
        A(i+1,i)=-1;
    end
    if(i<n-2)
        A(i,i+3)=-1;
        A(i+3,i)=-1;
    end
end 
end

