% First enter the transfer function G(s)
numG = 1;
denG = conv ( conv ( [1 0], [1 1] ), [0.2 1] );
% Convert to state-space model
[ Ag, Bg, Cg, Dg ] = tf2ss ( numG, denG );
% Check the controllability and observability of the system
system_order = length(Ag) % equals "3"
M = ctrb(Ag, Bg);
rank_of_M = rank(M) % equals "3"
N = obsv(Ag, Cg);
rank_of_N = rank(N) % equals "3"
% Compute the poles of a second-order system
damping = 0.707;
wn = 3;
[ num2, den2 ] = ord2 (wn, damping);
% Select desired poles to include poles of the second-order system
dominant = roots(den2);
desiredpoles = [dominant' 10 * real( dominant(1) ) ];
% Compute the controller gain K
K = acker (Ag, Bg, desiredpoles);
% Compute the closed-loop state variable feedback system
Asf = Ag - Bg * K; Bsf = Bg; Csf = Cg; Dsf = 0;
[numsf, densf] = ss2tf (Asf, Bsf, Csf, Dsf);
% Select observer poles to be 10 times faster than controller poles
observerpoles = 10 * desiredpoles;
% Compute the observer gain L
L = acker (Ag', Cg', observerpoles);
% Compute the closed-loop system with both controller and observer
Areg = [ (Ag - Bg * K) Bg * K; zeros( size(Ag) ) (Ag - L' * Cg) ];
Breg = [ Bg; zeros( size(Bg) ) ];
Creg = [ Cg zeros( size(Cg) ) ];
Dreg = 0;
[numreg, denreg] = ss2tf ( Areg, Breg, Creg, Dreg );
damp(denreg); 