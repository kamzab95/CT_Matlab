function control_and_observ(name, A, B, C, D)
    disp('--------------');
    disp(name);
    % [Af1, Bf1, Cf1, T1, k1] = ctrbf(A, B, C);
    % poles = eig(A);
    % controllable_poles = eig(Af1(3,3))
    % uncontrollable_poles = eig(Af1(1:2, 1:2)) 
    
    %controllability
    system_order = length(A); % check matrix size
    if rank(ctrb(A, B)) == system_order % or rank(...) == n
        disp('system is controllable');
    else
        disp('system is uncontrollable');
    end
        
    % observability
    ob  = obsv(A, C);
    rank_of_obsv = rank(ob);
    if rank_of_obsv ~= system_order
        disp('system is unobservable');
    else
        disp('system is observable');
    end
    disp('--------------');
end

