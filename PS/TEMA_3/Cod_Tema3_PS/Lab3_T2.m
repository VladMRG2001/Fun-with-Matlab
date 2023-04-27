%TEMA 2(Filtre FIR de ordinul 2)

clear all;
close all;

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

b1 = [1, -2*rho1*cos(phi1), rho1^2];
b2 = [1, -2*rho2*cos(phi1), rho2^2];
b3 = [1, -2*rho3*cos(phi1), rho3^2];
b4 = [1, -2*rho4*cos(phi1), rho4^2];
b5 = [1, -2*rho5*cos(phi1), rho5^2];

H1 = freqz(b1,1,omega);
H2 = freqz(b2,1,omega);
H3 = freqz(b3,1,omega);
H4 = freqz(b4,1,omega);
H5 = freqz(b5,1,omega);

figure(1); hold on;
plot(omega/pi,20*log10(abs(H1)),'red');
plot(omega/pi,20*log10(abs(H2)),'blue');
plot(omega/pi,20*log10(abs(H3)),'yellow');
plot(omega/pi,20*log10(abs(H4)),'green');
plot(omega/pi,20*log10(abs(H5)),'black');
title('Caracteristicile de frecventa in dB - phi1');
hold off;

figure(2); hold on;
plot(omega/pi,(abs(H1)),'red');
plot(omega/pi,(abs(H2)),'blue');
plot(omega/pi,(abs(H3)),'yellow');
plot(omega/pi,(abs(H4)),'green');
plot(omega/pi,(abs(H5)),'black');
title('Caracteristicile de frecventa trasate adimensional - phi1');
hold off;

figure(3); hold on;
plot(omega/pi, 360/(2*pi)*angle(H1),'red');
plot(omega/pi, 360/(2*pi)*angle(H2),'blue');
plot(omega/pi, 360/(2*pi)*angle(H3),'yellow');
plot(omega/pi, 360/(2*pi)*angle(H4),'green');
plot(omega/pi, 360/(2*pi)*angle(H5),'black');
title('Fazele in grade - phi1');
hold off;

H_1 = 1 - 2*rho1*cos(phi1)*z^(-1)+(rho1^2)*(z^(-2));
H_2 = 1 - 2*rho2*cos(phi1)*z^(-1)+(rho2^2)*(z^(-2));
H_3 = 1 - 2*rho3*cos(phi1)*z^(-1)+(rho3^2)*(z^(-2));
H_4 = 1 - 2*rho4*cos(phi1)*z^(-1)+(rho4^2)*(z^(-2));
H_5 = 1 - 2*rho5*cos(phi1)*z^(-1)+(rho5^2)*(z^(-2));

figure(4); hold on;
h1 = pzplot(H_1,'red');
h2 = pzplot(H_2,'blue');
h3 = pzplot(H_3,'yellow');
h4 = pzplot(H_4,'green');
h5 = pzplot(H_5,'black');
title('Diagrama poli-zerouri facuta bine - phi1');
hold off;

b1_b = [1, -2*rho1*cos(phi2), rho1^2];
b2_b = [1, -2*rho2*cos(phi2), rho2^2];
b3_b = [1, -2*rho3*cos(phi2), rho3^2];
b4_b = [1, -2*rho4*cos(phi2), rho4^2];
b5_b = [1, -2*rho5*cos(phi2), rho5^2];

H1_b = freqz(b1_b,1,omega);
H2_b = freqz(b2_b,1,omega);
H3_b = freqz(b3_b,1,omega);
H4_b = freqz(b4_b,1,omega);
H5_b = freqz(b5_b,1,omega);

figure(5); hold on;
plot(omega/pi,20*log10(abs(H1_b)),'red');
plot(omega/pi,20*log10(abs(H2_b)),'blue');
plot(omega/pi,20*log10(abs(H3_b)),'yellow');
plot(omega/pi,20*log10(abs(H4_b)),'green');
plot(omega/pi,20*log10(abs(H5_b)),'black');
title('Caracteristicile de frecventa in dB - phi2');
hold off;

figure(6); hold on;
plot(omega/pi,(abs(H1_b)),'red');
plot(omega/pi,(abs(H2_b)),'blue');
plot(omega/pi,(abs(H3_b)),'yellow');
plot(omega/pi,(abs(H4_b)),'green');
plot(omega/pi,(abs(H5_b)),'black');
title('Caracteristicile de frecventa trasate adimensional - phi2');
hold off;

figure(7); hold on;
plot(omega/pi, 360/(2*pi)*angle(H1_b),'red');
plot(omega/pi, 360/(2*pi)*angle(H2_b),'blue');
plot(omega/pi, 360/(2*pi)*angle(H3_b),'yellow');
plot(omega/pi, 360/(2*pi)*angle(H4_b),'green');
plot(omega/pi, 360/(2*pi)*angle(H5_b),'black');
title('Fazele in grade - phi2');
hold off;

H_1_b = 1 - 2*rho1*cos(phi2)*z^(-1)+(rho1^2)*(z^(-2));
H_2_b = 1 - 2*rho2*cos(phi2)*z^(-1)+(rho2^2)*(z^(-2));
H_3_b = 1 - 2*rho3*cos(phi2)*z^(-1)+(rho3^2)*(z^(-2));
H_4_b = 1 - 2*rho4*cos(phi2)*z^(-1)+(rho4^2)*(z^(-2));
H_5_b = 1 - 2*rho5*cos(phi2)*z^(-1)+(rho5^2)*(z^(-2));

figure(8); hold on;
h1_b = pzplot(H_1_b,'red');
h2_b = pzplot(H_2_b,'blue');
h3_b = pzplot(H_3_b,'yellow');
h4_b = pzplot(H_4_b,'green');
h5_b = pzplot(H_5_b,'black');
title('Diagrama poli-zerouri facuta bine - phi2');
hold off;

%Pentru rho foarte mic, atenuarea se face la omega = 0;
%Se observa simetria fata de axa Oy, astfel po trasa doar pe [0,pi]