%
%	File MUSICAL_TONES.M
%
%	Function: MUSICAL_TONES
%
%	Synopsis: [y,n,Y,f,yp] = musical_tones_editat(instrument,filter_zero,filter_pole,d) ; 
%
%	This function is a revised version of the old main program LAB3_MUZICA,
%	which has been renamed to LAB3_MUZICA_2010. 
%
%	Helps the user to generate sounds that imitate a solfeggio tone,  
%	played either by a known instrument or by an ad hoc created instrument. 
%	The signal synthesis is realized by filtering a sum of sines of 
%	increasing frequency. (See LAB PS #3 for more explanations.)   
%
%	Inputs: instrument  = integer between 0 (default) and 5 that stands for  
%	                      the instrument to play with; thus: 0 = user defined  
%	                      instrument, 1 = violin, 2 = viola, 3 = clarinet,  
%	                      4 = trombone, 5 = tuba;  
%	        filter_pole = the pole of first order filer to apply, in order to 
%	                      obtain a newly created instrument (a non null number 
%	                      between -1 and +1; by default, filter_pole = -0.95);
%	        d = user option on drawing graphics: 0 (default) = do not draw graphics;
%	                                            ~0 = draw graphics. 
%
%	Outputs: y = the audio signal standing for the generated tone (column vector); 
%	         n = normalized time set of the audio signal (row vector of same length as y);
%	         Y = Discrete Fourier Transform (DFT) of sound signal (column vector) ; 
%	         f = normalized frequency set of DFT (row vector of same length as Y);
%	         yp = audioplayer object that can be heared by using play(yp).  
%
%	Note that the filter_pole input argument is only necessary when instrument=0. 
%	For the other instruments, the filtered signal is generated inside the function. 
%
%	Missing, empty or inconsistent inputs return empty or wrong output. 
%
%	Uses:	 FIG_LOOK
%	         WAR_ERR
%
%	Authors: Bogdan DUMITRESCU & Dan STEFANOIU
%	Created: March 15, 2010 
%	Revised: November 16-21, 2020
%	         November  4, 2021
%	         November 10, 2021
%

function [y,n,Y,f,yp] = musical_tones_editat(instrument,filter_zero,filter_pole,d)

%
% BEGIN
%
% Constants & Messages 
% ~~~~~~~~~~~~~~~~~~~~
	[yn,FN] = deal('<MUSICAL_TONES>: ') ;
	W1 = [FN 'Warning! No instrument selected. User defined instrument set instead.'] ; 
	W2 = [FN 'Warning! No filter pole selected. Set to default value -0.95.'] ; 
	Fs = 44100 ; 	% Sampling frequency [Hz]. The sounds are kept in the range 0-20 kHz,
	                % so that any human being can hear them. This is the CD sound quality. 
	N = 88200 ;	% Signal length. (Sounds are generated for N/Fs=2 seconds.) 
	M = 1024 ;	% Resolution of spectral drawings. 
	n = (0:(N-1))/Fs ;	% Set the normalized time axis (N-length row vector). 
%
% Faults preventing
% ~~~~~~~~~~~~~~~~~
	if (nargin < 1)
	   instrument = 0 ; 
	   war_err(W1) ;
	end ; 
	if (isempty(instrument))
	   instrument = 0 ; 
	   war_err(W1) ;
	end ; 
	instrument = min(5,round(abs(instrument(1)))) ; 
	if (~instrument)
	   if (nargin < 2)
	      filter_pole = -0.95 ; 
	      war_err(W2) ;
	   end ; 
	   if (isempty(filter_pole))
	      filter_pole = -0.95 ; 
	      war_err(W2) ;
	   end ; 
	   filter_pole = real(filter_pole(1)) ; 
	   filter_pole = filter_pole - fix(filter_pole) ;  % The filter must be stable!
	   filter_pole = [1 -filter_pole] ; 
	else
	   filter_pole = [] ;
	end ; 
	if (nargin < 3)
	   d = 0 ; 
	end ;
	if (isempty(d))
	   d = 0 ; 
	end ;
	d = d(1) ; 
%
% Set basic sound characteristics 
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	W1 = ' playing the ' ;
	W2 = ' tone.' ; 
	switch (instrument)

	   case 0		% User defined instrument.
	      Ft = 440 ; 	% Set the tone frequency [Hz]. Here: the LA tone.
	      K = 8 ;		% Set the number of harmonic sines into the raw signal. 
	      A = ones(1,K) ; 	% Set unit magnitudes of sines into the raw signal. 
	      FN = 'User_defined' ;
	      type = ['Raw signal' W1 'LA' W2] ;

	   case 1		% Instrument: violin.
	      Ft = 440 ; 	% Set the tone frequency [Hz]. Here: the LA tone.
	      K = 18 ;		% Set the number of harmonic sines into the signal. 
 	 	 	 	% Set the magnitudes of sines for the violin LA tone. 
	      A = [100 45 21 26 48 53 53 62 53 26 24 16 16 35 12 34 23 11]/100 ;
	      FN = 'Violin' ;
	      type = [FN W1 'LA' W2] ;

	   case 2		% Instrument: viola.
	      Ft = 440 ; 	% Set the tone frequency [Hz]. Here: the LA tone.
	      K = 10 ;		% Set the number of harmonic sines into the signal. 
 	 	 	 	% Set the magnitudes of sines for the viola LA tone. 
	      A = [100 45 40 20 40 30 10 15 8 8]/100 ;
	      FN = 'Viola' ;
	      type = [FN W1 'LA' W2] ;

	   case 3		% Instrument: clarinet.
	      Ft = 180 ; 	% Set the tone frequency [Hz]. Here: the FA# tone.
	      K = 10 ;		% Set the number of harmonic sines into the signal. 
 	 	 	 	% Set the magnitudes of sines for the clarinet FA# tone. 
	      A = [100 0 50 10 60 30 50 30 10 2]/100 ;
	      FN = 'Clarinet' ;
	      type = [FN W1 'FA#' W2] ;

	   case 4		% Instrument: trombone.
	      Ft = 230 ; 	% Set the tone frequency [Hz]. Here: the SIb tone.
	      K = 6 ;		% Set the number of harmonic sines into the signal. 
 	 	 	 	% Set the magnitudes of sines for the trombone SIb tone. 
	      A = [100 100 50 60 10 3]/100 ;
	      FN = 'Trombone' ;
	      type = [FN W1 'SIb' W2] ;

	   otherwise		% Instrument: tuba.
	      Ft = 230 ; 	% Set the tone frequency [Hz]. Here: the SIb tone.
	      K = 5 ;		% Set the number of harmonic sines into the signal. 
 	 	 	 	% Set the magnitudes of sines for the tuba SIb tone. 
	      A = [100 70 8 3 2]/100 ;
	      FN = 'Tuba' ;
	      type = [FN W1 'SIb' W2] ;

    end ;
	war_err([yn 'Your instrument is ' type]) ;
%
% Synthesize the audio signal, compute its DFT and draw variations
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Y = sin(2*pi*Ft*n'*(1:K)) ;	% This is a N-by-K matrix of sine values. 
					% Each sine takes a column and has a frequency  
					% among: Ft, 2*Ft, 3*Ft, ..., K*Ft. 
					% Nevertheless, the relative frequency of a sine
					% in this matrix is: Ft/Fs, 2*Ft/Fs, ..., K*Ft/Fs.
	y = Y*A' ; 			% Modulate each sine by its magnitude and sum 
					% all together.
	[Y,f] = freqz(y,1,M) ; 		% Compute the DFT of signal with preset resolution (M).
	f = f'/2/pi ;
	if (d)				% Display the (raw) signal and its DFT.	
	   figure, fig_look(gcf,2) ; 
	      plot(n(1:M),y(1:M),'b') ;
	      axis tight ;
	      title(type) ; 
	      xlabel('Time [s]') ; 
	      ylabel('Signal magnitude') ; 
	   figure, fig_look(gcf,2) ; 
	      freqz(y,1,M) ;
	      title(['DFT of ' type]) ; 
	end ; 
	if (~instrument)		% Generate the tone with the user defined instrument. 
	   y = filter(filter_zero,filter_pole,y) ;
	   [Y,f] = freqz(y,1,M) ; 	% Compute the DFT of signal with preset resolution (M).
	   f = f'/2/pi ;
	   if (d)			% Display the filter DFT, the signal tone and its DFT.
	      figure, fig_look(gcf,2) ; 
	         freqz(filter_zero,filter_pole,M) ;
	        title(['Filter frequency response. Pole = ' sprintf('%g',filter_pole(2)) '.' ' Zero = ' sprintf('%g',filter_zero) '.']) ;     
	      type = ['User defined instrument' type(11:end)] ; 
	      figure, fig_look(gcf,2) ; 
	         plot(n(1:M),y(1:M),'b') ;
	         axis tight ;
	         title(type) ; 
	         xlabel('Time [s]') ; 
	         ylabel('Signal magnitude') ; 
	      figure, fig_look(gcf,2) ; 
	         freqz(y,1,M) ;
	         title(['DFT of ' type]) ; 
	   end ; 
	end ;
%
% Normalize, play and save the audio signal
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	y = y/max(abs(y)) ; 
	yp = audioplayer(y,Fs) ;
	yn = input([yn ' Play the tone? [y/n, Enter=no]: '],'s') ; 
	if (isempty(yn))
	   yn = 'n' ;
	end ; 
	yn = yn(1) ; 
	if ((yn == 'y') || (yn == 'Y'))
	   play(yp) ; 
        end ;
	if (exist('wavwrite.m'))
	   wavwrite(y,Fs,32,[FN '.wav']) ; 
	elseif (exist('auwrite.m'))
	   auwrite(y,Fs,16,'linear',[FN '.au']) ; 
	else
	   audiowrite([FN '.wav'],y,Fs,'BitsPerSample',32) ; 
	end ;
%
% END
%