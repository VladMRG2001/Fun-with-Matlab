%TEMA 4 (TF si detectarea periodicitatii unui semnal)
clear all
close all

%A
[~,M] = PS_Lab_2_Tema_1(5,9) ; 
load ('sunspot.dat');

%NR DE PETE
figure(1); hold on;
title("Graficul pt datele din sunspot.dat");
plot(sunspot(:,1), sunspot (:, 2));
xlabel ("An");
ylabel ("Nr de pete solare");

omega=linspace(0,pi,M); %grila de frecvente pe banda [0,pi]

%SPECTRELE
figure(2); hold on;
title("Spectrul pe 288 de ani");
X288=freqz(sunspot(1:288,2), 1, omega);%spectru pe 288 de ani
plot(omega, db(abs(X288)));
[nr_varfuri_288]=findpeaks(sunspot(:,2),sunspot(:,1),'MinPeakDistance',6);
T288=length(sunspot(1:288,2))/length(nr_varfuri_288);
hold off;

figure(3); hold on;
title("Spectrul 1700-1800");
X100=freqz(sunspot(1:100,2), 1, omega); %spectru pe 100 de ani
plot(omega, db(abs(X100)));
[nr_varfuri_100]=findpeaks(sunspot(1:100,2),sunspot(1:100,1),'MinPeakDistance',6);
T100=length(sunspot(1:100,2))/length(nr_varfuri_100);
hold off;

figure(4); hold on;
title("Spectrul 1700-1750");
X50=freqz(sunspot(1:50,2), 1, omega); %spectru pe 50 de ani
plot(omega, db(abs(X50)));
[nr_varfuri_50]=findpeaks(sunspot(1:50,2),sunspot(1:50,1),'MinPeakDistance',6);
T50=length(sunspot(1:50,2))/length(nr_varfuri_50);
hold off;

figure(5); hold on;
title("Spectrul 1800-1850");
X100_150=freqz(sunspot(100:150,2), 1, omega); %spectru pe 50 de ani
plot(omega, db(abs(X100_150)));
[nr_varfuri_100_150]=findpeaks(sunspot(100:150,2),sunspot(100:150,1),'MinPeakDistance',6);
T100_150=length(sunspot(100:150,2))/length(nr_varfuri_100_150);
hold off;

figure(6); hold on;
title("Spectrul 1800-1900");
X100_200=freqz(sunspot(100:200,2), 1, omega); %spectru pe 100 de ani
plot(omega, db(abs(X100_200)));
[nr_varfuri_100_200]=findpeaks(sunspot(100:200,2),sunspot(100:200,1),'MinPeakDistance',6);
T100_200=length(sunspot(100:200,2))/length(nr_varfuri_100_200);
hold off;
%Frecventa corespunzatoare celui mai inalt varf(excluzand omega=0) 
%este la aprox 0.57 rad/s pt toate intervalele analizate
%Astfel perioada T=2*pi/0.57 este aprox 11, asa cum se specifica in cerinta

%B
run ('lynx.m');

figure(7); hold on;
title("Datele din fisierul lynx.m");
plot(year,lynx_t);
xlabel ("An");
ylabel ("Numar");
hold off;


figure(8); hold on;
title("Spectrul lynx pt tot intervalul");
Xb = freqz (lynx_t, 1, omega);
plot (omega, db(abs(Xb))); 
[nr_varfuri_b]=findpeaks(lynx_t(1:114,1),'MinPeakDistance',6);
Tb=length(lynx_t(1:114,1))/length(nr_varfuri_b);
hold off;
%Perioada pt punctul B e aprox 10 ani
%Acest lucuru se verifica si cu reprezentarea spectrului in frecventa
%Varful are loc pt omega=0.64 si T=2*pi/0.64 este aprox 10.
%Se observa si pe Graficul semnalului aceasta perioada

%C
load ('xilo.mat');
y_xilo = yx(8000:10000); %esantionanele extrase
X_xilo = freqz (y_xilo, 1, omega);

figure(9); hold on;
title("Semnalul xilo");
plot(yx);
hold off; 

figure(10); hold on;
title("Spectrul pentru esantioanele extrase din xilo");
plot(omega,db(abs(X_xilo)));
hold off; 

%La punctul c se observa cum varful din spectru este pt omega=0.21
%T=2*pi/0.21 aprox 30
%Se observa si pe Graficul semnalului aceasta perioada