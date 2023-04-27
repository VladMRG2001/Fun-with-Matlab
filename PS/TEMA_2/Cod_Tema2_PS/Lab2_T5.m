%TEMA 5 (Zgomot alb)
clear all
close all

[N,N1,N2,N3] = PS_Lab_2_Tema_5(5,9) ; 

%A. secventa pseudo-aleatoare de durata N
e = randn (1, N); 
omega= linspace(0,pi,N); 

%B. graficul semnalului
figure(1); hold on;
title("Graficul semnalului e");
plot(e); 

%C. diferite dens spectrale pt e
XN=freqz(e,1,omega);
Phi_N=(1/N)*(abs(XN)).^2;
Phi_N1=(1/N1)*(abs(XN)).^2;
Phi_N2=(1/N2)*(abs(XN)).^2;
Phi_N3=(1/N3)*(abs(XN)).^2;

figure(2); hold on;
plot(omega,db(Phi_N)); 
title("Densitatea spectrala pt e cu durata N");
hold off;

figure(3); hold on;
plot(omega,db(Phi_N1));
title("Densitatea spectrala pt e cu durata N1");
hold off;

figure(4); hold on;
plot(omega,db(Phi_N2));
title("Densitatea spectrala pt e cu durata N2");
hold off;

figure(5); hold on;
plot(omega,db(Phi_N3));
title("Densitatea spectrala pt e cu durata N3");
hold off;

%Se observa cum toate graficele pt densitatea spectrala au un aspect tipic
%care nu se modifica in functie de N pentru aceeasi realizare a zgomotului
%dar cu cat N e mai mare cu atat spectrul este mai jos,
%adica valorile de pe axa oy sunt mai mici

%D. 3 semnale aleatorii
e1=randn (1,N1);
e2=randn (1,N2);
e3=randn (1,N3);

XN=freqz(e,1,omega);
XN1=freqz(e1,1,omega);
XN2=freqz(e2,1,omega);
XN3=freqz(e3,1,omega);
Phi_e=(1/N)*(abs(XN)).^2;
Phi_e1=(1/N1)*(abs(XN1)).^2;
Phi_e2=(1/N2)*(abs(XN2)).^2;
Phi_e3=(1/N3)*(abs(XN3)).^2;

%E. perechi de grafice
figure(6); hold on;
subplot (2, 1, 1);
plot(e1); %Graficul pt semnal
title("Graficul pt e1")

subplot (2, 1, 2);
plot(omega,db(Phi_e1)); %Densitatea spectrala in dB
title("Densitatea spectrala pt e1");
hold off;

figure(7); hold on;
subplot (2, 1, 1);
plot(e2); %Graficul pt semnal
title("Graficul pt e2")

subplot (2, 1, 2);
plot(omega,db(Phi_e2)); %Densitatea spectrala in dB
title("Densitatea spectrala pt e2");
hold off;

figure(8); hold on;
subplot (2, 1, 1);
plot(e3); %Graficul pt semnal
title("Graficul pt e3")

subplot (2, 1, 2);
plot(omega,db(Phi_e3)); %Densitatea spectrala in dB
title("Densitatea spectrala pt e3");
hold off;

%Se vede ca forma graficului densitatii spectrale nu mai ramane in forma
%tipica daca modificam realizarea zgomotului alb