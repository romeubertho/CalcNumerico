function [ D,L,U,B,g,Conv,Xi ] = GaussSeidel( A,b,eps,itMax )
%GAUSSSEIDEL Summary of this function goes here
%   Detailed explanation goes here
tic
% Obt�m o tamanho max(row,col) de A de uma matriz NxN
n=length(A);
% Diagonal de A
D = diag(diag(A));
% Matriz inferior de A
L = tril(A,-1);
% Matriz superior de A
U = triu(A,1);
% Calcula B
B=(-D\(L+U));
% Calcula g
g=D\b;

% Verifica o crit�rio de converg�ncia se a Matriz � estritamente
% diagonalmente dominante
one=ones(n,1);
if max(abs(L+U)*one-abs(D)*one) < 0
    disp('Passou no teste de convergencia, Matriz � estritamente diagonalmente dominante');
% Verifica o crit�rio de converg�ncia das linhas
elseif max(abs(B)*one) < 1
    disp('Passou no teste de convergencia, norma linha');
% Verifica o crit�rio de converg�ncia das colunas
elseif max(abs(transpose(B))*one) < 1
    disp('Passou no teste de convergencia, norma coluna');
elseif SassenfeldCriteria(B)<1
    disp('Passou no teste de convergencia, crit�rio de Sassenfeld');
else
    disp('N�o passou no teste de convergencia!');
end

% Iterando....

% Xi recebe matriz de 0s
Xi=zeros(n,1);
% Matriz de convergencia � incializada com inf
Conv=inf;
% Calcula Xi(k)
for k=1:itMax+1
    for i=1:n
        Xi(i,k)=B(i,:)*Xi(:,k)+g(i);
    end
    % Concatena a k-�sima itera��o em Xi
    Xi=[Xi Xi(:,k)];
    % Calcula a converg�ncia entre X(k) e X(k-1) e concatena na matriz Conv
    if(k>1)
        Conv=[Conv norm(Xi(:,k)-Xi(:,k-1),inf)/norm(Xi(:,k),inf)];
    end
    % Verifica se convergiu para o eps esperado
    if(Conv(1,k)<eps)
        break
    end
end
toc    
end

