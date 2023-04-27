%TEMA 1 (ACOMODARE)
clc
clear all
close all

%SEMNALE DETERMINISTE

%Valori pt exemple
N=5; w=12; phi=7; alfa=11;

%Generare semnale
n=linspace(0,N-1,100); 
%n=0:N-1; 
%n=linspace(0,N-1);
imp_unit=eye(1,N); % impuls unitate
tr_unit=ones(1,N); % treapta unitate
e=alfa.^n; % semnal exponential
sin_real=sin(w * n + phi); % sinusoida reala
j=sqrt(-1);
sin_compl=exp(j * (w * n + phi)); % sinusoida complexa

%Grafice semnale
figure(1); 
title('Grafice semnale');
hold on;
plot(n,sin_real);
plot(n,sin_compl);
stem(n,sin_real);
stem(n,sin_compl);
hold off;

%Operatii cu semnale
x1=3;
x2=5;
xs=x1+x2; %suma
xm=x1.*x2; %modulatia in timp
xc=conv(x1,x2); %convolutia

%SEMNALE NEDETERMINISTE

%Generare semnale
x=rand(1,N);
x_n=randn(1,N);

%Media unui semnal aleator
media_x=mean(x);
media_x_n=mean(x_n);

%Auto-corelatia
r_xcorr=xcorr(x,'unbiased'); %nedeviata
rx_xcorr=xcorr(x,'biased'); %deviata

%Auto-covarianta
r_xcov=xcov(x,'unbiased'); %nedeviata
rx_xcov=xcov(x,'biased'); %deviata

%SEMNALE AUDIO

Fs=44100;
x=audioread('xilo.au');
audiowrite('xilo.wav',x,Fs);