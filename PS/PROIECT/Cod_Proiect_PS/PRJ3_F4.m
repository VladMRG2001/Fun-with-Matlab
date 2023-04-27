%Faza 4 (Proiectarea unui filtru Butterworth avand amplificare stationara neunitara)

clc
clear all
close all

[omega_p,omega_s,Delta_p,Ts] = PS_PRJ_3_Faza_1a(5,9) ; 
Delta_s = Delta_p;

omega = linspace(0,pi,1000);
[Ma,Ba,Aa] = But_FTI_Ordin(omega_p/pi,omega_s/pi,Delta_p,Delta_s,Ts) ;
Xa=freqz (Ba, Aa, omega); %Filtrul butterworth de la Faza1

[B4,A4,M4] = But_FTI_F4(omega_p/pi,omega_s/pi,Delta_p,Delta_s,Ts) ; 
X4=freqz (B4, A4, omega); %Filtrul Butterworth modificat

E1_a = 0.707; %Filtru Butterworth

ABSXa = abs(Xa);
tol = 10^-1;
O_c = omega(abs(ABSXa-E1_a) < tol);
O_c_a = mean(O_c); 

figure(1); hold on;

subplot(2,1,1); hold on;
plot (omega, (abs(Xa)), 'blue');
plot([omega_p omega_p],[0 1.5], 'black');
plot([omega_s omega_s],[0 1.5], 'black');
plot([O_c_a O_c_a], [0 1.5], 'yellow');
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black');
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black');
plot([0 3.5],[(Delta_s) (Delta_s)], 'black');
text1 = 'Ordinul este %d.';
str1 = sprintf(text1,Ma);
text(0,0.5,str1);
title ("Filtrul Butterworth de la Faza1 in val abs");
hold off;

subplot(2,1,2); hold on;
plot (omega, db(abs(Xa)), 'blue');
plot([omega_p omega_p],[-400 200], 'black');
plot([omega_s omega_s],[-400 200], 'black');
plot([O_c_a O_c_a], [-400 200], 'yellow');
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
text(0,-200,str1);
title ("Filtrul Butterworth de la Faza1 in dB");
hold off;

hold off;

figure(2); hold on;

subplot(2,1,1); hold on;
plot (omega, (abs(X4)), 'red');
plot([omega_p omega_p],[0 1.5], 'black');
plot([omega_s omega_s],[0 1.5], 'black');
plot([O_c_a O_c_a], [0 1.5], 'yellow');
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black');
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black');
plot([0 3.5],[(Delta_s) (Delta_s)], 'black');
text2 = 'Ordinul este %d.';
str2 = sprintf(text2,M4);
text(0,0.5,str2);
title ("Filtrul Butterworth modificat in val abs");
hold off;

subplot(2,1,2); hold on;
plot (omega, db(abs(X4)), 'red');
plot([omega_p omega_p],[-500 200], 'black');
plot([omega_s omega_s],[-500 200], 'black');
plot([O_c_a O_c_a], [-500 200], 'yellow');
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
text(0,-200,str2);
title ("Filtrul Butterworth modificat in dB");
hold off;

hold off;

figure(3); hold on;

subplot(2,1,1); hold on;
plot (omega, unwrap(angle(Xa))*180/pi, 'blue'); %faza Xa
title ("Faza graficului original in grade");
hold off;

subplot(2,1,2); hold on;
plot (omega, unwrap(angle(X4))*180/pi, 'red'); %faza X4
title ("Faza graficului modificat in grade");
hold off;

hold off;

figure(4); hold on;
plot (omega, (abs(Xa)), 'blue');
plot (omega, (abs(X4)), 'red'); %Asta modificat pare si mai bun
plot([omega_p omega_p],[0 1.4], 'black');
plot([omega_s omega_s],[0 1.4], 'black');
plot([O_c_a O_c_a], [0 1.4], 'yellow');
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black');
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black');
plot([0 3.5],[(Delta_s) (Delta_s)], 'black');
title ("Cele 2 filtre suprapuse in val abs");
hold off;
%Ii trebuie toleranta la 1 pt ca nu trebuie sa depaseasca 0dB

figure(5); hold on;
plot (omega, db(abs(Xa)), 'blue');
plot (omega, db(abs(X4)), 'red'); %Asta blue pare si mai bun
plot([omega_p omega_p],[-500 200], 'black');
plot([omega_s omega_s],[-500 200], 'black');
plot([O_c_a O_c_a], [-500 200], 'yellow');
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
title ("Cele 2 filtre suprapuse in dB");
hold off;

norma_err_spectru = norm( (db(abs(X4)) - db(abs(Xa))) / db(abs(Xa)));
norma_err_faza = norm( (unwrap(angle(X4))*180/pi - unwrap(angle(Xa))*180/pi) / (unwrap(angle(Xa))*180/pi) );

figure(6); hold on;

subplot(2,1,1); hold on;
plot (omega, (db(abs(X4)) - db(abs(Xa))));
title ("Diferenta de spectru a graficelor X4 - Xa");
formatSpec5 = 'Norma dif de spectru este %.3f.';
str5 = sprintf(formatSpec5,norma_err_spectru);
text(1.5,0,str5);
hold off;

subplot(2,1,2); hold on;
plot (omega, (unwrap(angle(X4))*180/pi - unwrap(angle(Xa))*180/pi));
title ("Diferenta de faza a graficelor X4 - Xa");
formatSpec6 = 'Norma dif de faza este %.3f.';
str6 = sprintf(formatSpec6,norma_err_faza);
text(1.5,0,str6);
hold off; 

hold off;