function [u,beta,x] = Z(x)
%% Algoritmul Z din HQ(calcul elemente definitorii reflector)
% INPUTS:
%   x    -- vector pentru care se calculeaz? reflectorul (n, 1) 
%
% OUTPUT:
%   u    -- vectorul definitor al reflectorului (n, 1) 
%   beta -- scalarul definitor al reflectorului 
%   x    -- vectorul alterat cu zerouri

%% SOLUTION START %%

n = size(x);
s = 0;
for i=1:n
    s = s + x(i) * x(i);
end
sigma = sign(x(1)) * sqrt(s);
u(1) = x(1) + sigma;
for i = 2 : n
    u(i) = x(i);
    x(i) = 0;
end
beta = u(1) * sigma;
x(1) = -sigma;

%% SOLUTION END %%

end