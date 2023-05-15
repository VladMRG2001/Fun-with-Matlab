function [A] = Ad(A,u,beta)
%% Pasul Ad din HQ(inmultire la dreapta cu un reflector)
% INPUTS:
%   A    -- matricea care se inmulteste (n, n),
%   u    -- vectorul definitoriu al reflectorului (n, 1),   
%   beta -- scalarul definitoriu al reflectorului 
%
% OUTPUT:
%   A    -- matricea care se inmulteste (n, n) 

%% SOLUTION START %%

m = size(A,1);
n = size(A,2);
for i = 1 : m
    s = 0;
    for j = 1 : n
        s = s + A(i,j) * u(j);
    end
    t = s / beta;
    for j = 1 : n
        A(i,j) = A(i,j) - t * u(j);
    end
end

%% SOLUTION END %%

end