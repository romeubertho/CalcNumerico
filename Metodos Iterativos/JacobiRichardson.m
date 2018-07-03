function [ D,L,U,B,g,Conv,Xi ] = JacobiRichardson( A,b,eps,itMax )
%JACOBIRICHARDSON Summary of this function goes here
%   M�todo de Jacobi-Richardson para resolu��o de sistemas lineares
%   Crit�rios de converg�ncia:
%       Matriz dos coeficiente estritamente diagonalmente
%       OU Crit�rio das Linhas
%       OU Crit�rio das colunas
%   Implementa��o do livro C�lculo Num�rico - Neidi Bertoldi, p�g 171
%   Exemplo p�g 173
%       A=[10 2 1;1 5 1;2 3 10]
%       b=[7;-8;6]
%       eps=1e-2
%       itMax=100

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
% Calcula g que � igual a x0
g=D\b;
Ls=tril(B,-1)
Us=triu(B,1)

%Verifica o crit�rio de converg�ncia se a Matriz � estritamente
%diagonalmente dominante
one=ones(n,1);
if max(abs(L+U)*one-abs(D)*one) < 0
    disp('Passou no teste de convergencia, Matriz � estritamente diagonalmente dominante');
%Verifica o crit�rio de converg�ncia das linhas
elseif max(abs(B)*one) < 1
    disp('Passou no teste de convergencia, norma linha');
%Verifica o crit�rio de converg�ncia das colunas
elseif max(abs(transpose(B))*one) < 1
    disp('Passou no teste de convergencia, norma coluna');
else
    disp('N�o passou no teste de convergencia!');
end

%Iterando....

%Xi recebe X(0)
Xi=g;
%Matriz de convergencia recebe � incializada com a norm de X(0)
Conv=norm(Xi,inf);
%Verifica a quantidade de colunas da matriz Conv
[~,cCol]=size(Conv);
it=1;
%Enquanto Conv(n)>eps ou it < itMax, itera
while(Conv(1:cCol)>eps)
    %Verifica a quantidade de colunas da matriz Xi
    [~,xCol]=size(Xi);
    %Calcula o pr�ximo X(i) e concatena em Xi
    Xi=[Xi ((Ls+Us)*Xi(:,xCol))+g];
    %Verifica a quantidade de colunas da matriz Xi
    [~,xCol]=size(Xi);
    %Calcula a converg�ncia entre X(k) e X(k-1) e concatena na matriz Conv
    Conv=[Conv norm(Xi(:,xCol)-Xi(:,xCol-1),inf)/norm(Xi(:,xCol),inf)];
    %Verifica a quantidade de colunas da matriz Conv
    [~,cCol]=size(Conv);
    %Incrementa it por 1
    it=it+1;
    if(it>itMax)
        disp('Itera��o m�xima atingida!');
        break
    end
end
end

