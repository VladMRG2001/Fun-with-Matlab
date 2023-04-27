%TEMA 4 (CE RELEVA AUTO-CORELATIILE)
clc
clear all
close all

%A
[N_personalizat,L_personalizat] = PS_Lab_1_Tema_4a(5,10) ; %N=711; L=237;
N=N_personalizat; L=L_personalizat;
N1=N; N2=round(N*1.5); N3=N*2; N4=N*3; N5=N*4; N6=N*5; N7=N*10;
x1 = randn(1, N1); medie1 = mean(x1); rx1 = xcorr(x1, L, 'biased');
x2 = randn(1, N2); medie2 = mean(x2); rx2 = xcorr(x2, L, 'biased');
x3 = randn(1, N3); medie3 = mean(x3); rx3 = xcorr(x3, L, 'biased');
x4 = randn(1, N4); medie4 = mean(x4); rx4 = xcorr(x4, L, 'biased');
x5 = randn(1, N5); medie5 = mean(x5); rx5 = xcorr(x5, L, 'biased');
x6 = randn(1, N6); medie6 = mean(x6); rx6 = xcorr(x6, L, 'biased');
x7 = randn(1, N7); medie7 = mean(x7); rx7 = xcorr(x7, L, 'biased');
%xcorr(... 'biased') pt auto-corelatia deviata
figure(1);
title("Graficul secvenþei de auto-corelatie")
hold on;
%stem(-L:L, rx1); 
plot(-L:L, rx1,'blue');
disp1 = rx1(L+1); %dispersia aprox 1
disp2 = rx2(L+1); %dispersia aprox 1
disp3 = rx3(L+1); %dispersia aprox 1
disp4 = rx4(L+1); %dispersia aprox 1
disp5 = rx5(L+1); %dispersia aprox 1
disp6 = rx6(L+1); %dispersia aprox 1
disp7 = rx7(L+1); %dispersia aprox 1
%zgomot alb (la toate dispersia e 1 si media 0);

%figure(8);
%hold on;
%stem(-L:L, rx2); 
plot(-L:L, rx3,'yellow');
%figure(9);
%hold on;
%stem(-L:L, rx3); 
plot(-L:L, rx5,'red');
%figure(10);
%hold on;
%stem(-L:L, rx4); 
plot(-L:L, rx7,'green');

%B
Ts = 1; 
omega = pi/30; 
%N = 711;
n = linspace(0,N-1,100);
x = sin(omega * Ts * n); 
Lb = round(N/2); %imi da eroare daca L nu e intreg
rx = xcorr(x, Lb, 'biased'); %corelatia rx a semnalului x
figure(2); 
hold on;
title("Auto-corelaþia rx a semnalului x")
plot (n, x, 'blue'); %sinusoida
plot(0:(2*Lb), rx, 'red'); %corelatia
hold off;

T = 2*pi/omega; %perioada sinusoidei

[PKS,LOCS]= findpeaks(rx);
%Valorile lui k pentru care rx[k] sunt puncte de minim sau de maxim 
%sunt date de LOCS
%Frecventa acestor valori este mai mica decat perioada T a sinusoidei 

%C
Xxilo = 'xilo.wav'; 
L=237;
[y_partxilo, Fs] = audioread(Xxilo); %La rulare se observa ca y_s are 12000 de valori; Fs e nr de hz, adica 41000
y_xilo = y_partxilo (8000 :10000); %luam esantionul de la 8000 la 10000 din matricea fisierului xilo
r_xilo = xcorr(y_partxilo, L, 'biased'); %autocorelatia totala
r_partxilo = xcorr(y_xilo, L, 'biased'); %autocorelatia esantionului dorit
figure(3);
hold on;
title("Auto-corelatiile pt xilo si pt partea extrasa din xilo")
stem (-L:L, r_xilo,'blue');
stem (-L:L, r_partxilo,'red');
hold off;

%D
L = 237; 
semnal_a = 'sunet_a.au';
semnal_i = 'sunet_i.au';
semnal_s = 'sunet_s.au';

figure(4); 
hold on;
title("Auto-corelatiile pt sunetele /a/, /i/, /s/");

[y_a, Fsa]=audioread(semnal_a);
r_a = xcorr(y_a, L, 'biased');
r_a(L+1); %dispersia
[r_a, n] = xcorr (y_a, L, 'biased');
stem(n, r_a, 'red');

[y_i, Fsi]=audioread(semnal_i);
r_i = xcorr(y_i, L, 'biased');
r_i(L+1); %dispersia
[r_i, n] = xcorr (y_i, L, 'biased');
stem(n, r_i, 'blue');

[y_s, Fss]=audioread(semnal_s);
r_s = xcorr(y_s, L, 'biased');
r_s(L+1); %dispersia
[r_s, n] = xcorr (y_s, L, 'biased');
stem(n, r_s, 'yellow');

hold off;

media_s = mean(semnal_s); %aprox 102.9 
disp_s = r_s(L+1); %aprox 0.0075
%Semnalul asociat sunetului /s/ nu are media 0 si nici dispersia 1 
%Asadar nu are caracteristicile unui zgomot alb