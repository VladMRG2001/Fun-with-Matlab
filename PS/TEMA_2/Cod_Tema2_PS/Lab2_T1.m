%TEMA 1 (TF A UNEI SINUSOIDE COMPLEXE CU SUPORT FINIT)
clear all
close all

%A
[omega0,M] = PS_Lab_2_Tema_1(5,9) ;
omega0_personalizat = omega0;
%omega = linspace(-pi,pi,2*M-1);
omega_pozitiv = linspace(0,pi,M); %750
omega_negativ = linspace(-pi,0,M-1); %749
omega = [omega_negativ,omega_pozitiv]; %1499 elemente

N = 5;
j = sqrt (-1);
n = linspace(0,N-1,2*M-1);
x = exp (j*omega0*n);

TF = fft(x); %TF a sinusoidei

spectru = @(omega) abs((sin((omega-omega0)'*N/2))/sin((omega-omega0)'/2));
%%Expresia 2.16 a spectrului
X_omega = spectru (omega); %|X(omega)|
[max_spectru,pozitie_max]=findpeaks(reshape(X_omega,1,[]));
figure(1);
hold on;
title("Graficul sinusoidei cu 5 perioade");
plot(omega,X_omega);

%B
figure(2); 
hold on;
title("Graficul spectrului in dB (cu freqz)");
X=freqz(x,1,omega);
plot(omega,db(abs(X)));
hold off;
%Spectrul nu este simetric fata de axa oy, deoarece semnalul nu este real,
%ci complex

figure(3); hold on;
title("Spectrul, dar nu in dB");
plot(omega,(abs(X)));
hold off;
%Spectrul nu contine doar o linie, deoarece 
%impulsul Dirac nu este centrat in origine (in figura 3 se vede)

%C
X_omega0=spectru(0.0469); %|X(omega0)|
figure(4); hold on;
title("Reprezentarea grafica a lui |X(omega0)| si N")
plot(X_omega0, 'bluex');
plot(N, 'redx');
hold off;
%Se observa ca diferenta dintre cele 2 puncte este neglijabila
%Astfel egalitatea este indeplinita
%Daca in relatia 2.16 inlocuim omega cu omega0 sinusurile dau 0
%Asadar, egalitatea nu este o proprietate normala