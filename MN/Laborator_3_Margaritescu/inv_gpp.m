function [A] = inv_gpp(A)
%%% Inversarea unei matrici utilizand eliminarea gaussiana cu pivotare
%%% partiala
% INPUTS:
%   A -- matrice aleatoare de dimensiune (n,n)
% OUTPUTS:
%   A -- matrice de dimensiune (n,n) 

%% SOLUTION START %%

n=length(A);
[U,p]=gpp(A); 
A=uinv(U); 
for k=n-1:-1:1
    for i=k+1:n
        M(i)=A(i,k)/A(k,k); 
    end
    for i=1:k
        s=0;
        for l=k+1:n
            s=s+A(i,l)*M(l);
        end
        A(i,k)=A(i,k)-s; 
    end
    for i=k+1:n
        s=0;
        for l=k+1:n
            s=s+A(i,l)*M(l);
        end
        A(i,k)=-s; 
    end
    if p(k)~=k
        for i=1:n 
            aux=A(i,k);
            A(i,k)=A(i,p(k));
            A(i,p(k))=aux;
        end
    end
end

%% SOLUTION END %%
end