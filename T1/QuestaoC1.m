function [ A,b,D,L,U,B,g,Conv,Xi ] = QuestaoC1()
%QUESTAOC1 Summary of this function goes here
%   Detailed explanation goes here
tic
A=CreateMatrix(6);
b=Createb2(A);
[D,L,U,B,g,Conv,Xi]=GaussSeidel(A,b,1e-10,10000);
toc
end
