%TEMA 3 (TF a doua sinusoide reale cu suport finit insumate)
clear all
close all

[omega0,M] = PS_Lab_2_Tema_1(5,9) ;
omega1 = omega0;
omega2_personalizat = PS_Lab_2_Tema_3abc(5,9) ;
omega2 = abs(omega2_personalizat);


%A
perioada_1 = 2*pi/omega1; %perioada primei sinusoide
perioada_2 = 2*pi/omega2; %perioada celei de a doua sinusoide
perioada_totala = lcm (perioada_1, perioada_2); 
%perioada semnalului prin insumarea celor 2 sinusoide

j = sqrt (-1);
N_a=5*perioada_totala; %Dupa ce am calculat perioada
n = linspace(0,N_a-1,M);
x = cos(omega1*n)+cos(omega2*n);

figure(1); hold on;
title("Graficul semnalului x pe 5 perioade");
plot(n, x);

%B
omega=linspace(-pi,pi,M); %Grila de frecvente
figure(2); hold on;
title("Graficul spectrului semnalului");
X=freqz(x,1,omega);
plot(omega,db(abs(X)));
%Am obtinut desenul pe care il asteptam,
%deoarece graficul are 2 varfuri corespunzatoare 
%celor doua pulasatii omega1 si omega2

%C
[a1,a2] = PS_Lab_2_Tema_3c(5,9) ;
%x = a*sin(omega*t+phi)
xc = a1*cos(omega1*n) + a2*cos(omega2*n);

figure(3); hold on;
title("Graficul pt xc cu amplitudini diferite");
plot (n, xc)
t1 = 2*pi/omega1; %perioada primei sinusoide
t2 = 2*pi/omega2; %perioada celei de a doua
tc = lcm (t1, t2); %perioada semnalului reprezentat ca suma de sinusoide

figure(4); hold on;
title("Spectrul pt xc");
Xc=freqz(xc, 1, omega);
plot(omega, db(abs(Xc)));
%Aici doar 1 varf este pronuntat, 
%cel corespunzator sinusoidei cu amplitudinea mai mare (a1)

%D
[omega1_d,omega2_d,M1,M2] = PS_Lab_2_Tema_3d(5,9) ; 

T1 = 2*pi/omega1_d; %perioada primei sinusoide
T2 = 2*pi/omega2_d; %perioada celei de a doua
td = lcm (t1, t2); %perioada semnalului reprezentat ca suma de sinusoide
N1=T1; %perioada 1
N2= floor(T2); %perioada 2
N=lcm(N1,N2); %perioada totala

nd=linspace(0,N1*5-1,M); %N e prea mare
xd = cos(omega1_d*nd) + cos(omega2_d*nd);

figure(5); hold on;
title("Graficul semnalului cu 2 sinusoide f aproape una de alta");
plot (nd, xd); 
omegaM=linspace(-pi,pi,M*2);
omegaM1=linspace(-pi,pi,M1*2);
omegaM2=linspace(-pi,pi,M2*2); 
%M este prea mic si nu se vad cele 2 pulsatii
figure(6); hold on;
%title("Spectrul semnalului xd cu rezolutia M1");
Xd1=freqz(xd, 1, omegaM1);
plot(omegaM1, db(abs(Xd1)));

%figure(7); %hold on;
%title("Spectrul semnalului xd cu rezolutia M2");
Xd2=freqz(xd, 1, omegaM2);
plot(omegaM2, db(abs(Xd2)));

%figure(8); %hold on;
%title("Spectrul semnalului xd cu rezolutia M");
Xd=freqz(xd, 1, omegaM);
plot(omegaM, db(abs(Xd)));
hold off; 
%Observatii pt punctele c si d:
%Graficele spectrelor nu difera ca forma, doar ca valori
%Semnalul xc oscileaza foarte mult(-8/+8) si nu se stabilizeaza
%Semanalul xd oscileaza mai putin (-2/+2) si se stabilizeaza pana la urma

%Din spectrul cu rezolutia M1 se observa doar un varf
%Doar cu rezolutia M2 si M se pot vedea ambele varfuri pt cele 2 omega 
%De multe ori si M e prea mic si nu se pot vedea ambele varfuri