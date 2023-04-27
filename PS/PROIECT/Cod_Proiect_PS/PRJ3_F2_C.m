%FAZA 2 (Rezolvarea PPFTI cu filtre Cauer si Cebisev)

clc
clear all
close all

%C

[omega_p,omega_s,Delta_p,Ts] = PS_PRJ_3_Faza_1a(5,9) ; 
Delta_s = 2*Delta_p;

Delta_s_test = Delta_s;

Rp = -20*log10(1-Delta_p);
Rs = -20*log10(Delta_s);

omega = linspace(0,pi,1000);

M_C1 = 7;
M_C2 = 7;

[B_C1,A_C1] = cheby1(M_C1-1,Rp,omega_p/pi);
[B_C2,A_C2] = cheby2(M_C2-1,Rs,omega_s/pi);

XC1=freqz (B_C1, A_C1, omega);
XC2=freqz (B_C2, A_C2, omega);

figure(1); hold on;

subplot(2,1,1); hold on;
plot (omega,(abs(XC1)), 'red');
plot([omega_p omega_p],[0 1.2], 'black')
plot([omega_s omega_s],[0 1.2], 'black')
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black')
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black')
plot([0 3.5],[(Delta_s) (Delta_s)], 'black')
title("Graficul spectrului XC1(Cebisev 1) in val abs");
hold off;

subplot(2,1,2); hold on;
plot (omega,db(abs(XC1)), 'red');
plot([omega_p omega_p],[-600 200], 'black')
plot([omega_s omega_s],[-600 200], 'black')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
title("Graficul spectrului XC1(Cebisev 1) in dB");
hold off;

hold off;

figure(2); hold on;

subplot(2,1,1); hold on;
plot (omega,(abs(XC2)), 'blue');
plot([omega_p omega_p],[0 1.2], 'black')
plot([omega_s omega_s],[0 1.2], 'black')
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black')
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black')
plot([0 3.5],[(Delta_s) (Delta_s)], 'black')
title("Graficul spectrului XC2(Cebisev 2) in val abs");
hold off;

subplot(2,1,2); hold on;
plot (omega,db(abs(XC2)), 'blue');
plot([omega_p omega_p],[-600 200], 'black')
plot([omega_s omega_s],[-600 200], 'black')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
title("Graficul spectrului XC2(Cebisev 2) in dB");
hold off;

hold off;

figure(3); hold on;

subplot(3,1,1); hold on;
plot (omega, unwrap(angle(XC1))*180/pi, 'red'); %faza XC1
title ("Faza XC1 in grade");
hold off;

subplot(3,1,2); hold on;
plot (omega, unwrap(angle(XC2))*180/pi, 'blue'); %faza XC2
title ("Faza XC2 in grade");
hold off;

subplot(3,1,3); hold on;
plot (omega, unwrap(angle(XC1))*180/pi, 'red'); %faza XC1
plot (omega, unwrap(angle(XC2))*180/pi, 'blue'); %faza XC2
title ("Cele 2 faze (H1 & H2) in grade");
hold off;

hold off; 

figure(4); hold on;

subplot(2,1,1); hold on;
plot (omega,(abs(XC1)), 'red');
plot (omega,(abs(XC2)), 'blue');
plot([omega_p omega_p],[0 1.2], 'black')
plot([omega_s omega_s],[0 1.2], 'black')
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black')
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black')
plot([0 3.5],[(Delta_s) (Delta_s)], 'black')
title("Graficul spectrelor XC1 & XC2 in val abs");
text_1 = 'Ordinul Cebisev1 este %d.';
char_1 = sprintf(text_1,M_C1);
text(0,0.8,char_1);
text_2 = 'Ordinul Cebisev2 este %d.';
char_2 = sprintf(text_2,M_C2);
text(0,0.6,char_2);
hold off;

subplot(2,1,2); hold on;
plot (omega,db(abs(XC1)), 'red');
plot (omega,db(abs(XC2)), 'blue');
plot([omega_p omega_p],[-600 200], 'black')
plot([omega_s omega_s],[-600 200], 'black')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
text(0,-100,char_1);
text(0,-200,char_2);
title("Graficul spectrelor XC1 & XC2 in dB");
hold off;

hold off;

M_Cauer = 5;
[Ba,Aa] = ellip(M_Cauer-1,Rp,Rs,omega_p/pi); %Filtru Cauer
Xa=freqz (Ba, Aa, omega);

[Bb,Ab] = But_FTI(omega_p/pi,omega_s/pi,Delta_p,Delta_s,Ts) ; %Butterworth (IIR)
Xb = freqz (Bb, Ab, omega);

w_p = 2*tan(omega_p/2)/Ts ; 	% Compute Omega_p.
	w_s = 2*tan(omega_s/2)/Ts ; 	% Compute Omega_s.
	FN = 1-Delta_p ; 		% Actually, this is M_p. 
	FN = FN*FN ; 
	FN = (1-FN)/FN ; 
	Delta_s_test = Delta_s_test*Delta_s_test ; 
	M = ceil(log((1-Delta_s_test)/Delta_s_test/FN)/log(w_s/w_p)/2) ;	% Minimum order of filter. 
	E1_a = w_p/((FN)^(1/2/M)) ; 	% Actualy, this is Omega_c 
    M_B = M; %Ordinul Butterworth

ABSXb = abs(Xb);
tol = 10^-1;
O_c = omega(abs(ABSXb-E1_a) < tol);
O_c_a = mean(O_c);
freq_c = O_c_a/pi;   
    
h1 = fir1(M_B-1,freq_c) ; %o fereastra Hamming
freq_p = omega_p/pi;
freq_s = omega_s/pi;
W = [0 freq_p freq_s 1];
A = [1 1 0 0];

h2 = firls(M_B-1,W,A) ;

H1=freqz (h1, 1, omega);
H2=freqz (h2, 1, omega);

%Setare M pt H1 si H2 ca sa respecte cerintele de proiectare
M_e_1 = 75;
M_e_2 = 40; %Mai eficient pt ca necesita un ordin mult mai mic

h1_ideal = fir1(M_e_1,freq_c) ; %o fereastra Hamming
H1_ideal=freqz (h1_ideal, 1, omega);

h2_ideal = firls(M_e_2,W,A) ;
H2_ideal=freqz (h2_ideal, 1, omega); 

figure(5); hold on;
plot (omega,(abs(Xa)), 'cyan');
plot (omega,(abs(Xb)), 'green');
plot (omega,(abs(H1_ideal)), 'red');
plot (omega,(abs(H2_ideal)), 'blue');
plot (omega,(abs(XC1)), 'yellow');
plot (omega,(abs(XC2)), 'magenta');
plot([omega_p omega_p],[0 1.2], 'black')
plot([omega_s omega_s],[0 1.2], 'black')
%plot([O_c_a O_c_a], [0 1.2], 'yellow')
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black')
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black')
plot([0 3.5],[(Delta_s) (Delta_s)], 'black')
text_1 = 'Ordinul Cauer este %d.';
char_1 = sprintf(text_1,M_Cauer);
text(0,0.8,char_1);
text_2 = 'Ordinul Butterworth este %d.';
char_2 = sprintf(text_2,M_B);
text(0,0.7,char_2);
text_3 = 'Ordinul MF este %d.';
char_3 = sprintf(text_3,M_e_1);
text(0,0.6,char_3);
text_4 = 'Ordinul MCMP este %d.';
char_4 = sprintf(text_4,M_e_2);
text(0,0.5,char_4);
text_5 = 'Ordinul Cebisev1 este %d.';
char_5 = sprintf(text_5,M_C1);
text(0,0.4,char_5);
text_6 = 'Ordinul Cebisev2 este %d.';
char_6 = sprintf(text_5,M_C2);
text(0,0.3,char_6);
title ("Cele 6 filtre (Cauer, Butterworth, MF, MCMP, Cebisev1, Cebisev2) in val abs");
legend('Cauer', 'Butterowrth', 'MF', 'MCMP', 'Cebisev 1', 'Cebisev 2');
hold off;

figure(6); hold on;
plot (omega,db(abs(Xa)), 'cyan');
plot (omega,db(abs(Xb)), 'green');
plot (omega,db(abs(H1_ideal)), 'red');
plot (omega,db(abs(H2_ideal)), 'blue');
plot (omega,db(abs(XC1)), 'yellow');
plot (omega,db(abs(XC2)), 'magenta');
plot([omega_p omega_p],[-500 100], 'black')
plot([omega_s omega_s],[-500 100], 'black')
%plot([O_c_a O_c_a], [-500 100], 'yellow')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
text(0,-50,char_1);
text(0,-100,char_2);
text(0,-150,char_3);
text(0,-200,char_4);
text(0,-250,char_5);
text(0,-300,char_6);
title ("Cele 6 filtre (Cauer, Butterworth, MF, MCMP, Cebisev1, Cebisev2) in dB");
legend('Cauer', 'Butterowrth', 'MF', 'MCMP', 'Cebisev 1', 'Cebisev 2');
hold off;