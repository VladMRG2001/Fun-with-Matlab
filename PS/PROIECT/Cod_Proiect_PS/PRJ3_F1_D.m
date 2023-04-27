%FAZA 1 (Rezolvarea PPFTI cu filtre Butterworth)

clc
clear all
close all

%D

[omega_p,omega_s,Delta_p,Ts] = PS_PRJ_3_Faza_1a(5,9) ;
Delta_p_d = Delta_p;
Delta_s_d = Delta_p;
omega_p_d = omega_p/pi;
omega_s_d = omega_s/pi;

omega = linspace(0,pi,1000);

Delta_p_d1 = Delta_p_d/2;
Delta_p_d2 = Delta_p_d;
Delta_p_d3 = 3*Delta_p_d/2;
Delta_p_d4 = 2*Delta_p_d;
Delta_s_d1 = Delta_s_d/2;
Delta_s_d2 = Delta_s_d;
Delta_s_d3 = 3*Delta_s_d/2;
Delta_s_d4 = 2*Delta_s_d;

    w_p = 2*tan(omega_p_d*pi/2)/Ts ; 	% Compute Omega_p.
	w_s = 2*tan(omega_s_d*pi/2)/Ts ; 	% Compute Omega_s.
    
	FN_1 = 1-Delta_p_d1; 		% Actually, this is M_p. 
	FN_1 = FN_1*FN_1; 
	FN_1 = (1-FN_1)/FN_1; 
    
	Delta_s_d_1 = Delta_s_d1*Delta_s_d1; 
	M = ceil(log((1-Delta_s_d_1)/Delta_s_d_1/FN_1)/log(w_s/w_p)/2);	% Minimum order of filter.  
    M_11 = M; %Ordinul pt D_p_1 % D_s_1
    
	Delta_s_d_2 = Delta_s_d2*Delta_s_d2 ; 
	M = ceil(log((1-Delta_s_d_2)/Delta_s_d_2/FN_1)/log(w_s/w_p)/2) ;
    M_12 = M; %Ordinul pt D_p_1 % D_s_2

	Delta_s_d_3 = Delta_s_d3*Delta_s_d3 ; 
	M = ceil(log((1-Delta_s_d_3)/Delta_s_d_3/FN_1)/log(w_s/w_p)/2) ;
    M_13 = M; %Ordinul pt D_p_1 % D_s_3
    
    Delta_s_d_4 = Delta_s_d4*Delta_s_d4 ; 
	M = ceil(log((1-Delta_s_d_4)/Delta_s_d_4/FN_1)/log(w_s/w_p)/2) ;
    M_14 = M; %Ordinul pt D_p_1 % D_s_4
    
    FN_2 = 1-Delta_p_d2; 		% Actually, this is M_p. 
	FN_2 = FN_2*FN_2; 
	FN_2 = (1-FN_2)/FN_2; 
    
	M = ceil(log((1-Delta_s_d_1)/Delta_s_d_1/FN_2)/log(w_s/w_p)/2);	% Minimum order of filter.  
    M_21 = M; %Ordinul pt D_p_2 % D_s_1
     
	M = ceil(log((1-Delta_s_d_2)/Delta_s_d_2/FN_2)/log(w_s/w_p)/2) ;
    M_22 = M; %Ordinul pt D_p_2 % D_s_2

	M = ceil(log((1-Delta_s_d_3)/Delta_s_d_3/FN_2)/log(w_s/w_p)/2) ;
    M_23 = M; %Ordinul pt D_p_2 % D_s_3
    
	M = ceil(log((1-Delta_s_d_4)/Delta_s_d_4/FN_2)/log(w_s/w_p)/2) ;
    M_24 = M; %Ordinul pt D_p_2 % D_s_4
    
    FN_3 = 1-Delta_p_d3; 		% Actually, this is M_p. 
	FN_3 = FN_3*FN_3; 
	FN_3 = (1-FN_3)/FN_3; 
    
	M = ceil(log((1-Delta_s_d_1)/Delta_s_d_1/FN_3)/log(w_s/w_p)/2);	% Minimum order of filter.  
    M_31 = M; %Ordinul pt D_p_3 % D_s_1
    
	M = ceil(log((1-Delta_s_d_2)/Delta_s_d_2/FN_3)/log(w_s/w_p)/2) ;
    M_32 = M; %Ordinul pt D_p_3 % D_s_2

	M = ceil(log((1-Delta_s_d_3)/Delta_s_d_3/FN_3)/log(w_s/w_p)/2) ;
    M_33 = M; %Ordinul pt D_p_3 % D_s_3
     
	M = ceil(log((1-Delta_s_d_4)/Delta_s_d_4/FN_3)/log(w_s/w_p)/2) ;
    M_34 = M; %Ordinul pt D_p_3 % D_s_4
    
    FN_4 = 1-Delta_p_d4; 		% Actually, this is M_p. 
	FN_4 = FN_4*FN_4; 
	FN_4 = (1-FN_4)/FN_4; 
     
	M = ceil(log((1-Delta_s_d_1)/Delta_s_d_1/FN_4)/log(w_s/w_p)/2);	% Minimum order of filter.  
    M_41 = M; %Ordinul pt D_p_4 % D_s_1
    
	M = ceil(log((1-Delta_s_d_2)/Delta_s_d_2/FN_4)/log(w_s/w_p)/2) ;
    M_42 = M; %Ordinul pt D_p_4 % D_s_2

	M = ceil(log((1-Delta_s_d_3)/Delta_s_d_3/FN_4)/log(w_s/w_p)/2) ;
    M_43 = M; %Ordinul pt D_p_4 % D_s_3
    
	M = ceil(log((1-Delta_s_d_4)/Delta_s_d_4/FN_4)/log(w_s/w_p)/2) ;
    M_44 = M; %Ordinul pt D_p_4 % D_s_4
    
figure(7); hold on;

[Bd_1,Ad_1] = But_FTI(omega_p_d,omega_s_d,Delta_p_d1,Delta_s_d1,Ts) ;
Xd_1=freqz (Bd_1, Ad_1, omega); 
subplot(4,4,1); hold on;
plot (omega, db(abs(Xd_1)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_1 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_1 = sprintf(text_d_1,Delta_p_d1,Delta_s_d1);
text(0,-200,char_d_1);
title ("Spectrul"); 
hold off;
subplot(4,4,5); hold on;
plot(omega, unwrap(angle(Xd_1)));
text_d_2 = 'Ordinul este %d.';
char_d_2 = sprintf(text_d_2,M_11);
text(0,-10,char_d_2);
title ("Faza"); 
hold off;

[Bd_2,Ad_2] = But_FTI(omega_p_d,omega_s_d,Delta_p_d1,Delta_s_d2,Ts) ;
Xd_2=freqz (Bd_2, Ad_2, omega); 
subplot(4,4,2); hold on;
plot (omega, db(abs(Xd_2)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_3 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_3 = sprintf(text_d_3,Delta_p_d1,Delta_s_d2);
text(0,-200,char_d_3);
title ("Spectrul"); 
hold off;
subplot(4,4,6); hold on;
plot(omega, unwrap(angle(Xd_2)));
text_d_4 = 'Ordinul este %d.';
char_d_4 = sprintf(text_d_4,M_12);
text(0,-10,char_d_4);
title ("Faza"); 
hold off;

[Bd_3,Ad_3] = But_FTI(omega_p_d,omega_s_d,Delta_p_d1,Delta_s_d3,Ts) ;
Xd_3=freqz (Bd_3, Ad_3, omega); 
subplot(4,4,3); hold on;
plot (omega, db(abs(Xd_3)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_5 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_5 = sprintf(text_d_5,Delta_p_d1,Delta_s_d3);
text(0,-200,char_d_5);
title ("Spectrul"); 
hold off;
subplot(4,4,7); hold on;
plot(omega, unwrap(angle(Xd_3)));
text_d_6 = 'Ordinul este %d.';
char_d_6 = sprintf(text_d_6,M_13);
text(0,-10,char_d_6);
title ("Faza"); 
hold off;

[Bd_4,Ad_4] = But_FTI(omega_p_d,omega_s_d,Delta_p_d1,Delta_s_d4,Ts) ;
Xd_4=freqz (Bd_4, Ad_4, omega); 
subplot(4,4,4); hold on;
plot (omega, db(abs(Xd_4)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_7 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_7 = sprintf(text_d_7,Delta_p_d1,Delta_s_d4);
text(0,-200,char_d_7);
title ("Spectrul"); 
hold off;
subplot(4,4,8); hold on;
plot(omega, unwrap(angle(Xd_4)));
text_d_8 = 'Ordinul este %d.';
char_d_8 = sprintf(text_d_8,M_14);
text(0,-10,char_d_8);
title ("Faza"); 
hold off;

[Bd_5,Ad_5] = But_FTI(omega_p_d,omega_s_d,Delta_p_d2,Delta_s_d1,Ts) ;
Xd_5=freqz (Bd_5, Ad_5, omega); 
subplot(4,4,9); hold on;
plot (omega, db(abs(Xd_5)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_9 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_9 = sprintf(text_d_9,Delta_p_d2,Delta_s_d1);
text(0,-200,char_d_9);
title ("Spectrul"); 
hold off;
subplot(4,4,13); hold on;
plot(omega, unwrap(angle(Xd_5)));
text_d_10 = 'Ordinul este %d.';
char_d_10 = sprintf(text_d_10,M_21);
text(0,-10,char_d_10);
title ("Faza"); 
hold off;

[Bd_6,Ad_6] = But_FTI(omega_p_d,omega_s_d,Delta_p_d2,Delta_s_d2,Ts) ;
Xd_6=freqz (Bd_6, Ad_6, omega); 
subplot(4,4,10); hold on;
plot (omega, db(abs(Xd_6)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_11 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_11 = sprintf(text_d_11,Delta_p_d2,Delta_s_d2);
text(0,-200,char_d_11);
title ("Spectrul"); 
hold off;
subplot(4,4,14); hold on;
plot(omega, unwrap(angle(Xd_6)));
text_d_12 = 'Ordinul este %d.';
char_d_12 = sprintf(text_d_12,M_22);
text(0,-10,char_d_12);
title ("Faza"); 
hold off;

[Bd_7,Ad_7] = But_FTI(omega_p_d,omega_s_d,Delta_p_d2,Delta_s_d3,Ts) ;
Xd_7=freqz (Bd_7, Ad_7, omega); 
subplot(4,4,11); hold on;
plot (omega, db(abs(Xd_7)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_13 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_13 = sprintf(text_d_13,Delta_p_d2,Delta_s_d3);
text(0,-200,char_d_13);
title ("Spectrul"); 
hold off;
subplot(4,4,15); hold on;
plot(omega, unwrap(angle(Xd_7)));
text_d_14 = 'Ordinul este %d.';
char_d_14 = sprintf(text_d_14,M_23);
text(0,-10,char_d_14);
title ("Faza"); 
hold off;

[Bd_8,Ad_8] = But_FTI(omega_p_d,omega_s_d,Delta_p_d2,Delta_s_d4,Ts) ;
Xd_8=freqz (Bd_8, Ad_8, omega); 
subplot(4,4,12); hold on;
plot (omega, db(abs(Xd_8)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_15 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_15 = sprintf(text_d_15,Delta_p_d2,Delta_s_d4);
text(0,-200,char_d_15);
title ("Spectrul"); 
hold off;
subplot(4,4,16); hold on;
plot(omega, unwrap(angle(Xd_8)));
text_d_16 = 'Ordinul este %d.';
char_d_16 = sprintf(text_d_16,M_24);
text(0,-10,char_d_16);
title ("Faza"); 
hold off;

hold off;

figure(8); hold on;

[Bd_9,Ad_9] = But_FTI(omega_p_d,omega_s_d,Delta_p_d3,Delta_s_d1,Ts) ;
Xd_9=freqz (Bd_9, Ad_9, omega); 
subplot(4,4,1); hold on;
plot (omega, db(abs(Xd_9)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_17 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_17 = sprintf(text_d_17,Delta_p_d3,Delta_s_d1);
text(0,-200,char_d_17);
title ("Spectrul"); 
hold off;
subplot(4,4,5); hold on;
plot(omega, unwrap(angle(Xd_9)));
text_d_18 = 'Ordinul este %d.';
char_d_18 = sprintf(text_d_18,M_31);
text(0,-10,char_d_18);
title ("Faza"); 
hold off;

[Bd_10,Ad_10] = But_FTI(omega_p_d,omega_s_d,Delta_p_d3,Delta_s_d2,Ts) ;
Xd_10=freqz (Bd_10, Ad_10, omega); 
subplot(4,4,2); hold on;
plot (omega, db(abs(Xd_10)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_19 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_19 = sprintf(text_d_19,Delta_p_d3,Delta_s_d2);
text(0,-200,char_d_19);
title ("Spectrul"); 
hold off;
subplot(4,4,6); hold on;
plot(omega, unwrap(angle(Xd_10)));
text_d_20 = 'Ordinul este %d.';
char_d_20 = sprintf(text_d_20,M_32);
text(0,-10,char_d_20);
title ("Faza"); 
hold off;

[Bd_11,Ad_11] = But_FTI(omega_p_d,omega_s_d,Delta_p_d3,Delta_s_d3,Ts) ;
Xd_11=freqz (Bd_11, Ad_11, omega); 
subplot(4,4,3); hold on;
plot (omega, db(abs(Xd_11)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_21 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_21 = sprintf(text_d_21,Delta_p_d3,Delta_s_d3);
text(0,-200,char_d_21);
title ("Spectrul"); 
hold off;
subplot(4,4,7); hold on;
plot(omega, unwrap(angle(Xd_11)));
text_d_22 = 'Ordinul este %d.';
char_d_22= sprintf(text_d_16,M_33);
text(0,-10,char_d_22);
title ("Faza"); 
hold off;

[Bd_12,Ad_12] = But_FTI(omega_p_d,omega_s_d,Delta_p_d3,Delta_s_d4,Ts) ;
Xd_12=freqz (Bd_12, Ad_12, omega); 
subplot(4,4,4); hold on;
plot (omega, db(abs(Xd_12)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_23 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_23 = sprintf(text_d_23,Delta_p_d3,Delta_s_d4);
text(0,-200,char_d_23);
title ("Spectrul"); 
hold off;
subplot(4,4,8); hold on;
plot(omega, unwrap(angle(Xd_12)));
text_d_24 = 'Ordinul este %d.';
char_d_24 = sprintf(text_d_24,M_34);
text(0,-10,char_d_24);
title ("Faza"); 
hold off;

[Bd_13,Ad_13] = But_FTI(omega_p_d,omega_s_d,Delta_p_d4,Delta_s_d1,Ts) ;
Xd_13=freqz (Bd_13, Ad_13, omega); 
subplot(4,4,9); hold on;
plot (omega, db(abs(Xd_13)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_25 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_25 = sprintf(text_d_25,Delta_p_d4,Delta_s_d1);
text(0,-200,char_d_25);
title ("Spectrul"); 
hold off;
subplot(4,4,13); hold on;
plot(omega, unwrap(angle(Xd_13)));
text_d_26 = 'Ordinul este %d.';
char_d_26 = sprintf(text_d_26,M_41);
text(0,-10,char_d_26);
title ("Faza"); 
hold off;

[Bd_14,Ad_14] = But_FTI(omega_p_d,omega_s_d,Delta_p_d4,Delta_s_d2,Ts) ;
Xd_14=freqz (Bd_14, Ad_14, omega); 
subplot(4,4,10); hold on;
plot (omega, db(abs(Xd_14)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_27 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_27 = sprintf(text_d_27,Delta_p_d4,Delta_s_d2);
text(0,-200,char_d_27);
title ("Spectrul"); 
hold off;
subplot(4,4,14); hold on;
plot(omega, unwrap(angle(Xd_14)));
text_d_28 = 'Ordinul este %d.';
char_d_28 = sprintf(text_d_28,M_42);
text(0,-10,char_d_28);
title ("Faza"); 
hold off;

[Bd_15,Ad_15] = But_FTI(omega_p_d,omega_s_d,Delta_p_d4,Delta_s_d3,Ts) ;
Xd_15=freqz (Bd_15, Ad_15, omega); 
subplot(4,4,11); hold on;
plot (omega, db(abs(Xd_15)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_29 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_29 = sprintf(text_d_29,Delta_p_d4,Delta_s_d3);
text(0,-200,char_d_29);
title ("Spectrul"); 
hold off;
subplot(4,4,15); hold on;
plot(omega, unwrap(angle(Xd_15)));
text_d_30 = 'Ordinul este %d.';
char_d_30 = sprintf(text_d_30,M_43);
text(0,-10,char_d_30);
title ("Faza"); 
hold off;

[Bd_16,Ad_16] = But_FTI(omega_p_d,omega_s_d,Delta_p_d4,Delta_s_d4,Ts) ;
Xd_16=freqz (Bd_16, Ad_16, omega); 
subplot(4,4,12); hold on;
plot (omega, db(abs(Xd_16)));
plot([omega_p omega_p],[-400 50], 'black')
plot([omega_s omega_s],[-400 50], 'black')
plot([0 3.5],[db(1+Delta_p_d) db(1+Delta_p_d)], 'black')
plot([0 3.5],[db(1-Delta_p_d) db(1-Delta_p_d)], 'black')
plot([0 3.5],[db(Delta_s_d) db(Delta_s_d)], 'black')
text_d_31 = 'Delta_p = %.3f & Delta_s = %.3f.';
char_d_31 = sprintf(text_d_31,Delta_p_d4,Delta_s_d4);
text(0,-200,char_d_31);
title ("Spectrul"); 
hold off;
subplot(4,4,16); hold on;
plot(omega, unwrap(angle(Xd_16)));
text_d_32 = 'Ordinul este %d.';
char_d_32 = sprintf(text_d_32,M_44);
text(0,-10,char_d_32);
title ("Faza"); 
hold off;

hold off;
