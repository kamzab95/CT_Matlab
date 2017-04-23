A = [0 1 0 0 0; -0.1 -0.5 0 0 0; 0.5 0 0 0 0; 0 0 10 0 0; 0.5 1 0 0 0];
B = [0; 1; 0; 0; 0];
C = [0 0 0 1 0];
D = 0;


control_and_observ('Ex5 s1', A, B, C, D);
[num ,den] = ss2tf(A, B, C, D);
tf1 = tf(num, den)

% b
sys = ss(A, B, C, D);
sys2 = minreal(sys); % pole zero cancelation

[A2, B2, C2, D2] = ssdata(sys2);


% c
control_and_observ('Ex5 s2', A2, B2, C2, D2);
[num2 ,den2] = ss2tf(A2, B2, C2, D2);
tf2 = tf(num2, den2)

% d ???
step(tf2)

% e ???
