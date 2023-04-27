%TEMA 2 (ESANTIONARE)
clc
clear all
close all

%A - fisierele audio din Tabelul 1
load sunet_a.mat;
load sunet_i.mat;
load sunet_s.mat;
load xilo.mat;

%A - durata semnalelor %help audioinfo
info_a = audioinfo('sunet_a.au'); 
durata_a= info_a.Duration;
info_i = audioinfo('sunet_i.au'); 
durata_i= info_i.Duration;
info_s = audioinfo('sunet_s.au'); 
durata_s= info_s.Duration;
info_xilo = audioinfo('xilo.au'); 
durata_xilo= info_xilo.Duration;

%B
omega=4; %pulsatia
Ts=1; %perioada de esantionare
M=20; %lungimea suportului semnalului discretizat
a=0;
b=M;

t= a: Ts:b-1;
n= linspace(a,b-1,100);
xa=sin(omega*t); %semnalul xa(t)
xn=sin(omega*n*Ts);
figure(1)
title("Grafice 2.b");
hold on;
stem (t, xa);
plot (n, xn);

%C
%Valori din Lab 
omega=3.14/3;
Ts=1;
M=13;

t=linspace(0,M-1); %suportul continuu 
xa=sin(omega*t); %semnalul xa(t)

n=linspace(0,M-1,M/Ts); %suportul cu esantioane
xn=sin(n*omega*Ts); %Semnalul x[n]

figure(2); 
hold on;
title("Grafice 2.c - xa(t) si x[n]");
plot(t,xa); %grafic continuu
stem(n,xn); %grafic discret