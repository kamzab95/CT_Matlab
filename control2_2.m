A1 = [1, 4, 3; 0, 2, 16; 0, -25, -20];
B1 = [-1; 0; 0];
C1 = [-1, 3, 0];
D1 = 0;

A2 = [1, 0, 0; 0, 0, 0; -2, -4, -3];
B2 = [-1; 0; -1];
C2 = [1, 0 , 0];
D2 = 0


calculator('system1', A1, B1, C1, D1)
calculator('system2', A2, B2, C2, D2)

function calculator(name, A, B, C, D)
    disp('--------------');
    disp(name);
    % [Af1, Bf1, Cf1, T1, k1] = ctrbf(A, B, C);
    % poles = eig(A);
    % controllable_poles = eig(Af1(3,3))
    % uncontrollable_poles = eig(Af1(1:2, 1:2)) 
    
    %controllability
    if det(ctrb(A, B)) ~= 0 % or rank(...) == n
        disp('system is controllable');
    else
        disp('system is uncontrollable');
    end
        
    % observability
    ob  = obsv(A, C);
    rank_of_obsv = rank(ob)
    system_order = length(A); % check matrix size
    if rank_of_obsv ~= system_order
        disp('system is unobservable');
    else
        disp('system is observable');
    end
end
