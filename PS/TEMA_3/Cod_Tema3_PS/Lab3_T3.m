%TEMA 3(Filtre IIR autoregresive)

clear all;
close all;

%A

[phi1,rho] = PS_Lab_3_Tema_1a(5,9) ; 
phi2 = PS_Lab_3_Tema_1b(5,9) ; 

rho1=rho(1,1);
rho2=rho(1,2);
rho3=rho(1,3);
rho4=rho(1,4);
rho5=rho(1,5);
omega = linspace(-pi,pi,1000);
j = sqrt(-1);
z = tf('z');

a1 = [1, -2*rho1*cos(phi1), rho1^2];
a2 = [1, -2*rho2*cos(phi1), rho2^2];
a3 = [1, -2*rho3*cos(phi1), rho3^2];
a4 = [1, -2*rho4*cos(phi1), rho4^2];
a5 = [1, -2*rho5*cos(phi1), rho5^2];

G1 = freqz(1,a1,omega);
G2 = freqz(1,a2,omega);
G3 = freqz(1,a3,omega);
G4 = freqz(1,a4,omega);
G5 = freqz(1,a5,omega);

figure(1); hold on;
plot(omega/pi,20*log10(abs(G1)),'red');
plot(omega/pi,20*log10(abs(G2)),'blue');
plot(omega/pi,20*log10(abs(G3)),'yellow');
plot(omega/pi,20*log10(abs(G4)),'green');
plot(omega/pi,20*log10(abs(G5)),'black');
title('IIR - Caracteristicile de frecventa in dB - phi1');
hold off;

figure(2); hold on;
plot(omega/pi,(abs(G1)),'red');
plot(omega/pi,(abs(G2)),'blue');
plot(omega/pi,(abs(G3)),'yellow');
plot(omega/pi,(abs(G4)),'green');
plot(omega/pi,(abs(G5)),'black');
title('IIR - Caracteristicile de frecventa trasate adimensional - phi1');
hold off;

figure(3); hold on;
plot(omega/pi, 360/(2*pi)*angle(G1),'red');
plot(omega/pi, 360/(2*pi)*angle(G2),'blue');
plot(omega/pi, 360/(2*pi)*angle(G3),'yellow');
plot(omega/pi, 360/(2*pi)*angle(G4),'green');
plot(omega/pi, 360/(2*pi)*angle(G5),'black');
title('IIR - Fazele in grade - phi1');
hold off;

G_1 = 1/(1 - 2*rho1*cos(phi1)*z^(-1)+(rho1^2)*(z^(-2)));
G_2 = 1/(1 - 2*rho2*cos(phi1)*z^(-1)+(rho2^2)*(z^(-2)));
G_3 = 1/(1 - 2*rho3*cos(phi1)*z^(-1)+(rho3^2)*(z^(-2)));
G_4 = 1/(1 - 2*rho4*cos(phi1)*z^(-1)+(rho4^2)*(z^(-2)));
G_5 = 1/(1 - 2*rho5*cos(phi1)*z^(-1)+(rho5^2)*(z^(-2)));

figure(4); hold on;
g1 = pzplot(G_1,'red');
g2 = pzplot(G_2,'blue');
g3 = pzplot(G_3,'yellow');
g4 = pzplot(G_4,'green');
g5 = pzplot(G_5,'black');
title('IIR - Diagrama poli-zerouri facuta bine - phi1');
hold off;

%se observa cum graficele amplitudinii in dB sunt oglindite fata de FIR2

a1_b = [1, -2*rho1*cos(phi2), rho1^2];
a2_b = [1, -2*rho2*cos(phi2), rho2^2];
a3_b = [1, -2*rho3*cos(phi2), rho3^2];
a4_b = [1, -2*rho4*cos(phi2), rho4^2];
a5_b = [1, -2*rho5*cos(phi2), rho5^2];

G1_b = freqz(1,a1_b,omega);
G2_b = freqz(1,a2_b,omega);
G3_b = freqz(1,a3_b,omega);
G4_b = freqz(1,a4_b,omega);
G5_b = freqz(1,a5_b,omega);

figure(5); hold on;
plot(omega/pi,20*log10(abs(G1_b)),'red');
plot(omega/pi,20*log10(abs(G2_b)),'blue');
plot(omega/pi,20*log10(abs(G3_b)),'yellow');
plot(omega/pi,20*log10(abs(G4_b)),'green');
plot(omega/pi,20*log10(abs(G5_b)),'black');
title('IIR - Caracteristicile de frecventa in dB - phi2');
hold off;

figure(6); hold on;
plot(omega/pi,(abs(G1_b)),'red');
plot(omega/pi,(abs(G2_b)),'blue');
plot(omega/pi,(abs(G3_b)),'yellow');
plot(omega/pi,(abs(G4_b)),'green');
plot(omega/pi,(abs(G5_b)),'black');
title('IIR - Caracteristicile de frecventa trasate adimensional - phi2');
hold off;

figure(7); hold on;
plot(omega/pi, 360/(2*pi)*angle(G1_b),'red');
plot(omega/pi, 360/(2*pi)*angle(G2_b),'blue');
plot(omega/pi, 360/(2*pi)*angle(G3_b),'yellow');
plot(omega/pi, 360/(2*pi)*angle(G4_b),'green');
plot(omega/pi, 360/(2*pi)*angle(G5_b),'black');
title('IIR - Fazele in grade - phi2');
hold off;

G_1_b = 1/(1 - 2*rho1*cos(phi2)*z^(-1)+(rho1^2)*(z^(-2)));
G_2_b = 1/(1 - 2*rho2*cos(phi2)*z^(-1)+(rho2^2)*(z^(-2)));
G_3_b = 1/(1 - 2*rho3*cos(phi2)*z^(-1)+(rho3^2)*(z^(-2)));
G_4_b = 1/(1 - 2*rho4*cos(phi2)*z^(-1)+(rho4^2)*(z^(-2)));
G_5_b = 1/(1 - 2*rho5*cos(phi2)*z^(-1)+(rho5^2)*(z^(-2)));

figure(8); hold on;
g1_b = pzplot(G_1_b,'red');
g2_b = pzplot(G_2_b,'blue');
g3_b = pzplot(G_3_b,'yellow');
g4_b = pzplot(G_4_b,'green');
g5_b = pzplot(G_5_b,'black');
title('IIR - Diagrama poli-zerouri facuta bine - phi2');
hold off;

%B

%(G(1)/db)=0 -> G(1) = 1 la omega = 0;
a = [1, -2*rho.*cos(phi1), rho.^2];

[~,omega1] = freqz(1,a); %noua grila de frecvente (doar [0,pi])

G_1 = 1./((1-rho.*exp(j.*phi1)).*(1-rho.*exp(-j.*phi1)));
G = 1./(1-2.*rho.*cos(phi1).*exp(j*omega1).^(-1)+rho.^2.*exp(j*omega1).^(-2));
G_n=G./G_1;

G_n_1=G_n(:,1);
G_n_2=G_n(:,2);
G_n_3=G_n(:,3);
G_n_4=G_n(:,4);
G_n_5=G_n(:,5);

figure(9); hold on;
plot(omega1/pi,abs(G_n_1),'red');
plot(omega1/pi,abs(G_n_2),'blue');
plot(omega1/pi,abs(G_n_3),'yellow');
plot(omega1/pi,abs(G_n_4),'green');
plot(omega1/pi,abs(G_n_5),'black');
ylabel('Amplitudine');
xlabel('Pulsatia normata (*pi)');
title('Filtrul normat G(1)/db=0');
hold off;

figure(10); hold on;
plot(omega1/pi,20*log10(abs(G_n_1)),'red');
plot(omega1/pi,20*log10(abs(G_n_2)),'blue');
plot(omega1/pi,20*log10(abs(G_n_3)),'yellow');
plot(omega1/pi,20*log10(abs(G_n_4)),'green');
plot(omega1/pi,20*log10(abs(G_n_5)),'black');
ylabel('Amplitudine in dB');
xlabel('Pulsatia normata (*pi)');
title('Filtrul normat cu amplitudinea in dB');
hold off;

%Normarea imparte tot graficul trasat cu amplitudine adimensionala 
%la valoarea din omega = 0.