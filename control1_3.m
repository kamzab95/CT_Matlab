A = 10;
B = [1, 10];
C = [1, 10];

D = [1, 1];
E = [1, complex(0.3, 1)];
F = [1, complex(0.3, -1)];

B = conv(A, B);
C = conv(B, C);
Nomin = C;

E = conv(D, E);
F = conv(E, F);
Deno = F;

NTF = tf(Nomin, Deno);

figure(1);
subplot(2,2,1);
bode(NTF);
subplot(2,2,2);
nyquist(NTF);
subplot(2,2,4);
hold on;
nyquist(NTF);
t=0:pi/100:2*pi;
x=sin(t);
y=cos(t);
plot(x,y);
hold off;
axis([-1.5, 1.5, -1.5, 1.5]);
subplot(2,2,3);
rlocus(NTF);

[gain, phase]=margin(NTF);
gain
phase

unstable = 0.2;
stable = 2;

NTF0 = NTF;

NTF = feedback(series(unstable, NTF0), 1);
figure(2);
subplot(2,2,1);
bode(NTF);
subplot(2,2,2);
nyquist(NTF);
subplot(2,2,4);
hold on;
nyquist(NTF);
t=0:pi/100:2*pi;
x=sin(t);
y=cos(t);
plot(x,y);
hold off;
axis([-1.5, 1.5, -1.5, 1.5]);
subplot(2,2,3);
rlocus(NTF);

NTF = feedback(series(stable, NTF0), 1);
figure(3);
subplot(2,2,1);
bode(NTF);
subplot(2,2,2);
nyquist(NTF);
subplot(2,2,4);
hold on;
nyquist(NTF);
t=0:pi/100:2*pi;
x=sin(t);
y=cos(t);
plot(x,y);
hold off;
axis([-1.5, 1.5, -1.5, 1.5]);
subplot(2,2,3);
rlocus(NTF);





