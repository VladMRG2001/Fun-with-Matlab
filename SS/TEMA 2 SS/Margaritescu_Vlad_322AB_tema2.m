P_tan = date_indiv_SS(141);
omeg = logspace(-2, 2, 1000)';

%1

figure(1);
nyquist(P_tan, omeg);

s=allmargin(-P_tan);
inters1 = 1./s.GainMargin;

s=allmargin(P_tan);
inters2 = -1./s.GainMargin;

nyquist(P_tan * 2,omeg);

s=allmargin(P_tan * 2);
inters3 = -1./s.GainMargin;

figure(2);
nyquist(P_tan * exp(-1i * pi / 4), omeg);
[R, I] = nyquist(P_tan * exp(-1i * pi / 4), omeg);
hold on;
nyquist(P_tan, omeg);

inters4 = min(R);

H=P_tan * tf([1],[1 0]);
figure(3);
nyquist(H, omeg);
[R, I] = nyquist(H, omeg);

asimpt = -0.0619;

%2

P_tan0=0.3436/4.549;
K_1=100/P_tan0;
T_1 = -rand;
C_1 = tf(K_1, [T_1 1]);

figure(4);
nyquist(P_tan * C_1,omeg);

K_2=100/P_tan0;
T_2=rand;
C_2 = K_2 * tf([1 1], [T_2 1]);

figure(5);
nyquist(P_tan * C_2,omeg);

%3

figure(6);
bode(P_tan, omeg);
[a1,d1] = bode(P_tan, omeg);
amp1=a1(500)*7;
def1=d1(500)+45;

figure(7);
bode(3*P_tan, omeg);
[a2,d2] = bode(3*P_tan, omeg);
amp2=a2(500)*7;
def2=d2(500)+45;

figure(8);
bode(exp(-1i * pi / 6) * P_tan, omeg);
[a3,d3] = bode(exp(-1i * pi / 6) * P_tan, omeg);
amp3=a3(500)*7;
def3=d3(500)+45;

figure(9);
bode(P_tan*100, omeg);

omeg_1=3.51;
omeg_2=1.94;

%4

K_3=1325;
w_3=0.20;
C_3 = tf (K_3 * w_3, [1 w_3]);
figure (10);
bode(P_tan * C_3,omeg);
total=omeg_2*omeg_2;
A_4=rand;
B_4=total/A_4;
C_4 = 100 * tf(B_4 * [1 A_4], A_4 * [1 B_4]);

save('tema_141.mat', 'inters1', 'inters2', 'inters3', 'inters4', 'asimpt', 'K_1', 'T_1', 'K_2', 'T_2', 'amp1', 'def1', 'amp2', 'def2', 'amp3', 'def3', 'omeg_1', 'omeg_2', 'K_3', 'w_3', 'A_4', 'B_4');
