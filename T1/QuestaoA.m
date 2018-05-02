function [ A,b,D,L,U,B,g,Conv,Xi ] = QuestaoA(m,eps,itMax)
%QUESTAOA Summary of this function goes here
%   Detailed explanation goes here
tic
A=CreateMatrix(m);
b=Createb2(A);
[D,L,U,B,g,Conv,Xi]=GaussSeidel(A,b,eps,itMax);
toc
end

