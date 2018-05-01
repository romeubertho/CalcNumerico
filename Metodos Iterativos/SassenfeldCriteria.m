function [ maxValue ] = SassenfeldCriteria( B )
%SASSENFELDCRITERIA Summary of this function goes here
%   Detailed explanation goes here

n=length(B);
% Xi recebe matriz de 0s
Xi=ones(n,1);
for i=1:n
    Xi(i,1)=abs(B(i,:))*Xi(:,1);
end
maxValue=max(Xi);
end