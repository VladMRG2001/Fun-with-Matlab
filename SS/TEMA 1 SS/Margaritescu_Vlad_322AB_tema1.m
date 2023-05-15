%1)
P_tan = date_indiv_SS(141);
P_tan.num{1};
P_tan.den{1};
H = [1.7443, 4.5487, 0; 1.0000, 3.7301, 0; 0, 1.7443, 4.5487];
H1 = [1.7443]; 
det1 = det(H1);
H2 = [1.7443, 4.5487; 1.0000, 3.7301];
det2 = det(H2);
H3 = H;
det3 = det (H3);
numitor = [1.0000, 1.7443, 3.7301, 4.5487];
poli = roots(numitor);

%2)
t = (0:0.01:180)';
h_pondere = impulse(tf(P_tan.num{1},P_tan.den{1}),t);
rasp_trp = step(tf(P_tan.num{1},P_tan.den{1}),t);
trp = double(t>=0);
convolutie = conv(trp,h_pondere)*0.01;
rasp_conv = convolutie(1:18001);
dif = rasp_trp - rasp_conv;
norm_dif = norm(dif,inf);

%3)
x0 = [1 1 1];
rasp_tot = lsim(ss_ci(P_tan),trp,t,x0);
rasp_perm = trp * evalfr(P_tan,0);
rasp_tran = rasp_tot - rasp_perm;
rasp_libr = initial(ss_ci(P_tan),x0,t);
rasp_fort = rasp_tot - rasp_libr;
figure (1);
plot(rasp_fort);
figure (2);
plot(rasp_trp);
figure (3);
plot(rasp_libr);

%4)
stepinfo(P_tan);
tc1 = 0.8991;
tt1 = 20.0029;
tv1 = 2.3021;
sr1 = 40.6769;

figure (4);
plot(step(P_tan));

num = [1];
den = [10 1];
P_aux = tf(num,den);

stepinfo(P_tan * P_aux);

tc2 = 21.8050;
tt2 = 39.9559;
tv2 = 73.2222;
sr2 = 0;

figure (5);
plot(step(P_tan * P_aux));

stepinfo(P_tan * (tf('s') + 1));

tc3 = 0.5218;
tt3 = 23.0566;
tv3 = 1.6443;
sr3 = 98.4126;

plot(step(P_tan * (tf('s') + 1)));

save('tema_141.mat', 'H', 'det1', 'det2','det3', 'poli', 'h_pondere', 'rasp_trp', 'rasp_conv', 'norm_dif', 'rasp_tot', 'rasp_perm', 'rasp_tran', 'rasp_libr', 'rasp_fort', 'tc1', 'tt1', 'tv1', 'sr1','tc2','tt2', 'tv2', 'sr2', 'tc3', 'tt3', 'tv3', 'sr3');




