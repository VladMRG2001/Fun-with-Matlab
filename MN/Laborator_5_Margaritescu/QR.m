function [H] = QR(A,tol,maxiter)
%% Algoritmul QR - calculul formei Schur reale
% INPUTS:
%   A       -- matrice aleatoare de dimensiune (n, n),   
%   tol     -- nivel de tolerant? (0 < tol < 1),
%   maxiter -- numar maxim de iteratii
%
% OUTPUT:
%   H    -- matricea in forma schur reala (n, n)
%
% OBSERVATII:
%   1. Adaugati si conditia de oprire cand se atinge
%      numarul maxim de iteratii(maxiter) similar cu MP
%   2. Cand laboratorul este gata de incarcat pe moodle,
%      asigurati-va ca toate instructiunile disp()
%      sunt comentate.

%% SOLUTION START %%

n = size(A,1);
[Q,H] = HQ(A);
iter = 0;
m = n;
while m > 1
    miu = H(m,m);
    for i = 1 : m
        H(i,i) = H(i,i) - miu; 
    end
    [Q1,R] = qr(H(1:m,1:m)); 
    H(1:m,1:m) = R * Q1;
    for i = 1 : m
        H(i,i) = H(i,i) + miu; 
    end
    if m < n
        H(1:m,m+1:n) = Q1' * H(1:m,m+1:n);
    end
    Q(:,1:m) = Q(:,1:m) * Q1; 
    iter = iter + 1;
    if abs(H(m,m-1)) < tol 
       H(m,m-1) = 0;    
       m = m-1;
    end

%% SOLUTION END %%

end