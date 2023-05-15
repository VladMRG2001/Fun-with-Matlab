
% Descompunerea valorilor singulare si rangul numeric al numei matrici

% A - matrice aleatoare de dimensiune (m, n)
% B - matrice aleatoare de dimensiune (m, r)
% C - matrice aleatoare de dimensiune (r, n)
% D - matrice aleatoare de dimensiune (m, n)
% sigma - scalar


%% SOLUTION START %%

m = randi([0 10],1);
n = randi([0 10],1);
r = randi([0 10],1);
B = randn(m,r);
C = randn(r,n);
D = randn(m,n);
epsilon = 0;
sigma = randi([0 10],1);
A = B * C + sigma * D; 


% Descrieti pe scurt ce se intampla cu valorile singulare la cresterea lui sigma.



% Cum trebuie ales epsilon in ecuatia (6.10) din indrumarul de laborator 
% astfel incat rang(A) sa fie r?

% Epsilon trebuie sa fie 0.

%% SOLUTION END %%