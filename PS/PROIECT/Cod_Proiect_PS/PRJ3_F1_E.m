%FAZA 1 (Rezolvarea PPFTI cu filtre Butterworth)

clc
clear all
close all

%E

[omega_p,omega_s,Delta_p,Ts] = PS_PRJ_3_Faza_1a(5,9) ;

omega_p_a = omega_p/pi; %Trebuie normat incat sa apartina (0,1)
omega_s_a = omega_s/pi; %Trebuie normat incat sa apartina (0,1)
Delta_p_a = Delta_p;
Ts_a = Ts;
Delta_s = Delta_p;
Delta_s_a = Delta_s;

omega = linspace(0,pi,1000);

[Ba,Aa] = But_FTI(omega_p_a,omega_s_a,Delta_p_a,Delta_s_a,Ts_a) ;
%O_p_a = (2/Ts_a)*(tan(omega_p_a/2));
%O_s_a = (2/Ts_a)*(tan(omega_s_a/2));
Xa=freqz (Ba, Aa, omega); 
    w_p = 2*tan(omega_p_a*pi/2)/Ts_a ; 	% Compute Omega_p.
	w_s = 2*tan(omega_s_a*pi/2)/Ts_a ; 	% Compute Omega_s.
	FN = 1-Delta_p_a ; 		% Actually, this is M_p. 
	FN = FN*FN ; 
	FN = (1-FN)/FN ; 
	Delta_s_a = Delta_s_a*Delta_s_a ; 
	M = ceil(log((1-Delta_s_a)/Delta_s_a/FN)/log(w_s/w_p)/2) ;	% Minimum order of filter. 
	E1_a = w_p/((FN)^(1/2/M)) ; 	% Actualy, this is Omega_c 
    Md = M;
    
ABSXa = abs(Xa);
tol = 10^-1;
E1_a = 0.707; %??
O_c = omega(abs(ABSXa-E1_a) < tol);
O_c_a = mean(O_c);
freq_c = O_c_a/pi;

h1 = fir1(Md-1,freq_c) ; %o fereastra Hamming

freq_p = omega_p/pi;
freq_s = omega_s/pi;
W = [0 freq_p freq_s 1];
A = [1 1 0 0];

h2 = firls(Md-1,W,A) ;

H1=freqz (h1, 1, omega);
H2=freqz (h2, 1, omega);
%Setare M pt H1 si H2 ca sa respecte cerintele de proiectare
M_e_1 = 80;
M_e_2 = 30; %Mai eficient pt ca necesita un ordin mult mai mic

figure(9); hold on;

subplot(2,1,1); hold on;
plot (omega,(abs(H1)), 'red');
plot([omega_p omega_p],[0 1.2], 'black');
plot([omega_s omega_s],[0 1.2], 'black');
plot([O_c_a O_c_a], [0 1.2], 'yellow');
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black');
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black');
plot([0 3.5],[(Delta_s) (Delta_s)], 'black');
title("Graficul spectrului H1(Metoda Ferestrei) in val abs");
hold off;

subplot(2,1,2); hold on;
plot (omega,db(abs(H1)), 'red');
plot([omega_p omega_p],[-600 200], 'black');
plot([omega_s omega_s],[-600 200], 'black');
plot([O_c_a O_c_a], [-600 200], 'yellow');
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
title("Graficul spectrului H1(Metoda Ferestrei) in dB");
hold off;

hold off;

zero_omegap = omega(omega<omega_p);
omegas_pi = omega(omega>omega_s);
K_p = numel(zero_omegap);
K_s = numel(omegas_pi);

figure(10); hold on;

subplot(2,1,1); hold on;
plot (omega,(abs(H2)), 'blue');
plot([omega_p omega_p],[0 1.2], 'black');
plot([omega_s omega_s],[0 1.2], 'black');
plot([O_c_a O_c_a], [0 1.2], 'yellow');
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black');
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black');
plot([0 3.5],[(Delta_s) (Delta_s)], 'black');
title("Graficul spectrului H2(MCMP) in val abs");
hold off;

subplot(2,1,2); hold on;
plot (omega,db(abs(H2)), 'blue');
plot([omega_p omega_p],[-600 200], 'black');
plot([omega_s omega_s],[-600 200], 'black');
plot([O_c_a O_c_a], [-600 200], 'yellow');
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
title("Graficul spectrului H2(MCMP) in dB");
hold off;

hold off;

omega_p_1000 = omega(K_p);
omega_s_1000 = omega(1000-K_s);

figure(11); hold on;

subplot(2,1,1); hold on;
h1_ideal = fir1(M_e_1,freq_c) ; %o fereastra Hamming
H1_ideal=freqz (h1_ideal, 1, omega);
plot (omega,(abs(H1_ideal)), 'red');
plot([omega_p omega_p],[0 1.2], 'black');
plot([omega_s omega_s],[0 1.2], 'black');
plot([O_c_a O_c_a], [0 1.2], 'yellow');
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black');
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black');
plot([0 3.5],[(Delta_s) (Delta_s)], 'black');
text_e1 = 'Ordinul este %d.';
char_e1 = sprintf(text_e1,M_e_1);
text(0,0.5,char_e1);
title("Graficul spectrului H1 cu ordinul modificat in val abs");
hold off;

subplot(2,1,2); hold on;
h1_ideal = fir1(M_e_1,freq_c) ; %o fereastra Hamming
H1_ideal=freqz (h1_ideal, 1, omega);
plot (omega,db(abs(H1_ideal)), 'red');
plot([omega_p omega_p],[-600 200], 'black');
plot([omega_s omega_s],[-600 200], 'black');
plot([O_c_a O_c_a], [-600 200], 'yellow');
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
text_e2 = 'Ordinul este %d.';
char_e2 = sprintf(text_e2,M_e_1);
text(0,100,char_e2);
title("Graficul spectrului H1 cu ordinul modificat in dB");
hold off;

hold off;

figure(12); hold on;

subplot(2,1,1); hold on;
h2_ideal = firls(M_e_2,W,A) ;
H2_ideal=freqz (h2_ideal, 1, omega); 
plot (omega,(abs(H2_ideal)), 'blue');
plot([omega_p omega_p],[0 1.2], 'black');
plot([omega_s omega_s],[0 1.2], 'black');
plot([O_c_a O_c_a], [0 1.2], 'yellow');
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black');
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black');
plot([0 3.5],[(Delta_s) (Delta_s)], 'black');
text_e3 = 'Ordinul este %d.';
char_e3 = sprintf(text_e3,M_e_2);
text(0,0.5,char_e3);
title("Graficul spectrului H2 cu ordinul modificat in val abs");
hold off;

subplot(2,1,2); hold on;
h2_ideal = firls(M_e_2,W,A) ;
H2_ideal=freqz (h2_ideal, 1, omega); 
plot (omega,db(abs(H2_ideal)), 'blue');
plot([omega_p omega_p],[-600 200], 'black');
plot([omega_s omega_s],[-600 200], 'black');
plot([O_c_a O_c_a], [-600 200], 'yellow');
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
text_e4 = 'Ordinul este %d.';
char_e4 = sprintf(text_e4,M_e_2);
text(0,100,char_e4);
title("Graficul spectrului H2 cu ordinul modificat in dB");
hold off;

hold off;

figure(13); hold on;

subplot(2,1,1); hold on;
plot (omega,(abs(H1)), 'red');
plot (omega,(abs(H2)), 'blue');
plot([omega_p omega_p],[0 1.2], 'black');
plot([omega_s omega_s],[0 1.2], 'black');
plot([O_c_a O_c_a], [0 1.2], 'yellow');
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black');
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black');
plot([0 3.5],[(Delta_s) (Delta_s)], 'black');
title ("Cele 2 grafice (H1 & H2) in val abs");
hold off;

subplot(2,1,2); hold on;
plot (omega,db(abs(H1)), 'red');
plot (omega,db(abs(H2)), 'blue');
plot([omega_p omega_p],[-600 200], 'black');
plot([omega_s omega_s],[-600 200], 'black');
plot([O_c_a O_c_a], [-600 200], 'yellow');
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
title ("Cele 2 grafice (H1 & H2) in dB");
hold off;

hold off;

figure(14); hold on;

subplot(3,1,1); hold on;
plot (omega, unwrap(angle(H1))*180/pi, 'red'); %faza H1e
title ("Faza H1 in grade");
hold off;

subplot(3,1,2); hold on;
plot (omega, unwrap(angle(H2))*180/pi, 'blue'); %faza H2e
title ("Faza H2 in grade");
hold off;

subplot(3,1,3); hold on;
plot (omega, unwrap(angle(H1))*180/pi, 'red'); %faza H1e
plot (omega, unwrap(angle(H2))*180/pi, 'blue'); %faza H2e
title ("Cele 2 faze (H1 & H2) in grade");
hold off;

hold off;

norma_err_spectru_e1 = norm((db(abs(H1)) - db(abs(Xa))) / db(abs(Xa)));
norma_err_faza_e1 = norm((unwrap(angle(H1))*180/pi - unwrap(angle(Xa))*180/pi) / (unwrap(angle(Xa))*180/pi));

norma_err_spectru_e2 = norm((db(abs(H2)) - db(abs(Xa))) / db(abs(Xa)));
norma_err_faza_e2= norm((unwrap(angle(H2))*180/pi - unwrap(angle(Xa))*180/pi) / (unwrap(angle(Xa))*180/pi));

figure(15); hold on;

subplot(2,1,1); hold on;

plot (omega,db(abs(H1)) - db(abs(Xa)), 'red');
text_e5 = 'norma err spectru este %.3f.';
char_e5 = sprintf(text_e5,norma_err_spectru_e1);
text(0,0,char_e5);
title ("Diferenta de spectre H1 - Xa in dB");
hold off;

subplot(2,1,2); hold on;
plot (omega, (unwrap(angle(H1))*180/pi - unwrap(angle(Xa))*180/pi), 'red');
text_e6 = 'norma err faza este %.3f.';
char_e6 = sprintf(text_e6,norma_err_faza_e1);
text(0,0,char_e6);
title ("Diferenta de faza H1 - Xa in grade");
hold off;

hold off;

figure(16); hold on;

subplot(2,1,1); hold on;
plot (omega,db(abs(H2)) - db(abs(Xa)), 'blue');
text_e7 = 'norma err spectru este %.3f.';
char_e7 = sprintf(text_e7,norma_err_spectru_e2);
text(0,0,char_e7);
title ("Diferenta de spectre H2 - Xa in dB");
hold off;

subplot(2,1,2); hold on;
plot (omega, (unwrap(angle(H2))*180/pi - unwrap(angle(Xa))*180/pi), 'blue');
text_e8 = 'norma err faza este %.3f.';
char_e8 = sprintf(text_e8,norma_err_faza_e2);
text(0,0,char_e8);
title ("Diferenta de faza H2 - Xa in grade");
hold off;

hold off;

figure(17); hold on;
plot (omega,(abs(Xa)), 'green');
plot (omega,(abs(H1)), 'red');
plot (omega,(abs(H2)), 'blue');
plot([omega_p omega_p],[0 1.2], 'black');
plot([omega_s omega_s],[0 1.2], 'black');
plot([O_c_a O_c_a], [0 1.2], 'yellow');
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black');
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black');
plot([0 3.5],[(Delta_s) (Delta_s)], 'black');
title ("Cele 3 filtre (Butterworth, H1, H2) in val abs");
hold off;

figure(18); hold on;
plot (omega,db(abs(Xa)), 'green');
plot (omega,db(abs(H1)), 'red');
plot (omega,db(abs(H2)), 'blue');
plot([omega_p omega_p],[-500 100], 'black');
plot([omega_s omega_s],[-500 100], 'black');
plot([O_c_a O_c_a], [-500 100], 'yellow');
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black');
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black');
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black');
title ("Cele 3 filtre (Butterworth, H1, H2) in dB");
hold off;