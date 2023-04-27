%TEMA 3 (SINUSOIDE DISCRETE)
clc
clear all
close all

Ts=1;

%A
Na=30;
na=linspace(0,Na-1,100);
%wa=(2*k*pi)/N
wa=3.14/15;
%(2*1*pi)/N = (1*pi)/15 -> 2/N=1/15 -> Na=30 (Perioada 3_a)
xna=sin(wa*na*Ts); 

figure(1); 
hold on;
title("Sinusoida discreta periodica (k=1)");
stem(na,xna); %a. sinusoida discreta periodica (k=1)
plot(na,xna);
hold off;

%B
%wb=(2*k*pi)/N
wb=3*3.14/15;
%w=wb
%(2*3*pi)/N = (3*pi)/15 -> 2/N=1/15 -> Nb=30 (Perioada 3_b din Lab)

omegab_personalizat=PS_Lab_1_Tema_3b(5,10); %0.0556
omegab=omegab_personalizat;
%omegab=(2*k*pi)/N
Nb=ceil((2*pi)/omegab); %113(Perioada 3_b cu datele personalizate)
nb=linspace(0,(5*Nb-1),100);
xnb=sin(omegab*nb*Ts); 

figure(2);
hold on;
title("Sinusoida discreta periodica (k=3)");
stem(nb,xnb); %b. sinusoida discreta periodica (k=3)
plot(nb,xnb);
hold off;

%C
wc=1;
omegac_personalizat=PS_Lab_1_Tema_3c(5,10); %0.0088
omegac=omegac_personalizat;
%omegac=(2*k*pi)/N
Nc=ceil((2*pi)/omegac); %710
nc=linspace(0,(5*Nc-1),100);
xnc = sin (omegac * nc * Ts);

figure(3);
hold on;
title("3.c");
stem(nc,xnc); %c. sinusoida discreta aperiodica 
plot(nc,xnc)
hold off;

%D
w1=pi/3;
w2=2*pi+pi/3;
N=Nb;
nd=linspace(0,5*N-1,50);
xnd1 = sin (w1 * nd * Ts);
xnd2 = sin (w2 * nd * Ts);
xnd = conv (xnd1, xnd2,'same'); %convolutia sinusoidelor
figure(4);
title("Sinusoidele continue si cea discreta");
hold on;
plot(nd,xnd1,'blue');
plot(nd,xnd2,'yellow');
stem(nd,xnd,'red');
hold off;

figure(5);
hold on;
title("Cele 2 sinusoide, dar in discret");
stem(nd,xnd1);
stem(nd,xnd2);
hold off;
