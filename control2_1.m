s = tf('s');
G = 1/(s*(s+1)*(0.2*s+1));
%K0 = regulator % result from regulator.m
K0 = regulator_mod(G,10,10) % default regulator settings

%a
%20 times the real part of the dominant closed-loop poles
%10 times as great as the desired closed-loop poles
Ka = regulator_mod(G,20,10) 

%b
%4 times the real part of the dominant closed-loop poles
%10 times as great as the desired closed-loop poles
Kb = regulator_mod(G,4,10) 

%c
%10 times the real part of the dominant closed-loop poles
%20 times as great as the desired closed-loop poles
Kc = regulator_mod(G,10,20) 

%d
%10 times the real part of the dominant closed-loop poles
%4 times as great as the desired closed-loop poles
Kd = regulator_mod(G,10,4) 


G0 = feedback(G, tf(K0, 1)); 
subplot(2,2,1);
step(G0); title('G0');

Ga = feedback(G, tf(Ka, 1))
subplot(2,2,2);
step(Ga); title('Ga');

Gb = feedback(G, tf(Kb, 1))
subplot(2,2,3);
step(Gb); title('Gb');

Gc = feedback(G, tf(Kc, 1))
subplot(2,2,4);
step(Gc); title('Gc');