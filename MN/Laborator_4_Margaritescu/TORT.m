function [A, U, b] = TORT(A)
%% Triangularizare ortogonala cu reflectori
% INPUTS:
%   A -- matrice aleatoare de dimensiune (m, n)
%
% OUTPUT:
%   A -- matrice de dimensiune (m, n) peste care
%        se suprascrie matricea superior triunhiulara R
%   U -- matrice de dimensiune (m, p), unde p = min (m â?’ 1, n)
%   b -- vector de dimensiune (p, 1), unde p = min (m â?’ 1, n)

%% SOLUTION START %%

[m,n]=size(A);
p=min(m-1,n);
U=zeros(p);
b=zeros(1,p);

for k=1:p
    
    sum=0;
    for i=k:m
        sum=sum+A(i,k)*A(i,k);
    end
    s=sign(A(k,k))*sqrt(sum); 
   
    if s==0
        b(k)=0;
    else
        U(k,k)=A(k,k)+s;
        for i=k+1:m
            U(i,k)=A(i,k);  
        end
        b(k)=s*U(k,k);
        A(k,k)=-s;
       
        for i=k+1:m
            A(i,k)=0; 
        end
        
        for j=k+1:n
            sum=0;
            for i=k:m
                sum=sum+U(i,k)*A(i,j); 
            end
            t=sum/b(k);
            for i=k:m
                A(i,j)=A(i,j)-t*U(i,k);
            end
        end
    end
end

%% SOLUTION END %%

end