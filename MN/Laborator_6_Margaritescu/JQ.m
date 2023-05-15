function [f,g,U,V] = JQ(A)

% INPUT:
%  A - matrice de dimensiune (m, n), cu m>n
% OUTPUTS:
%  f - vector de dimensiune n continand elementele diagonale ale matricii 
%       bidiagonalizate
%  g - vector de dimensiune n-1 continand elementele supradiagonale ale 
%       matricii bidiagonalizate 
%  U - matrice ortogonala de dimensiune (m, m) 
%  V - matrice ortogonala de dimensiune (n, n)

%% SOLUTION START %%

[m,n] = size(A);
U = eye(m);           
V = eye(n);           
u = zeros(1,n);       
f = zeros(1,n);        
g = zeros(1,n-1);      
v = zeros(1,n);

for k = 1 : n           
    s = 0;
    
    for i = k : m       
       s = s + A(i,k) * A(i,k); 
    end
    sigma = sign(A(k,k)) * sqrt(s);
    u(k) = A(k,k) + sigma;
    
    for i = k + 1 : m      
        u(i) = A(i,k);
    end
    
    beta = u(k) * sigma;
    A(k,k) = -sigma;
    
    for i = k + 1 : m
        A(i,k) = 0;
    end
    if k < n
        for j = k + 1 : n
            s = 0;
            
            for i = k : m
                s = s + u(i) * A(i,j);
            end
            
            tau = s / beta;
            
            for i = k : m
                A(i,j) = A(i,j) - tau * u(i);
            end
        end
    end
    
    for i = 1 : m           
        s = 0;
        for j = k : m
            s = s + U(i,j) * u(j);
        end
        
        tau = s / beta;
        
        for j = k : m
            U(i,j) = U(i,j) - tau * u(j);
        end
    end
    
    if k < n - 1            
        s = 0;
        
        for j = k + 1 : n
            s = s + A(k,j) * A(k,j);
        end
        
        sigma = sign(A(k,k+1)) * sqrt(s);
        v(k+1) = A(k,k+1) + sigma;  
        
        for j = k + 2 : n
            v(j) = A(k,j);
        end
        
        gama = v(k+1) * sigma;        
        A(k,k+1) = -sigma;
        
        for j = k + 2 : n
            A(k,j) = 0;
        end
        
        for i = k + 1 : m
            s = 0;
            
            for j = k + 1 : n
                s = s + A(i,j) * v(j);
            end
            
            tau = s / gama;
            
            for j = k + 1 : n
                A(i,j) = A(i,j) - tau * v(j);
            end
        end
        
        for i = 1 : n       
            s = 0;
            
            for j = k + 1 : n
                s = s + V(i,j) * v(j);
            end
            
            tau = s / gama;
            
            for j = k + 1 : n
                V(i,j) = V(i,j) - tau * v(j);
            end
        end
    end
    
    for i = 1 : n - 1
       f(i) = A(i,i);
       g(i) = A(i,i+1);
    end
    
    f(n) = A(n,n);
end

%% SOLUTION END %%

end