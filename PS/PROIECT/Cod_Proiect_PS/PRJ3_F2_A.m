%FAZA 2 (Rezolvarea PPFTI cu filtre Cauer si Cebisev)

clc
clear all
close all

%A
[omega_p,omega_s,Delta_p,Ts] = PS_PRJ_3_Faza_1a(5,9) ; 
Delta_s = 2*Delta_p;

Rp = -20*log10(1-Delta_p);
Rs = -20*log10(Delta_s);

M = 5;
[Ba,Aa] = ellip(M-1,Rp,Rs,omega_p/pi); %Filtru Cauer
omega = linspace(0,pi,1000);
Xa=freqz (Ba, Aa, omega); 

figure(1); hold on;

subplot(2,1,1); hold on
plot (omega,(abs(Xa)), 'red');
plot([omega_p omega_p],[0 1.2], 'black')
plot([omega_s omega_s],[0 1.2], 'black')
%plot([O_c_a O_c_a], [0 1.2])
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black')
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black')
plot([0 3.5],[(Delta_s) (Delta_s)], 'black')
text_1 = 'Ordinul este %d.';
char_1 = sprintf(text_1,M);
text(0,0.5,char_1);
title("Graficul spectrului Cauer in val abs");
hold off;

subplot(2,1,2); hold on
plot (omega,db(abs(Xa)), 'red');
plot([omega_p omega_p],[-100 50], 'black')
plot([omega_s omega_s],[-100 50], 'black')
%plot([O_c_a O_c_a], [0 1.2])
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
text(0,-50,char_1);
title("Graficul spectrului Cauer in dB");
hold off;

hold off;

[Bb,Ab] = But_FTI(omega_p/pi,omega_s/pi,Delta_p,Delta_s,Ts) ; %Butterworth (IIR)
Xb = freqz (Bb, Ab, omega);

Delta_s_test = Delta_s;

    w_p = 2*tan(omega_p/2)/Ts ; 	% Compute Omega_p.
	w_s = 2*tan(omega_s/2)/Ts ; 	% Compute Omega_s.
	FN = 1-Delta_p ; 		% Actually, this is M_p. 
	FN = FN*FN ; 
	FN = (1-FN)/FN ; 
	Delta_s_test = Delta_s_test*Delta_s_test ; 
	M = ceil(log((1-Delta_s_test)/Delta_s_test/FN)/log(w_s/w_p)/2) ;	% Minimum order of filter. 
	E1_a = w_p/((FN)^(1/2/M)) ; 	% Actualy, this is Omega_c 
    M_Butterworth = M; %Ordinul Butterworth

figure(2); hold on;
subplot(2,1,1); hold on;
plot (omega,(abs(Xb)), 'blue');
plot([omega_p omega_p],[0 1.2], 'black')
plot([omega_s omega_s],[0 1.2], 'black')
%plot([O_c_a O_c_a], [0 1.2])
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black')
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black')
plot([0 3.5],[(Delta_s) (Delta_s)], 'black')
text_2 = 'Ordinul este %d.';
char_2 = sprintf(text_2,M_Butterworth);
text(0,0.5,char_2);
title("Graficul spectrului Butterworth in val abs");
hold off;

subplot(2,1,2); hold on;
plot (omega,db(abs(Xb)), 'blue');
plot([omega_p omega_p],[-500 100], 'black')
plot([omega_s omega_s],[-500 100], 'black')
%plot([O_c_a O_c_a], [0 1.2])
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
text(0,-50,char_2);
title("Graficul spectrului Butterworth in dB");
hold off;

hold off;

figure(3); hold on;

subplot(2,1,1); hold on;
plot (omega, unwrap(angle(Xa))*180/pi, 'red');
title("Faza Cauer in grade");
hold off;

subplot(2,1,2); hold on;
plot (omega, unwrap(angle(Xb))*180/pi, 'blue');
title("Faza Butterworth in grade");
hold off;

hold off;

figure(4); hold on;

subplot(2,1,1); hold on;
plot (omega,(abs(Xa)), 'red');
plot (omega,(abs(Xb)), 'blue');
plot([omega_p omega_p],[0 1.2], 'black')
plot([omega_s omega_s],[0 1.2], 'black')
%plot([O_c_a O_c_a], [0 1.2])
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black')
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black')
plot([0 3.5],[(Delta_s) (Delta_s)], 'black')
title("Graficele spectrelor (Cauer & Butterworth) in val abs");
hold off;

subplot(2,1,2); hold on;
plot (omega,db(abs(Xa)), 'red');
plot (omega,db(abs(Xb)), 'blue');
plot([omega_p omega_p],[-500 100], 'black')
plot([omega_s omega_s],[-500 100], 'black')
%plot([O_c_a O_c_a], [0 1.2])
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
title("Graficele spectrelor (Cauer & Butterworth) in dB");
hold off;

hold off;

figure(5); hold on;

subplot(2,1,1); hold on;
plot (omega, db(abs(Xb)) - db(abs(Xa))); 
title("Diferenta de spectre (Butterworth - Cauer) in dB");
hold off;

subplot(2,1,2); hold on;
plot (omega, unwrap(angle(Xb))*180/pi - unwrap(angle(Xa))*180/pi); 
title("Diferenta de faze (Butterworth - Cauer) in grade");
hold off;

hold off;