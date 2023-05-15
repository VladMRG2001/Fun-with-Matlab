function [A] = crout(A)
%%% Factorizarea Crout

% INPUTS:
%   A -- matrice aleatoare de dimensiune (n,n)
% OUTPUTS:
%   A -- matrice in care triunghiul inferior e suprascris cu partea utila 
%   a matricii inferior triunghiulare L, iar triunghiul superior cu cea a
%   matricii superior triunghiulare U, astfel incat A = L*U


%% SOLUTION START %%

n=length(A);
for i=1:n
    A(i,1)=A(i,1); 
end
for j=2:n
    A(1,j)=A(1,j)/A(1,1); 
end

for k=2:n
    for i=k:n 
        s=0;
        for l=1:k-1
            s=s+A(i,l)*A(l,k);
        end
        A(i,k)=A(i,k)-s;
    end
    if k==n  
        return
    end
    for j=k+1:n 
        s=0;
        for l=1:k-1
            s=s+A(k,l)*A(l,j);
        end
        A(k,j)=(A(k,j)-s)/A(k,k);
    end
end

%% SOLUTION END %%
end