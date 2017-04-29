[num, den]=zp2tf([],[-0.01 -0.2 -1],8);
sys=tf(num,den);
state=ss(sys);

[A,B,C,D]=ssdata(sys)
cont=ctrb(state);
det1=det(cont)% det = 64 - system is controllable

obs=obsv(state);
det2=det(obs)% det = -8 - system is observable

damp=0.707;
w=0.2829;
t=18.7;
[num2,den2]= ord2(w,damp);
sys2=tf(num2,den2);

[x,d]=pzmap(sys2)

pol=[-0.2-0.2001i;-0.2+0.2001i;-15]

K=acker(A,B,pol)

[NUM,DEN]=ss2tf(A-B*K,B,C,D);
sysx=tf(NUM,DEN);
step(sysx)
stepinfo(sysx)
