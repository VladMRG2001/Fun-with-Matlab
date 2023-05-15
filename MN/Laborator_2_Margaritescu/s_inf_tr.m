function [x] = s_inf_tr(A,b)
%%% Rezolvarea unui sistem determinat inferior triunghiular
% INPUTS:
%   A -- matrice aleatoare inferior triunghiular? de dimensiune (n,n)
%   b -- vector aleator de dimensiune (n,1)
%
% OUTPUTS:
%   x -- vectorul solu?ie al sistemului de dimensiune (n,1)

%% SOLUTION START %%

[n,n]=size(A);
x=zeros(n,1);
s=0;

for i = 1:1:n
    s = b(i);
    if i>1
        for j = 1:(i-1)
            s = s-A(i,j)*x(j);
        end
    end
    x(i) = s/A(i,i);
end

end

%% SOLUTION END %%
