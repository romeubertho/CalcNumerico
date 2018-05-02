function [ A,b,D,L,U,B,g,Conv,Xi ] = QuestaoB()
%QUESTAOB Summary of this function goes here
%   Detailed explanation goes here
tic
A=CreateMatrix(100);
b=Createb(A);
[D,L,U,B,g,Conv,Xi]=GaussSeidel(A,b,1e-10,10000);
toc
end