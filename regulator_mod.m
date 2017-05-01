function K = regulator_mod(tr_f, t_r_part, t_des_poles)
    format short g
    % First enter the transfer function G(s)
    [numG, denG] = tfdata(tr_f, 'v');
    %numG = 1;
    %denG = conv ( conv ( [1 0], [1 1] ), [0.2 1] );
    % Convert to state-space model
    [ Ag, Bg, Cg, Dg ] = tf2ss ( numG, denG );
    % Check the controllability and observability of the system
    %control_and_observ('reg_mod',Ag, Bg, Cg, Dg);
    % Compute the poles of a second-order system
    damping = 0.707;
    wn = 3;
    [ num2, den2 ] = ord2 (wn, damping);
    % Select desired poles to include poles of the second-order system
    dominant = roots(den2);
    desiredpoles = [dominant' t_r_part * real( dominant(1) ) ];
    % Compute the controller gain K
    K = acker (Ag, Bg, desiredpoles);
    % Compute the closed-loop state variable feedback system
    Asf = Ag - Bg * K; Bsf = Bg; Csf = Cg; Dsf = 0;
    [numsf, densf] = ss2tf (Asf, Bsf, Csf, Dsf);
    % Select observer poles to be 10 times faster than controller poles
    observerpoles = t_des_poles * desiredpoles;
    % Compute the observer gain L
    L = acker (Ag', Cg', observerpoles);
    % Compute the closed-loop system with both controller and observer
    Areg = [ (Ag - Bg * K) Bg * K; zeros( size(Ag) ) (Ag - L' * Cg) ];
    Breg = [ Bg; zeros( size(Bg) ) ];
    Creg = [ Cg zeros( size(Cg) ) ];
    Dreg = 0;
    [numreg, denreg] = ss2tf ( Areg, Breg, Creg, Dreg );
    %damp(denreg); 
end