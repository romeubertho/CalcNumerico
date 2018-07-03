function [ y ] = Newton( Xm )
%NEWTON Summary of this function goes here
%   Detailed explanation goes here

y=x^3-2x-17;
yl=3x^2-2;
Xi=Xm-y/yl;
end

