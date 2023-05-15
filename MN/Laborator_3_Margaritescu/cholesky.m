function [A] = cholesky(A)
%%% Factorizarea Cholesky

% INPUTS:
%   A -- matrice aleatoare de dimensiune (n,n)
% OUTPUTS:
%   A -- matrice in care triunghiul inferior e suprascris cu partea utila 
%   a matricii inferior triunghiulare L, astfel incat A = L*L'


%% SOLUTION START %%

n=length(A);
if A(1,1)<0
    disp('A nu este pozitiv definita')
    return
end
A(1,1)=sqrt(A(1,1)); 
for i=2:n
    A(i,1)=A(i,1)/A(1,1); 
end
for k=2:n
    s=0;
    for l=1:k-1
        s=s+A(k,l)*A(k,l); 
    end
    a=A(k,k)-s;
    if a<=0
        disp('A nu este pozitiv definita')
        return
    end
    A(k,k)=sqrt(a); 
    if k==n
        return
    end
    for i=k+1:n 
        s=0;
        for l=1:k-1
            s=s+A(i,l)*A(k,l);
        end
        A(i,k)=(A(i,k)-s)/A(k,k);
    end
end

%% SOLUTION END %%
end