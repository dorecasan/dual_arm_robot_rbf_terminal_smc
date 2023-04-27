function out = robot_model_sm(u)

%% Model parameters

%% Inputs
q1 =u(1);q2 =u(2);q3 =u(3);q4=u(4);q5=u(5);q6=u(6);
x=u(7);y=u(8);theta=u(9);
dq1 =u(10);dq2 =u(11);dq3 =u(12);dq4=u(13);dq5=u(14);dq6=u(15);
dx=u(16);dy=u(17);dtheta=u(18);
noise = [u(25);u(26);u(27);u(25);u(26);u(27)];
q = [q1;q2;q3;q4;q5;q6];dq=[dq1;dq2;dq3;dq4;dq5;dq6];
z = [x;y;theta];dz=[dx;dy;dtheta];
%% Control input
control = [u(19);u(20);u(21);u(22);u(23);u(24)];

%% Model matrices
Cp  = Cp_system_ref([q ;z ;dq ;dz]);
Gp = Gp_system_ref([q; z]);
term = control - Cp - Gp + noise;

ddz = dyna3_ref([q ;z ;term]);
out = ddz;
%% Outputs
end