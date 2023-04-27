%TEMA 5 (PRODUCE RANDN UN SEMNAL GAUSSIAN?)
clc
clear all
close all

figure(1); hold on;
title("Graficul densitatii de probabilitate si histograma (N)");
N_personalizat = PS_Lab_1_Tema_5(5,10) ;
N=N_personalizat; %N=5455
y = randn(1, N);%matrice de 1xN generata random
%miu = mean(y);%media matricei generate anterior
%var_random = var(y);
%sigma = sqrt(var_random);
sigma=1; miu=0;
f = @(x)(1/(sigma*sqrt(2*pi))*exp(-((x-miu).^2)/(2*sigma^2))); 
%functia din laborator

interval = linspace(-3,3,N); %limitele inf si sup ale intervalului ce trebuie esantionat

plot(interval, f(interval)*N, 'red'); %graficul densitatii de probabilitate
h = hist(y,round(N/10)); %histograma matricei generate

edges=linspace(-3,3,round(N/10));
bar(edges,h*(N/100)); 

hold off; 

N15=round(N*1.5); N2=N*2; N3=N*3; N4=N*4; N5=N*5; N10=N*10;

figure(2); hold on;
title("Graficul densitatii de probabilitate si histograma (N*1.5)");
y15 = randn(1, N15);
plot(interval, f(interval)*N15, 'red'); %graficul densitatii de probabilitate
h15 = hist(y15,round(N/10)); %histograma matricei generate

edges=linspace(-3,3,round(N/10));
bar(edges,h15*(N/100)); 

figure(3); hold on;
title("Graficul densitatii de probabilitate si histograma (N*2)");
y2 = randn(1, N2);
plot(interval, f(interval)*N2, 'red'); %graficul densitatii de probabilitate
h2 = hist(y2,round(N/10)); %histograma matricei generate

edges=linspace(-3,3,round(N/10));
bar(edges,h2*(N/100)); 

figure(4); hold on;
title("Graficul densitatii de probabilitate si histograma (N*3)");
y3 = randn(1, N3);
plot(interval, f(interval)*N3, 'red'); %graficul densitatii de probabilitate
h3 = hist(y3,round(N/10)); %histograma matricei generate

edges=linspace(-3,3,round(N/10));
bar(edges,h3*(N/100)); 

figure(5); hold on;
title("Graficul densitatii de probabilitate si histograma (N*4)");
y4 = randn(1, N4);
plot(interval, f(interval)*N4, 'red'); %graficul densitatii de probabilitate
h4 = hist(y4,round(N/10)); %histograma matricei generate

edges=linspace(-3,3,round(N/10));
bar(edges,h4*(N/100)); 

figure(6); hold on;
title("Graficul densitatii de probabilitate si histograma (N*5)");
y5 = randn(1, N5);
plot(interval, f(interval)*N5, 'red'); %graficul densitatii de probabilitate
h5 = hist(y5,round(N/10)); %histograma matricei generate

edges=linspace(-3,3,round(N/10));
bar(edges,h5*(N/100)); 

figure(7); hold on;
title("Graficul densitatii de probabilitate si histograma (N*10)");
y10 = randn(1, N10);
plot(interval, f(interval)*N10, 'red'); %graficul densitatii de probabilitate
h10 = hist(y10,round(N/10)); %histograma matricei generate

edges=linspace(-3,3,round(N/10));
bar(edges,h10*(N/100)); 

%In concluzie, randn produce un semnal Gaussian