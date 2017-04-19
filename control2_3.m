A1 = [-5, -2; -3, 0];
B1 = [1; -3];
C1 = [1, -1];
D1 = 0;

control_and_observ('task 3', A1, B1, C1, D1);
poles = eig(A1)
%step(ss(A1, B1, C1, D1))

[Af, Bf, Cf] = ctrbf(A1, B1, C1);
con = eig(Af(2,2))

sys = ss(A1, B1, C1, D1);

K = acker(A1, B1, [-6, -10])

Asf = A1-B1 * K;

[num, den] = ss2tf(Asf, B1, C1, D1)

step(tf(num, den))

poles = eig(Asf)