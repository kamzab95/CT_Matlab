A1 = [1, 4, 3; 0, 2, 16; 0, -25, -20];
B1 = [-1; 0; 0];
C1 = [-1, 3, 0];
D1 = 0;

A2 = [1, 0, 0; 0, 0, 0; -2, -4, -3];
B2 = [-1; 0; -1];
C2 = [1, 0 , 0];
D2 = 0;


control_and_observ('system1', A1, B1, C1, D1);
control_and_observ('system2', A2, B2, C2, D2);



% DONE
