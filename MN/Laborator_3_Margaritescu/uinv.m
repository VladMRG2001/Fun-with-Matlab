function [U] = uinv(U)
%%% Inversarea unei matrici superior triunghiulare
% INPUTS:
%   U -- matrice aleatoare superior triunghiulara de dimensiune (n,n)
% OUTPUTS:
%   U -- matrice superior triunghiulara 

%% SOLUTION START %%

n=size(U);
for j=n:-1:1 
    U(j,j)= 1 / U(j,j);
    if (j==1) 
        return
    end
    for i=j-1:-1:1
        s=0;
        for k=i+1:j
            s=s+U(i,k)*U(k,j);
        end
        U(i,j) = -s/U(i,i);
    end
end

%% SOLUTION END %%
end