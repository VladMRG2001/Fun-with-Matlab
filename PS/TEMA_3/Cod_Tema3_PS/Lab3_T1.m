%TEMA 1(Filtre FIR de ordinul 1)

clear all;
close all;

%A

[phi,rho] = PS_Lab_3_Tema_1a(5,9) ; 
rho1=rho(1,1);
rho2=rho(1,2);
rho3=rho(1,3);
rho4=rho(1,4);
rho5=rho(1,5);
omega = linspace(-pi,pi,1000);
j = sqrt(-1);
z = tf('z');

%b1_0 = [1, -c1];
b1 = poly(rho1*exp(j*phi));
b2 = poly(rho2*exp(j*phi));
b3 = poly(rho3*exp(j*phi));
b4 = poly(rho4*exp(j*phi));
b5 = poly(rho5*exp(j*phi));

H1 = freqz(b1,1,omega);
H2 = freqz(b2,1,omega);
H3 = freqz(b3,1,omega);
H4 = freqz(b4,1,omega);
H5 = freqz(b5,1,omega);

figure(1); hold on;
freqz(b1,1,omega); %Graficele pentru H1
title('Graficele pentru H1');
hold off;

figure(2); hold on;
plot(omega/pi,20*log10(abs(H1)),'red');
plot(omega/pi,20*log10(abs(H2)),'blue');
plot(omega/pi,20*log10(abs(H3)),'yellow');
plot(omega/pi,20*log10(abs(H4)),'green');
plot(omega/pi,20*log10(abs(H5)),'black');
title('Caracteristicile de frecventa in dB');
hold off;

figure(3); hold on;
plot(omega/pi,(abs(H1)),'red');
plot(omega/pi,(abs(H2)),'blue');
plot(omega/pi,(abs(H3)),'yellow');
plot(omega/pi,(abs(H4)),'green');
plot(omega/pi,(abs(H5)),'black');
title('Caracteristicile de frecventa trasate adimensional');
hold off;

figure(4); hold on;
plot(omega/pi, 360/(2*pi)*angle(H1),'red');
plot(omega/pi, 360/(2*pi)*angle(H2),'blue');
plot(omega/pi, 360/(2*pi)*angle(H3),'yellow');
plot(omega/pi, 360/(2*pi)*angle(H4),'green');
plot(omega/pi, 360/(2*pi)*angle(H5),'black');
title('Fazele in grade');
hold off;

figure(5); hold on;
zplane(b1,1)
zplane(b2,1);
zplane(b3,1);
zplane(b4,1);
zplane(b5,1);
title('Diagrama poli-zerouri cu functia din lab (nu iese bine...)');
hold off;

c1 = rho1 * exp(j*phi);
c2 = rho2 * exp(j*phi);
c3 = rho3 * exp(j*phi);
c4 = rho4 * exp(j*phi);
c5 = rho5 * exp(j*phi);
H_1 = 1 - c1 * z^(-1); %3.7
H_2 = 1 - c2 * z^(-1); %3.7
H_3 = 1 - c3 * z^(-1); %3.7
H_4 = 1 - c4 * z^(-1); %3.7
H_5 = 1 - c5 * z^(-1); %3.7

figure(6); hold on;
h1 = pzplot(H_1,'red');
h2 = pzplot(H_2,'blue');
h3 = pzplot(H_3,'yellow');
h4 = pzplot(H_4,'green');
h5 = pzplot(H_5,'black');
title('Diagrama poli-zerouri facuta mai bine');
hold off;

%Se observa ca, cu cat rho e mai mare, cu atat zeroul corespunzator e mai
%aproape de cercul unitate
%phi personalizat e 1.3497 -> phi/pi = 0.42
%Se vede pe toate graficele cum valoarea minima pe exa oy este in jurul
%aceste valori
%Mai mult, se verifica faptul ca, cu cat rho e mai mare, cu atat atenuarea
%e mai mare la omega = phi.

%B

phi_b = PS_Lab_3_Tema_1b(5,9) ; %Noul unghi phi

b1_b = poly(rho1*exp(j*phi_b));
b2_b = poly(rho2*exp(j*phi_b));
b3_b = poly(rho3*exp(j*phi_b));
b4_b = poly(rho4*exp(j*phi_b));
b5_b = poly(rho5*exp(j*phi_b));

H1_b = freqz(b1_b,1,omega);
H2_b = freqz(b2_b,1,omega);
H3_b = freqz(b3_b,1,omega);
H4_b = freqz(b4_b,1,omega);
H5_b = freqz(b5_b,1,omega);

figure(7); hold on;
plot(omega/pi,20*log10(abs(H1_b)),'red');
plot(omega/pi,20*log10(abs(H2_b)),'blue');
plot(omega/pi,20*log10(abs(H3_b)),'yellow');
plot(omega/pi,20*log10(abs(H4_b)),'green');
plot(omega/pi,20*log10(abs(H5_b)),'black');
title('Caracteristicile de frecventa in dB - B');
hold off;

figure(8); hold on;
plot(omega/pi,(abs(H1_b)),'red');
plot(omega/pi,(abs(H2_b)),'blue');
plot(omega/pi,(abs(H3_b)),'yellow');
plot(omega/pi,(abs(H4_b)),'green');
plot(omega/pi,(abs(H5_b)),'black');
title('Caracteristicile de frecventa trasate adimensional -B');
hold off;

figure(9); hold on;
plot(omega/pi, 360/(2*pi)*angle(H1_b),'red');
plot(omega/pi, 360/(2*pi)*angle(H2_b),'blue');
plot(omega/pi, 360/(2*pi)*angle(H3_b),'yellow');
plot(omega/pi, 360/(2*pi)*angle(H4_b),'green');
plot(omega/pi, 360/(2*pi)*angle(H5_b),'black');
title('Fazele in grade - B');
hold off;

c1_b = rho1 * exp(j*phi_b);
c2_b = rho2 * exp(j*phi_b);
c3_b = rho3 * exp(j*phi_b);
c4_b = rho4 * exp(j*phi_b);
c5_b = rho5 * exp(j*phi_b);
H_1_b = 1 - c1_b * z^(-1); %3.7
H_2_b = 1 - c2_b * z^(-1); %3.7
H_3_b = 1 - c3_b * z^(-1); %3.7
H_4_b = 1 - c4_b * z^(-1); %3.7
H_5_b = 1 - c5_b * z^(-1); %3.7

figure(10); hold on;
h1_b = pzplot(H_1_b,'red');
h2_b = pzplot(H_2_b,'blue');
h3_b = pzplot(H_3_b,'yellow');
h4_b = pzplot(H_4_b,'green');
h5_b = pzplot(H_5_b,'black');
title('Diagrama poli-zerouri facuta mai bine - B');
hold off;

%Aceleasi observatii ca la punctul A, dar pt phi_b