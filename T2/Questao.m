function [ Root ] = Questao(f,x0, eps)
%QUESTAO Summary of this function goes here
%   Detailed explanation goes here
F1=CotesSimpson13(@(x)(1/sqrt(2*pi)*exp((-x.^2)/2)), 0, 1, 10e-10)-0.45;
F2=CotesSimpson13(@(x)(1/sqrt(2*pi)*exp((-x.^2)/2)), 0, 2, 10e-10)-0.45;

fprintf('\nF(1) * F(2) = %f * %f\n',F1,F2);
fprintf('            = %f\n\n',F1*F2);
Root=metodo_newton(f,x0,eps);
fprintf('\nRaiz = %f\n\n',Root);
end


