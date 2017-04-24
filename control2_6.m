format short g % change way to display numbers

A= [0,0,0,1,0,0;
    0,0,0,1,0,0;
    0,0,0,0,0,1;
    7.3809,0,0,0,2,0;
    0,-2.1904,0,-2,0,0;
    0,0,-3.1904,0,0,0]
B=[0,0,0;
    0,0,0;
    0,0,0;
    1,0,0;
    0,1,0;
    0,0,1]

b=eig(A)%a checking if the translunar equilibrium
        %point a stable location there is one pole in RHS so  it isn't
B1=[0;0;0;1;0;0];
B2=[0;0;0;0;1;0];
B3=[0;0;0;0;0;1];
%b,c
system_order = length(A)
r1=ctrb(A,B1);
rank_of_r1=rank(r1)%uncontollable 6!=3
r2=ctrb(A,B2);
rank_of_r2=rank(r2)%uncontollable 6!=3
r3=ctrb(A,B3);
rank_of_r3=rank(r3)%uncontollable 6!=3
%d

C=[0,1,0,0,0,0];
D=0;

[NUM,DEN]=ss2tf(A,B2,C,D);
tf2 = tf(NUM, DEN)

s = tf('s');
new_tf = (s^4 + 5.724*10^(-16)*s^3 - 4.191*s^2+1.826*10^(-15)*s-23.55)/(s^6 + 4.441*10^(-16)*s^5+2*s^4 + 2.958*10^(-15)*s^3 - 19.97*s^2 + 4.916*10^(-15)*s-51.58)
[num0, den0] = tfdata(new_tf, 'v')
[A0, B0, C0, D0] = tf2ss(num0, den0)
