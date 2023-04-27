%FAZA 1 (Rezolvarea PPFTI cu filtre Butterworth)

clc
clear all
close all

%A

[omega_p,omega_s,Delta_p,Ts] = PS_PRJ_3_Faza_1a(5,9) ;
omega_p_test = omega_p/pi; %Trebuie normat incat sa apartina (0,1)
omega_s_a = omega_s/pi; %Trebuie normat incat sa apartina (0,1)
Delta_s = Delta_p;
Delta_s_test = Delta_s;

omega = linspace(0,pi,1000);

[Ba,Aa] = But_FTI(omega_p/pi,omega_s/pi,Delta_p,Delta_s,Ts) ;
%O_p_a = (2/Ts)*(tan(omega_p_test/2));
%O_s_a = (2/Ts)*(tan(omega_s_a/2));

    w_p = 2*tan(omega_p_test*pi/2)/Ts ; 	% Compute Omega_p.
	w_s = 2*tan(omega_s_a*pi/2)/Ts ; 	% Compute Omega_s.
	FN = 1-Delta_p ; 		% Actually, this is M_p. 
	FN = FN*FN ; 
	FN = (1-FN)/FN ; 
	Delta_s_test = Delta_s_test*Delta_s_test ; 
	M = ceil(log((1-Delta_s_test)/Delta_s_test/FN)/log(w_s/w_p)/2) ;	% Minimum order of filter. 
	E1_a = w_p/((FN)^(1/2/M)) ; 	% Actualy, this is Omega_c 
    Ma = M; %Ordinul pt 1a
    
Xa=freqz (Ba, Aa, omega); 
figure(1); hold on;

subplot(2,1,1); hold on;
plot (omega, (abs(Xa)), 'red');

ABSXa = abs(Xa);
tol = 10^-1;
E1_a = 0.707; %Asa e la Butterworth
O_c = omega(abs(ABSXa-E1_a) < tol);
O_c_a = mean(O_c);

plot([omega_p omega_p],[0 1.5], 'black')
plot([omega_s omega_s],[0 1.5], 'black')
plot([O_c_a O_c_a], [0 1.5], 'yellow')
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black')
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black')
plot([0 3.5],[(Delta_s) (Delta_s)], 'black')
formatSpec1 = 'Ts este %.3f.';
str1 = sprintf(formatSpec1,Ts);
text(2,1.3,str1);
formatSpec2 = 'Ma este %d.';
str2 = sprintf(formatSpec2,Ma);
text(2,1.2,str2);
title("Graficul spectrului Xa in val absoluta");
hold off;

subplot(2,1,2); hold on;
plot (omega, db(abs(Xa)), 'red');
plot([(omega_p) (omega_p)],[-400 200], 'black')
plot([(omega_s) (omega_s)],[-400 200], 'black')
plot([(O_c_a) (O_c_a)], [-400 200], 'yellow')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
text(2,75,str1);
text(2,25,str2);
title("Graficul spectrului Xa in dB");
hold off;

hold off; 

%B

[omega_p,omega_s,Delta_p,Ts] = PS_PRJ_3_Faza_1a(5,9) ;
omega_p_test = omega_p/pi; %Trebuie normat incat sa apartina (0,1)
omega_s_b = omega_s/pi;
Delta_s = Delta_p;
Delta_s_test = Delta_s;

[Bb,Ab] = But_FTI_1b(omega_p/pi,omega_s/pi,Delta_p,Delta_s,Ts) ;
O_p_b = (1/Ts)*(tan(omega_p_test/2));
O_s_b = (1/Ts)*(tan(omega_s_b/2));

    w_p = tan(omega_p_test*pi/2)/Ts ; 	% Compute Omega_p.
	w_s = tan(omega_s_b*pi/2)/Ts ; 	% Compute Omega_s.
	FN = 1-Delta_p ; 		% Actually, this is M_p. 
	FN = FN*FN ; 
	FN = (1-FN)/FN ; 
	Delta_s_test = Delta_s_test*Delta_s_test ; 
	M = ceil(log((1-Delta_s_test)/Delta_s_test/FN)/log(w_s/w_p)/2) ;	% Minimum order of filter. 
	E1_b = w_p/((FN)^(1/2/M)) ; 	% Actualy, this is Omega_c 
    Mb = M; %Ordinul pt 1b
    
figure(2); hold on;

subplot(2,1,1); hold on;
Xb=freqz (Bb, Ab, omega); 
plot (omega, abs(Xb), 'blue');

ABSXb = abs(Xb);
tol = 10^-1;
E1_b = 0.707; %Asa e la Butterworth
O_c = omega(abs(ABSXb-E1_b) < tol);
O_c_b = mean(O_c);

%plot([w_p*pi w_p*pi],[y(1) y(2)])
%plot([w_s*pi w_s*pi],[y(1) y(2)])
plot([O_c_b O_c_b], [0 1.5], 'yellow')
plot([0 3.5],[(1+Delta_p) (1+Delta_p)], 'black')
plot([0 3.5],[(1-Delta_p) (1-Delta_p)], 'black')
plot([0 3.5],[(Delta_s) (Delta_s)], 'black')
formatSpec3 = 'Ts este %.3f.';
str3 = sprintf(formatSpec3,Ts);
text(2,1.3,str3);
formatSpec4 = 'Mb este %d.';
str4 = sprintf(formatSpec4,Mb);
text(2,1.2,str4);
title("Graficul spectrului Xb in val absoluta");
hold off;

subplot(2,1,2); hold on;
plot (omega, db(abs(Xb)), 'blue');

%plot([w_p*pi w_p*pi],[y(1) y(2)])
%plot([w_s*pi w_s*pi],[y(1) y(2)])
plot([O_c_b O_c_b], [-600 100], 'yellow')
plot([0 3.5],[db(1+Delta_p) db(1+Delta_p)], 'black')
plot([0 3.5],[db(1-Delta_p) db(1-Delta_p)], 'black')
plot([0 3.5],[db(Delta_s) db(Delta_s)], 'black')
text(2,75,str3);
text(2,25,str4);
title("Graficul spectrului Xb in dB");
hold off;

hold off;

figure(3); hold on;

subplot(2,1,1); hold on;
plot (omega, unwrap(angle(Xa))*180/pi, 'red'); %faza 1a
title ("Faza graficului de la Xa in grade");
hold off;

subplot(2,1,2); hold on;
plot (omega, unwrap(angle(Xb))*180/pi, 'blue'); %faza 1b
title ("Faza graficului Xb in grade");
hold off;

hold off;

norma_err_spectru = norm( (db(abs(Xb)) - db(abs(Xa))) / db(abs(Xa)));
norma_err_faza = norm( (unwrap(angle(Xb))*180/pi - unwrap(angle(Xa))*180/pi) / (unwrap(angle(Xa))*180/pi) );

figure(4); hold on;

subplot(2,1,1); hold on;
plot (omega, (db(abs(Xb)) - db(abs(Xa))));
title ("Diferenta de spectru a graficelor Xb - Xa");
formatSpec5 = 'Norma dif de spectru este %.3f.';
str5 = sprintf(formatSpec5,norma_err_spectru);
text(1.5,0,str5);
hold off;

subplot(2,1,2); hold on;
plot (omega, (unwrap(angle(Xb))*180/pi - unwrap(angle(Xa))*180/pi));
title ("Diferenta de faza a graficelor Xb - Xa");
formatSpec6 = 'Norma dif de faza este %.3f.';
str6 = sprintf(formatSpec6,norma_err_faza);
text(1.5,-400,str6);
hold off; 

hold off;