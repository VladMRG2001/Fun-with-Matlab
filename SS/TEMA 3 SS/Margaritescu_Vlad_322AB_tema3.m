[~, P_gir] = date_indiv_SS(141);

a=1;

[X, Y, N, M] = eucl_Youla(P_gir.num{1}, P_gir.den{1}, a);

a1=3;

Q1 = tf([0 0 1],[0 1 1]);

C1 = (X+M*Q1)/(Y-N*Q1);

C1 = tf(ss(C1,'min'));

T1 = (P_gir*C1)/(1+P_gir*C1);

T1.num{1}/T1.den{1};

eucl_Youla(T1.num{1}, T1.den{1}, a1);

stepinfo(T1.num{1}/T1.den{1});

a2=7;

Q2 = tf([0 1 1],[1 1 1]);

C2 = (X+M*Q2)/(Y-N*Q2);

C2 = tf(ss(C2,'min'));

T2 = (P_gir*C2)/(1+P_gir*C2);

T2.num{1}/T2.den{1};

eucl_Youla(T2.num{1}, T2.den{1}, a2);

stepinfo(T2.num{1}/T2.den{1});

save('tema_141.mat', 'a1', 'Q1', 'a2', 'Q2');