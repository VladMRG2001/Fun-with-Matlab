%FAZA 3 (Concurs de Proiectare)

clc
clear all
close all

[~,~,~,Ts] = PS_PRJ_3_Faza_1a(5,9) ; 
Delta_p = 0.05 ;
omega_p = PS_PRJ_3_Faza_3(5,9) ;
omega_s = omega_p + pi/33;
Delta_s = 0.0316; % Corespunzator -30dB, atenuarea minima

omega = linspace(0,pi,5000);

Rp = -20*log10(1-Delta_p);
Rs = -20*log10(Delta_s);

%[Ba,Aa] = But_FTI(omega_p/pi,omega_s/pi,Delta_p,Delta_s,Ts) ; %Filtru Butterworth
%Xa=freqz (Ba, Aa, omega); 

freq_p = omega_p/pi;
freq_s = omega_s/pi;
W = [0 freq_p freq_s 1];
A = [1 1 0 0];

MB = 90;

hB = firls(MB-1,W,A) ;

HB = freqz (hB, 1, omega);

MC = 7;    
[BC,AC] = ellip(MC-1,Rp,Rs,omega_p/pi); %Filtru Cauer
HC = freqz (BC, AC, omega); 

MC1 = 13;
MC2 = 13;

[BC1,AC1] = cheby1(MC1-1,Rp,omega_p/pi);
[BC2,AC2] = cheby2(MC2-1,Rs,omega_s/pi);

HC1=freqz (BC1, AC1, omega);
HC2=freqz (BC2, AC2, omega);

figure(1); hold on;
plot (omega, (abs(HB)), 'red');
plot (omega, (abs(HC)), 'blue');
plot (omega, (abs(HC1)), 'magenta');
plot (omega, (abs(HC2)), 'cyan');
plot([omega_p omega_p],[0 1.5], 'black');
plot([omega_s omega_s],[0 1.5], 'black');
%plot([O_c_a O_c_a], [0 1.5], 'yellow')
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black');
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black');
plot([0 3.5],[(Delta_s) (Delta_s)], 'black');
title ("Cele 4 tipuri de filtre in val abs");
legend('Butterworth', 'Cauer', 'Cebisev 1', 'Cebisev 2');
hold off;

figure(2); hold on;
plot (omega, db(abs(HB)), 'red');
plot (omega, db(abs(HC)), 'blue');
plot (omega, db(abs(HC1)), 'magenta');
plot (omega, db(abs(HC2)), 'cyan');
plot([omega_p omega_p],[-600 200], 'black');
plot([omega_s omega_s],[-600 200], 'black');
%plot([O_c_a O_c_a], [0 1.5], 'yellow')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
title ("Cele 4 tipuri de filtre in dB");
legend('Butterworth', 'Cauer', 'Cebisev 1', 'Cebisev 2');
hold off;

zona_tranzitorie = abs(omega_p - omega_s);
zona_gibbs = abs((1+Delta_p) - (1-Delta_p));

figure(3); hold on;
%plot (omega, (abs(HB)), 'red');
%plot (omega, (abs(HC)), 'blue');
%plot (omega, (abs(HC1)), 'magenta');
%plot (omega, (abs(HC2)), 'cyan');
plot([omega_p omega_p],[0 1.5], 'black');
plot([omega_s omega_s],[0 1.5], 'black');
%plot([O_c_a O_c_a], [0 1.5], 'yellow')
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black');
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black');
plot([0 3.5],[(Delta_s) (Delta_s)], 'black');
plot([(omega_s + 0.1*zona_tranzitorie) (omega_s + 0.1*zona_tranzitorie)],[0 1.5], 'red');
plot([(omega_p - 0.1*zona_tranzitorie) (omega_p - 0.1*zona_tranzitorie)],[0 1.5], 'red');
plot([0 3.5],[((1+Delta_p) + 0.1*zona_gibbs) ((1+Delta_p) + 0.1*zona_gibbs)], 'red');
plot([0 3.5],[((1-Delta_p) - 0.1*zona_gibbs) ((1-Delta_p) - 0.1*zona_gibbs)], 'red');
plot([0 3.5],[(Delta_s*1.1) (Delta_s*1.1)], 'red');
title ("Criteriul de performanta");
%legend('Butterworth', 'Cauer', 'Cebisev 1', 'Cebisev 2');
hold off;

figure(4); hold on;

%title("Graficele pt omega_p = " + omega_p + " ");

subplot(2,4,1); hold on;
plot (omega, db(abs(HC)));
plot([omega_p omega_p],[-600 200], 'black');
plot([omega_s omega_s],[-600 200], 'black');
%plot([O_c_a O_c_a], [0 1.5], 'yellow')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
text2 = 'Ordinul Cauer este %d.';
str2 = sprintf(text2,MC);
text(0,-200,str2);
title("Spectrul Cauer");
hold off;

subplot(2,4,2); hold on;
plot (omega, db(abs(HC1)));
plot([omega_p omega_p],[-600 200], 'black');
plot([omega_s omega_s],[-600 200], 'black');
%plot([O_c_a O_c_a], [0 1.5], 'yellow')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
text3 = 'Ordinul Cebisev 1 este %d.';
str3 = sprintf(text3,MC1);
text(0,-200,str3);
title("Spectrul Cebisev1");
hold off;

subplot(2,4,3); hold on;
plot (omega, db(abs(HC2)));
plot([omega_p omega_p],[-600 200], 'black');
plot([omega_s omega_s],[-600 200], 'black');
%plot([O_c_a O_c_a], [0 1.5], 'yellow')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
text4 = 'Ordinul Cebisev 2 este %d.';
str4 = sprintf(text4,MC2);
text(0,-200,str4);
title("Spectrul Cebisev2");
hold off;

subplot(2,4,4); hold on;
plot (omega, db(abs(HB)));
plot([omega_p omega_p],[-600 200], 'black');
plot([omega_s omega_s],[-600 200], 'black');
%plot([O_c_a O_c_a], [0 1.5], 'yellow')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
text1 = 'Ordinul M_B este %d.';
str1 = sprintf(text1,MB);
text(0,-200,str1);
title("Spectrul Butterworth");
hold off;

subplot(2,4,5); hold on;
plot(omega, unwrap(angle(HC)));
title ("Faza pt Cauer");
hold off;

subplot(2,4,6); hold on;
plot(omega, unwrap(angle(HC1)));
title ("Faza pt Cebisev1");
hold off;

subplot(2,4,7); hold on;
plot(omega, unwrap(angle(HC2)));
title ("Faza pt Cebisev2");
hold off;

subplot(2,4,8); hold on;
plot(omega, unwrap(angle(HB)));
title ("Faza pt Butterworth");
hold off;

hold off;

figure(5); hold on;

%title("Graficele pt omega_p = " + omega_p + " ");

subplot(2,4,1); hold on;
plot (omega, db(abs(HC)));
%plot([omega_p omega_p],[-600 200], 'black');
%plot([omega_s omega_s],[-600 200], 'black');
%plot([O_c_a O_c_a], [0 1.5], 'yellow')
%plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
%plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
%plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
plot([(omega_s + 0.1*zona_tranzitorie) (omega_s + 0.1*zona_tranzitorie)],[-600 200], 'red');
plot([(omega_p - 0.1*zona_tranzitorie) (omega_p - 0.1*zona_tranzitorie)],[-600 200], 'red');
plot([0 3.5],[db((1+Delta_p) + 0.1*zona_gibbs) db((1+Delta_p) + 0.1*zona_gibbs)], 'red');
plot([0 3.5],[db((1-Delta_p) - 0.1*zona_gibbs) db((1-Delta_p) - 0.1*zona_gibbs)], 'red');
plot([0 3.5],[db(Delta_s*1.1) db(Delta_s*1.1)], 'red');
text2 = 'Ordinul Cauer este %d.';
str2 = sprintf(text2,MC);
text(0,-200,str2);
title("Spectrul Cauer");
hold off;

subplot(2,4,2); hold on;
plot (omega, db(abs(HC1)));
%plot([omega_p omega_p],[-600 200], 'black');
%plot([omega_s omega_s],[-600 200], 'black');
%plot([O_c_a O_c_a], [0 1.5], 'yellow')
%plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
%plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
%plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
plot([(omega_s + 0.1*zona_tranzitorie) (omega_s + 0.1*zona_tranzitorie)],[-600 200], 'red');
plot([(omega_p - 0.1*zona_tranzitorie) (omega_p - 0.1*zona_tranzitorie)],[-600 200], 'red');
plot([0 3.5],[db((1+Delta_p) + 0.1*zona_gibbs) db((1+Delta_p) + 0.1*zona_gibbs)], 'red');
plot([0 3.5],[db((1-Delta_p) - 0.1*zona_gibbs) db((1-Delta_p) - 0.1*zona_gibbs)], 'red');
plot([0 3.5],[db(Delta_s*1.1) db(Delta_s*1.1)], 'red');
text3 = 'Ordinul Cebisev 1 este %d.';
str3 = sprintf(text3,MC1);
text(0,-200,str3);
title("Spectrul Cebisev1");
hold off;

subplot(2,4,3); hold on;
plot (omega, db(abs(HC2)));
%plot([omega_p omega_p],[-600 200], 'black');
%plot([omega_s omega_s],[-600 200], 'black');
%plot([O_c_a O_c_a], [0 1.5], 'yellow')
%plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
%plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
%plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
plot([(omega_s + 0.1*zona_tranzitorie) (omega_s + 0.1*zona_tranzitorie)],[-600 200], 'red');
plot([(omega_p - 0.1*zona_tranzitorie) (omega_p - 0.1*zona_tranzitorie)],[-600 200], 'red');
plot([0 3.5],[db((1+Delta_p) + 0.1*zona_gibbs) db((1+Delta_p) + 0.1*zona_gibbs)], 'red');
plot([0 3.5],[db((1-Delta_p) - 0.1*zona_gibbs) db((1-Delta_p) - 0.1*zona_gibbs)], 'red');
plot([0 3.5],[db(Delta_s*1.1) db(Delta_s*1.1)], 'red');
text4 = 'Ordinul Cebisev 2 este %d.';
str4 = sprintf(text4,MC2);
text(0,-200,str4);
title("Spectrul Cebisev2");
hold off;

subplot(2,4,4); hold on;
plot (omega, db(abs(HB)));
%plot([omega_p omega_p],[-600 200], 'black');
%plot([omega_s omega_s],[-600 200], 'black');
%plot([O_c_a O_c_a], [0 1.5], 'yellow')
%plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
%plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
%plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
plot([(omega_s + 0.1*zona_tranzitorie) (omega_s + 0.1*zona_tranzitorie)],[-600 200], 'red');
plot([(omega_p - 0.1*zona_tranzitorie) (omega_p - 0.1*zona_tranzitorie)],[-600 200], 'red');
plot([0 3.5],[db((1+Delta_p) + 0.1*zona_gibbs) db((1+Delta_p) + 0.1*zona_gibbs)], 'red');
plot([0 3.5],[db((1-Delta_p) - 0.1*zona_gibbs) db((1-Delta_p) - 0.1*zona_gibbs)], 'red');
plot([0 3.5],[db(Delta_s*1.1) db(Delta_s*1.1)], 'red');
text1 = 'Ordinul M_B este %d.';
str1 = sprintf(text1,MB);
text(0,-200,str1);
title("Spectrul Butterworth");
hold off;

subplot(2,4,5); hold on;
plot(omega, unwrap(angle(HC)));
title ("Faza pt Cauer");
hold off;

subplot(2,4,6); hold on;
plot(omega, unwrap(angle(HC1)));
title ("Faza pt Cebisev1");
hold off;

subplot(2,4,7); hold on;
plot(omega, unwrap(angle(HC2)));
title ("Faza pt Cebisev2");
hold off;

subplot(2,4,8); hold on;
plot(omega, unwrap(angle(HB)));
title ("Faza pt Butterworth");
hold off;

hold off;

savefile = 'Etapa3.mat';
save(savefile, 'HB', 'HC', 'HC1', 'HC2', 'MB', 'MC', 'MC1', 'MC2', 'omega_p');