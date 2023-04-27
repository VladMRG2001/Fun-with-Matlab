%
%	File BUT_FTI.M
%
%	Function: BUT_FTI
%
%	Synopsis: [B,A] = But_FTI(w_p,w_s,Delta_p,Delta_s,Ts) ; 
%
%	Designs a low-pass discrete IIR filter of Butterworth class, 
%	by solving a design problem with specified tolerances. 
%	The design is realized by means of Tustin's (bilinear) 
%	discretizing transform Method. (See the theory on this matter.)
%
%	Inputs: w_p     = the relative passband upper limit 
%	                  (a number between 0 and 1); 
%	        w_s     = the relative stopband lower limit 
%	                  (a number between 0 and 1, at least equal to wp); 
%	        Delta_p = the tolerance in the passband (a number between 0 and 1); 
%	        Delta_s = the tolerance in the stopband (a number between 0 and 1); 
%	        Ts      = the sampling period required in the Tustin's method
%	                  (by default, Ts=2). 
%
%	Missing, empty or inconsistent inputs return empty or wrong output. 
%
%	Uses:	 WAR_ERR 
%
%	Authors: Bogdan DUMITRESCU & Dan STEFANOIU
%	Created: March 15, 2010 
%	Revised: July  10, 2019
%

function [B,A] = But_FTI(w_p,w_s,Delta_p,Delta_s,Ts)

%
% BEGIN
%
% Constants & Messages 
% ~~~~~~~~~~~~~~~~~~~~
	FN = '<BUT_FTI>: ' ;
	E1 = [FN 'Missing, empty or inconsistent input data => empty outputs. Exit.'] ; 
%
% Faults preventing
% ~~~~~~~~~~~~~~~~~
	B = [] ; 
	A = [] ; 
	if (nargin < 3)
	   war_err(E1) ;
	   return ; ; 
	end ; 
	w_p = abs(w_p(1)) ; 
	if (w_p < eps) || (w_p >= (1-eps))
	   war_err(E1) ;
	   return ; ; 
	end ; 
	w_s = abs(w_s(1)) ; 
	if (w_s < eps) || (w_s >= (1-eps))
	   war_err(E1) ;
	   return ; ; 
	end ; 
	Delta_p = abs(Delta_p(1)) ; 
	if (Delta_p < eps) || (Delta_p >= (1-eps))
	   war_err(E1) ;
	   return ; ; 
	end ; 
	if (nargin < 4)
	   Delta_s = Delta_p ;
	end ; 
	Delta_s = abs(Delta_s(1)) ; 
	if (Delta_s < eps) || (Delta_s >= (1-eps))
	   war_err(E1) ;
	   return ; ; 
	end ; 
	if (w_p > w_s)
	   FN = w_p ; 
	   w_p = w_s ; 
	   w_s = FN ; 
	end ; 
	if (nargin < 5)
	   Ts = 2 ; 
	end ; 
	Ts = abs(Ts(1)) ; 
	if (Ts < eps)
	   Ts = 2 ; 
	end ;
%
% Filter design
% ~~~~~~~~~~~~~
% Step #1: Find the parameters of analog Butterworth filter
%
	w_p = 2*tan(w_p*pi/2)/Ts ; 	% Compute Omega_p.
	w_s = 2*tan(w_s*pi/2)/Ts ; 	% Compute Omega_s.
	FN = 1-Delta_p ; 		% Actually, this is M_p. 
	FN = FN*FN ; 
	FN = (1-FN)/FN ; 
	Delta_s = Delta_s*Delta_s ; 
	M = ceil(log((1-Delta_s)/Delta_s/FN)/log(w_s/w_p)/2) ;	% Minimum order of filter. 
	E1 = w_p/((FN)^(1/2/M)) ; 	% Actualy, this is Omega_c 
					% (the cut-off absolute pulsation).
%
% Step #2: Build the transfer function of analog Butterworth filter
%
	FN = E1*exp(j*(M+(1:2:(2*M)))*pi/M/2) ; % The stable poles of filter. 
%	B = real(prod(-FN)) ;		% Numerator of transfer function
	                                % (not really necessary). 
%	A = real(poly(FN)) ; 		% Denominator of transfer function 
					% (not really necessary).
%
% Step #3: Build the transfer function of digital Butterworth filter
%
	FN = FN*Ts ; 			% Normalize the poles. 
	E1 = 2-FN ; 
	B = real(prod(-FN./E1)*poly(-ones(1,M))) ; 	% Numerator of transfer function. 
	A = real(poly((2+FN)./E1)) ; 			% Denominator of transfer function.
%
% END
%