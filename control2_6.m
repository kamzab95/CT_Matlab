% format short g % change way to display numbers
A = [0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1; 7.3809 0 0 0 2 0; 0 -2.1904 0 -2 0 0; 0 0 -3.1904 0 0 0];

b=eig(A)%a checking if the translunar equilibrium
        %point a stable location there is one pole in RHS so  it isn't
system_order = length(A)
B1=[0;0;0;1;0;0];
B2=[0;0;0;0;1;0];
B3=[0;0;0;0;0;1];
%b,c
r1=ctrb(A,B1);
rank_of_r1=rank(r1)%uncontollable 6!=3
r2=ctrb(A,B2);
rank_of_r2=rank(r2)%uncontollable 6!=3
r3=ctrb(A,B3);
rank_of_r3=rank(r3)%uncontollable 6!=2
%d
C=[0,1,0,0,0,0];
D=0;
[NUM,DEN]=ss2tf(A,B2,C,D);
NUM(abs(NUM) < 0.1) = 0;
DEN(abs(DEN) < 0.1) = 0;
tf2 = tf(NUM, DEN)
subplot(1,2,1);
pzmap(tf2);
title('before cancelation');

tf3 = minreal(tf2);
subplot(1,2,2);
pzmap(tf3);
title('after cancelation');

[num3, den3] = tfdata(tf3, 'v');
[A3,B3,C3,D3] = tf2ss(num3, den3);
sys3_order = length(A3);
M3 = ctrb(A3,B3);
rank_M3 = rank(M3);
N3 = obsv(A3,C3);
rank_N3 = rank(N3);

poles = [-1-1i, -1+1i, -10, -10];
K = acker(A3, B3, poles)




