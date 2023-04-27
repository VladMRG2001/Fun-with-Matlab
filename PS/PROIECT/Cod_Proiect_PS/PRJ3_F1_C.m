%FAZA 1 (Rezolvarea PPFTI cu filtre Butterworth)

clc
clear all
close all

%C
[omega_p,omega_s,Delta_p,Ts] = PS_PRJ_3_Faza_1a(5,9) ;
omega_p = omega_p/pi; %Trebuie normat incat sa apartina (0,1)
omega_s = omega_s/pi; %Trebuie normat incat sa apartina (0,1)
Delta_s = Delta_p;

omega = linspace(0,pi,1000);

[Ba,Aa] = But_FTI(omega_p,omega_s,Delta_p,Delta_s,Ts) ;

Xa=freqz (Ba, Aa, omega); 

Ts_1 = 0.1*Ts;
Ts_2 = Ts/4;
Ts_3 = Ts/2;
Ts_4 = 3*Ts/4;
Ts_5 = 5*Ts/4;
Ts_6 = 7*Ts/4;
Ts_7 = 9*Ts/4;
Ts_8 = 3*Ts;

figure(5); hold on;

[B1,A1] = But_FTI(omega_p,omega_s,Delta_p,Delta_s,Ts_1) ;
Xc_1=freqz (B1, A1, omega); 
subplot(4,4,1); hold on;
plot (omega, db(abs(Xc_1)));
plot([omega_p*pi omega_p*pi],[-400 50], 'black')
plot([omega_s*pi omega_s*pi],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
title ("Spectru pt 0.1*Ts")
hold off;

[B2,A2] = But_FTI(omega_p,omega_s,Delta_p,Delta_s,Ts_2) ;
Xc_2=freqz (B2, A2, omega); 
subplot(4,4,2); hold on;
plot (omega, db(abs(Xc_2)));
plot([omega_p*pi omega_p*pi],[-400 50], 'black')
plot([omega_s*pi omega_s*pi],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
title ("Spectru pt Ts/4");
hold off;

[B3,A3] = But_FTI(omega_p,omega_s,Delta_p,Delta_s,Ts_3) ;
Xc_3=freqz (B3, A3, omega); 
subplot(4,4,3); hold on;
plot (omega, db(abs(Xc_3)));
plot([omega_p*pi omega_p*pi],[-400 50], 'black')
plot([omega_s*pi omega_s*pi],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
title ("Spectru pt Ts/2");
hold off;

[B4,A4] = But_FTI(omega_p,omega_s,Delta_p,Delta_s,Ts_4) ;
Xc_4=freqz (B4, A4, omega); 
subplot(4,4,4); hold on;
plot (omega, db(abs(Xc_4)));
plot([omega_p*pi omega_p*pi],[-400 50], 'black')
plot([omega_s*pi omega_s*pi],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
title ("Spectru pt 3*Ts/4");
hold off;

subplot(4,4,5); hold on;
plot(omega, db(abs(Xc_1))-db(abs(Xa)));
norma_spectru_1 = norm((db(abs(Xc_1)) - db(abs(Xa))) / db(abs(Xa)));
text_1 = 'norma err spectru este %.3f.';
char_1 = sprintf(text_1,norma_spectru_1);
text(0,0,char_1);
title ("Dif spectru pt 0.1*Ts")
hold off;

subplot(4,4,6); hold on;
plot(omega, db(abs(Xc_2))-db(abs(Xa)));
norma_spectru_2 = norm((db(abs(Xc_2)) - db(abs(Xa))) / db(abs(Xa)));
text_2 = 'norma err spectru este %.3f.';
char_2 = sprintf(text_2,norma_spectru_2);
text(0,0,char_2);
title ("Dif spectru pt Ts/4")
hold off;

subplot(4,4,7); hold on;
plot(omega, db(abs(Xc_3))-db(abs(Xa)));
norma_spectru_3 = norm((db(abs(Xc_3)) - db(abs(Xa))) / db(abs(Xa)));
text_3 = 'norma err spectru este %.3f.';
char_3 = sprintf(text_3,norma_spectru_3);
text(0,0,char_3);
title ("Dif spectru pt Ts/2")
hold off;

subplot(4,4,8); hold on;
plot(omega, db(abs(Xc_4))-db(abs(Xa)));
norma_spectru_4 = norm((db(abs(Xc_4)) - db(abs(Xa))) / db(abs(Xa)));
text_4 = 'norma err spectru este %.3f.';
char_4 = sprintf(text_4,norma_spectru_4);
text(0,0,char_4);
title ("Dif spectru pt 3*Ts/4")
hold off;

subplot(4,4,9); hold on;
plot(omega, unwrap(angle(Xc_1)));
title ("Faza pt 0.1*Ts")
hold off;

subplot(4,4,10); hold on;
plot(omega, unwrap(angle(Xc_2)));
title ("Faza pt Ts/4")
hold off;

subplot(4,4,11); hold on;
plot(omega, unwrap(angle(Xc_3)));
title ("Faza pt Ts/2")
hold off;

subplot(4,4,12); hold on;
plot(omega, unwrap(angle(Xc_4)));
title ("Faza pt 3*Ts/4")
hold off;

subplot(4,4,13); hold on;
plot(omega, unwrap(angle(Xc_1))-unwrap(angle(Xa)));
norma_faza_1 = norm((unwrap(angle(Xc_1))*180/pi - unwrap(angle(Xa))*180/pi) / (unwrap(angle(Xa))*180/pi));
text_5 = 'norma err faza este %.3f.';
char_5 = sprintf(text_5,norma_faza_1);
text(0,0,char_5);
title ("Dif faza pt 0.1*Ts")
hold off;

subplot(4,4,14); hold on;
plot(omega, unwrap(angle(Xc_2))-unwrap(angle(Xa)));
norma_faza_2 = norm((unwrap(angle(Xc_2))*180/pi - unwrap(angle(Xa))*180/pi) / (unwrap(angle(Xa))*180/pi));
text_6 = 'norma err faza este %.3f.';
char_6 = sprintf(text_6,norma_faza_2);
text(0,0,char_6);
title ("Dif faza pt Ts/4")
hold off;

subplot(4,4,15); hold on;
plot(omega, unwrap(angle(Xc_3))-unwrap(angle(Xa)));
norma_faza_3 = norm((unwrap(angle(Xc_3))*180/pi - unwrap(angle(Xa))*180/pi) / (unwrap(angle(Xa))*180/pi));
text_7 = 'norma err faza este %.3f.';
char_7 = sprintf(text_7,norma_faza_3);
text(0,0,char_7);
title ("Dif faza pt Ts/2")
hold off;

subplot(4,4,16); hold on;
plot(omega, (unwrap(angle(Xc_4))-unwrap(angle(Xa))));
norma_faza_4 = norm((unwrap(angle(Xc_4))*180/pi - unwrap(angle(Xa))*180/pi) / (unwrap(angle(Xa))*180/pi));
text_8 = 'norma err faza este %.3f.';
char_8 = sprintf(text_8,norma_faza_4);
text(0,0,char_8);
title ("Dif faza pt 3*Ts/4")
hold off;

hold off;

figure(6); hold on;

[B5,A5] = But_FTI(omega_p,omega_s,Delta_p,Delta_s,Ts_5) ;
Xc_5=freqz (B5, A5, omega); 
subplot(4,4,1); hold on;
plot (omega, db(abs(Xc_5)));
plot([omega_p*pi omega_p*pi],[-400 50], 'black')
plot([omega_s*pi omega_s*pi],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
title ("Spectru pt 5*Ts/4")
hold off;

[B6,A6] = But_FTI(omega_p,omega_s,Delta_p,Delta_s,Ts_6) ;
Xc_6=freqz (B6, A6, omega); 
subplot(4,4,2); hold on;
plot (omega, db(abs(Xc_6)));
plot([omega_p*pi omega_p*pi],[-400 50], 'black')
plot([omega_s*pi omega_s*pi],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
title ("Spectru pt 7*Ts/4")
hold off;

[B7,A7] = But_FTI(omega_p,omega_s,Delta_p,Delta_s,Ts_7) ;
Xc_7=freqz (B7, A7, omega); 
subplot(4,4,3); hold on;
plot (omega, db(abs(Xc_7)));
plot([omega_p*pi omega_p*pi],[-400 50], 'black')
plot([omega_s*pi omega_s*pi],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
title ("Spectru pt 9*Ts/4")
hold off;

[B8,A8] = But_FTI(omega_p,omega_s,Delta_p,Delta_s,Ts_8) ;
Xc_8=freqz (B8, A8, omega); 
subplot(4,4,4); hold on;
plot (omega, db(abs(Xc_8)));
plot([omega_p*pi omega_p*pi],[-400 50], 'black')
plot([omega_s*pi omega_s*pi],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
title ("Spectru pt 3*Ts")
hold off;

subplot(4,4,5); hold on;
plot(omega, db(abs(Xc_5))-db(abs(Xa)));
norma_spectru_5 = norm((db(abs(Xc_5)) - db(abs(Xa))) / db(abs(Xa)));
text_9 = 'norma err spectru este %.3f.';
char_9 = sprintf(text_9,norma_spectru_5);
text(0,0,char_9);
title ("Dif spectru pt 5*Ts/4")
hold off;

subplot(4,4,6); hold on;
plot(omega, db(abs(Xc_6))-db(abs(Xa)));
norma_spectru_6 = norm((db(abs(Xc_6)) - db(abs(Xa))) / db(abs(Xa)));
text_10 = 'norma err spectru este %.3f.';
char_10 = sprintf(text_10,norma_spectru_6);
text(0,0,char_10);
title ("Dif spectru pt 7*Ts/4")
hold off;

subplot(4,4,7); hold on;
plot(omega, db(abs(Xc_7))-db(abs(Xa)));
norma_spectru_7 = norm((db(abs(Xc_7)) - db(abs(Xa))) / db(abs(Xa)));
text_11 = 'norma err spectru este %.3f.';
char_11 = sprintf(text_11,norma_spectru_7);
text(0,0,char_11);
title ("Dif spectru pt 9*Ts/4")
hold off;

subplot(4,4,8); hold on;
plot(omega, db(abs(Xc_8))-db(abs(Xa)));
norma_spectru_8 = norm((db(abs(Xc_8)) - db(abs(Xa))) / db(abs(Xa)));
text_12 = 'norma err spectru este %.3f.';
char_12 = sprintf(text_12,norma_spectru_8);
text(0,0,char_12);
title ("Dif spectru pt 3*Ts")
hold off;

subplot(4,4,9); hold on;
plot(omega, unwrap(angle(Xc_5)));
title ("Faza pt 5*Ts/4")
hold off;

subplot(4,4,10); hold on;
plot(omega, unwrap(angle(Xc_6)));
title ("Faza pt 7*Ts/4")
hold off;

subplot(4,4,11); hold on;
plot(omega, unwrap(angle(Xc_7)));
title ("Faza pt 9*Ts/4")
hold off;

subplot(4,4,12); hold on;
plot(omega, unwrap(angle(Xc_8)));
title ("Faza pt 3*Ts")
hold off;

subplot(4,4,13); hold on;
plot(omega, unwrap(angle(Xc_5))-unwrap(angle(Xa)));
norma_faza_5 = norm((unwrap(angle(Xc_5))*180/pi - unwrap(angle(Xa))*180/pi) / (unwrap(angle(Xa))*180/pi));
text_13 = 'norma err faza este %.3f.';
char_13 = sprintf(text_13,norma_faza_5);
text(0,0,char_13);
title ("Dif faza pt 5*Ts/4")
hold off;

subplot(4,4,14); hold on;
plot(omega, unwrap(angle(Xc_6))-unwrap(angle(Xa)));
norma_faza_6 = norm((unwrap(angle(Xc_6))*180/pi - unwrap(angle(Xa))*180/pi) / (unwrap(angle(Xa))*180/pi));
text_14 = 'norma err faza este %.3f.';
char_14 = sprintf(text_14,norma_faza_6);
text(0,0,char_14);
title ("Dif faza pt 7*Ts/4")
hold off;

subplot(4,4,15); hold on;
plot(omega, unwrap(angle(Xc_7))-unwrap(angle(Xa)));
norma_faza_7 = norm((unwrap(angle(Xc_7))*180/pi - unwrap(angle(Xa))*180/pi) / (unwrap(angle(Xa))*180/pi));
text_15 = 'norma err faza este %.3f.';
char_15 = sprintf(text_15,norma_faza_7);
text(0,0,char_15);
title ("Dif faza pt 9*Ts/4")
hold off;

subplot(4,4,16); hold on;
plot(omega, (unwrap(angle(Xc_8))-unwrap(angle(Xa))));
norma_faza_8 = norm((unwrap(angle(Xc_8))*180/pi - unwrap(angle(Xa))*180/pi) / (unwrap(angle(Xa))*180/pi));
text_16 = 'norma err faza este %.3f.';
char_16 = sprintf(text_16,norma_faza_8);
text(0,0,char_16);
title ("Dif faza pt 3*Ts")
hold off;

hold off;
