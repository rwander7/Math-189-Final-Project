function [H,errors] = multUp_SymNMF(A,k,alpha,varargin)

    narginchk(3,4);                             %ensure user has entered either 2 or 3 inputs
    eps_divide = 1e-6;                          %define a small number to ensure we never divide by 0

    [n,~] = size(A);                            %determine the size of A for initializing W and H

    if nargin == 3                              %check if user has declared number of iterations
        M = 10;                                 %define default number of iterations
    else
        M = varargin{1};       
        if M < 1                                %check number of iterations input is valid
            error 'Not a valid number of iterations.';
        end
    end

    W = abs(randn(n,k));                        %initialize factor matrices
    H = (abs(randn(k,n)))';

    errors = [norm(A-H*H','fro')^2];             %initialize error array

    for i = 1:M
        Abar = [A;sqrt(alpha)*W'];
        Wbar = [W;sqrt(alpha)*eye(k)];
        
        H = (H'.*((Wbar'*Abar)./(Wbar'*Wbar*H' + eps_divide)))';              %update for H
        W = H;

        errors = [errors, norm(A-H*H','fro')^2]; %append error
    end
end