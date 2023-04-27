%TEMA 2 (TF a unei sinusoide reale cu suport finit)
clear all
close all

%A
[omega0,M] = PS_Lab_2_Tema_1(5,9) ;
phi = PS_Lab_2_Tema_2(5,9) ; 

N = 5;
j = sqrt (-1);
n = linspace(0,N-1,2*M-1);
x = cos (omega0*n+phi);

%A
omega = linspace(-pi,pi,2*M-1);
figure(1); hold on;
title("Graficul spectrului pe (-pi,pi)");
X=freqz (x, 1, omega); 
plot (omega, db(abs(X)));
hold off;
%Se observa cum graficul spectrului este simetric fata de verticala

%B
alpha = omega0*n+phi;
cos_alpha = (exp(j*alpha)+exp(-j*alpha))/2;

figure(2); hold on;
title("Graficul pt cos alpha - Euler");
Xb=freqz(cos_alpha, 1, omega); 
plot (omega, db(abs(Xb)));
hold off;
%Se observa ca cele 2 grafice sunt identice (A si B)

%C
phi03=0.3*phi;
phi07=0.7*phi;
phi12=1.2*phi;
phi15=1.5*phi;

x03 = cos (omega0*n+phi03);
x07 = cos (omega0*n+phi07);
x10 = cos (omega0*n+phi);
x12 = cos (omega0*n+phi12);
x15 = cos (omega0*n+phi15);

figure(3); hold on; 
title("Graficul spectrului pt diferite valori ale lui phi");

X03=freqz (x03, 1, omega);
plot(omega,db(abs(X03)),'red');

X07=freqz (x07, 1, omega);
plot(omega,db(abs(X07)),'blue');

X=freqz (x10, 1, omega);
plot(omega,db(abs(X)),'green');

X12=freqz (x12, 1, omega);
plot(omega,db(abs(X12)),'black');

X15=freqz (x15, 1, omega);
plot(omega,db(abs(X15)),'yellow');
hold off;

%In toate cazurile se observa ca graficul spectrului ramane simetric fata de axa verticala 
%Chiar daca defazajul se modifica nu se produc diferente de faza

%Se observa cum aproape toate spectrele arata similar,
%mai putin cel corespunzator lui phi*0.7