s = tf('s');
sys = 8/((s+0.01)*(s+0.2)*(s+1));
rlocus(sys);
sys
sisotool(sys);

%Ziuta = 0.707;
%W = 1/(Ziuta*5);
%W
%sgrid(Ziuta, W);