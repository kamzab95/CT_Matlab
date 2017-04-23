numG = 1;
denG = conv(conv([1 0], [1 1]), [0.2 1]);
[A1, B1, C1, D1] = tf2ss(numG, denG);
control_and_observ('tf1', A1, B1, C1, D1);

damping = 0.707;
wn = 3;
[num2, den2] = ord2(wn, damping);
dominant = roots(den2);
desiredpoles = [dominant' 10*real(dominant(1))];
%setp 2
K = acker(A1, B1, desiredpoles)

Asf = A1 - B1 * K;
Bsf = B1;
Csf = C1;
Dsf = 0;
[numsf, densf] = ss2tf(Asf, Bsf, Csf, Dsf)

%step 3
t=0:0.01:15;
t1=0:0.01:4.99;
t2=5:0.01:15;

input1 = 1.0*ones(size(t));
input2 = [0.4*zeros(size(t1)) 0.4*ones(size(t2))];

%step 4
figure(1);
subplot(1,3,1);
step(Asf, Bsf, Csf, Dsf, 1, t);
title('Step resp without disturbance');

subplot(1,3,2);
lsim(Asf,[1 0;0 1;0 0], Csf, Dsf, [input1', input2'], t);
title('Step resp with disturbance');
legend('I-1: step response', 'I-2: disturbance signal')

subplot(1,3,3);
step(Asf,[0; 100; 0],Csf,Dsf,1,t);
title('Disturbance response');

%step 5
format short g % change way to display numbers
Ag = A1; % ???????
Bg = B1;
Cg = C1;
Dg = D1;

Ae = [Ag zeros(size(Ag(:,1)));Cg zeros(size(Cg(:,1)))];
Be = [Bg; zeros(size(Bg(1,:)))];
Ce = [Cg zeros(size(Cg(:,1)))];
De = 0;

system_order = length(Ae)
M = ctrb(Ae, Be);
rank_of_M = rank(M)
N = obsv(Ae, Ce);
rank_of_N = rank(N)

desiredpoles_ext = [dominant' 10*real(dominant(1)) 20*real(dominant(1))];
K_e = acker(Ae, Be, desiredpoles_ext)
% K_e = [62 1173 4389 1619]

Asf_ext = Ae - Be * K_e;
B_r = [0; 0; 0; -1];
[numsf_ext, densf_ext]=ss2tf(Asf_ext, B_r, Ce, De);
SYS_ext = tf(numsf_ext, densf_ext);


%step 6
figure(2);
subplot(1,3,1);
step(Asf_ext, B_r, Ce, De, 1, t);
title('Step response without disturbance');
axis([0 15 0 1.2]);
subplot(1,3,2);
lsim(Asf_ext,[0 0;0 1; 0 0; -1 0], Ce, De, [input1' input2'], t);
title('Step response with disturbance');
legend('step resp', 'disturbance signal');
axis([0 15 0 1.2]);
subplot(1,3,3);
step(Asf_ext,[0; 100; 0; 0], Ce, De, 1, t);
title('Distrubance response');





















