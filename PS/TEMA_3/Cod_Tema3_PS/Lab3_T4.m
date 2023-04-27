%TEMA 4(Legatura dintre poli, zerouri si raspunsul in frecventa)

clear all;
close all;

%A

[poli_1,zerouri_1] = PS_Lab_3_Tema_4a(5,9) ;
P_1=poly(poli_1);
Z_1=poly(zerouri_1);
Z1=zerouri_1';
P1=poli_1';
omega = linspace(-pi,pi,1000);

H_1=tf(Z_1,P_1); %H=Z/P

pulsatii_poli_1=angle(poli_1); %Pulsatiile corespunzatoare polilor
pulsatii_zerouri_1=angle(zerouri_1); %Pulsatiile corespunzatoare zerourilor

figure(1); hold on;
zplane(Z1,P1);
title('Diagrama Poli-Zerouri - A');
hold off;

figure(2); hold on;
freqz(Z_1,P_1,omega);
title('Raspunsul in frecventa - A');
hold off;

%Se observa cum la pulsatiile corespunzatoare polilor, raspunsul in
%frecventa are un maxim local
%La pulsatiile corespunzatoare zerourilor, raspunsul in frecventa are un
%minim local
%Ma refer la graficul amplificarii, adica spectrul

%B

[poli_2,zerouri_2] = PS_Lab_3_Tema_4b(5,9) ;
P_2=poly(poli_2);
Z_2=poly(zerouri_2);
Z2=zerouri_2';
P2=poli_2';
%omega = linspace(-pi,pi,1000);

H_2=tf(Z_2,P_2); %H=Z/P

pulsatii_poli_2=angle(poli_2); %Pulsatiile corespunzatoare polilor
pulsatii_zerouri_2=angle(zerouri_2); %Pulsatiile corespunzatoare zerourilor

figure(3); hold on;
zplane(Z2,P2);
title('Diagrama Poli-Zerouri - B');
hold off;

figure(4); hold on;
freqz(Z_2,P_2,omega);
title('Raspunsul in frecventa - B');
hold off;

%Se observa cum in acest caz nu se mai respecta regula de la A