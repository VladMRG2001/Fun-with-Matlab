%TEMA 6 (Sinusoida scufundata in zgomot alb)
clear all
close all

[omega0,M] = PS_Lab_2_Tema_1(5,9) ;
[N,~,~,~] = PS_Lab_2_Tema_5(5,9) ; 
e = randn(1, N); %semnal aleatoriu (zgomot)
n=linspace(0,N-1,N);
x = cos(omega0*n) + e;

omega = linspace(0,pi,M); %grila de frecvente

%A
figure(1); hold on;
title ("Graficul semnalului cos(omega0*n)+e[n]");
stem(n, x); %discret
hold off;
%Observam ca este greu de estimat vizual o periodicitate a semnalului

%B
figure(2); hold on;
title("TF a zgomotului");
X=freqz(x, 1, omega); 
plot(omega,db(abs(X)));
hold off;

figure(3); hold on;
XN=freqz(x,1,omega);
Phi_e=(1/N)*(abs(XN)).^2;
plot(omega,db(Phi_e));
title("Graficul densitatii de putere spectrala");
hold off;
%Se vede val maxima pt omega 0.015*pi=0.047;

%C.1
a = PS_Lab_2_Tema_6c(5,9) ;
xc = cos(omega0 * n) + a * e;

figure(4); hold on;
XNc=freqz(xc,1,omega);
Phi_ec=(1/N)*(abs(XNc)).^2;
plot(omega,db(Phi_ec));
title("periodograma pt x[n] cu a personalizat");
hold off;
%Se vede val maxima pt omega 0.015*pi=0.047;

%C.2
a_max=6; %am facut mai multe incercari
%a max pt care se mai vede ca maximul este in jurul valorii 0.015*pi=0.047;
xc_max = cos(omega0 * n) + a_max * e;

figure(5); hold on;
XNcmax=freqz(xc_max,1,omega);
Phi_ecmax=(1/N)*(abs(XNcmax)).^2;
plot(omega,db(Phi_ecmax));
title("Periodograma pt x[n] cu a max");
hold off;
%Inca se obs valoarea maxima pt omega de 0.015*pi=0.047;

%D
i=0;
for amplitudine = 0.01:a_max/M:a_max
    xd = cos(omega0 * n) + amplitudine * e;
    i = i + 1;
end
figure(6);
title ("Graficul SNR al semnalului");
snr(xd);
%Se observa cum sunetul fundamental este intre 411 si 416 mHz
%Iar maximul pt F e la 4.13 mHz