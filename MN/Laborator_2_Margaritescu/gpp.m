function [A, p] = gpp(A)
%%% Eliminare Gaussian? cu pivotare par?ial?
% INPUTS:
%   A -- matrice aleatoare de dimensiune (n,n)
% OUTPUTS:
%   A -- matrice superior triunghiular? cu multiplicatorii gaussieni
%        în triunghiul inferior de dimensiune (n,n)
%   p -- vectorul de permut?ri la nivel de linie

%% SOLUTION START %%

[n,n]=size(A);
p=zeros(1,n);
for k = 1:(n-1)
    max=abs(A(k,k));
    p(k)=k;
    for i = k:n
           if abs(A(i,k)) > max
            max = abs(A(i,k));
            p(k)=i;
        end
    end

    for j = k:n
        aux = A(k,j);
        A(k,j) = A(p(k),j);
        A(p(k),j) = aux;
    end
    
 
    for i = (k+1):n
        A(i,k) = A(i,k)/A(k,k);
    end
    for i = (k+1):n
        for j = (k+1):n
            A(i,j)=A(i,j)-A(i,k)*A(k,j);
        end
    end
end

%% SOLUTION END %%
