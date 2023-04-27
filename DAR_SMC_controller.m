function control = DAR_SMC_controller(inputs)
%% Model parameters
global    L  lamda  Kv M g
%% Inputs
q1=inputs(1);q2=inputs(2);q3=inputs(3);
q4=inputs(4);q5=inputs(5);q6=inputs(6);
x=inputs(7);y=inputs(8);theta=inputs(9);
dq1=inputs(10);dq2=inputs(11);dq3=inputs(12);
dq4=inputs(13);dq5=inputs(14);dq6=inputs(15);
dx=inputs(16);dy=inputs(17);dtheta=inputs(18);
Xd=[inputs(19);inputs(20);inputs(21)];
d_Xd=[inputs(22);inputs(23);inputs(24)];
dd_Xd=[inputs(25);inputs(26);inputs(27)];
F0=[inputs(28);inputs(29);inputs(30)];

%% Some initial computations
con_para333;
Y1=Y1_position(q1,q2,q3,x,y,theta);
Y2=Y2_position(q4,q5,q6,x,y,theta);
J1=J1_Jacoby(q1,q2,q3);
J2=J2_Jacoby(q4,q5,q6);
JB1=[cos(theta) sin(theta)]*J1;
A1=[cos(theta) sin(theta) -Y1];
B1_in=JB1'/(JB1*JB1');
JB2=[cos(theta) sin(theta)]*J2;
A2=[cos(theta) sin(theta) -Y2];
B2_in=JB2'/(JB2*JB2');
B1J=J1'*[cos(theta);sin(theta)];
B2J=J2'*[cos(theta);sin(theta)];
E1T=J1'*[sin(theta);-cos(theta)];
E2T=J2'*[sin(theta);-cos(theta)];
BT =[B1J E1T zeros(3,1) zeros(3,1);
     zeros(3,1) zeros(3,1) -B2J E2T];
A=[B1_in*A1;B2_in*A2];

E = [cos(theta) sin(theta) -cos(theta) sin(theta);
     sin(theta) -cos(theta) -sin(theta) -cos(theta);
     -Y1  L/2 Y2 -L/2];
E_inv=E'/(E*E');
%% Controller
X=[x;y;theta];
dX=[dx;dy;dtheta];
e=Xd-X;
de=d_Xd-dX;
s=-de-lamda*e;
r=A*s;

Fcd=E_inv*F0;

tol=-Kv*r+BT*Fcd;
%% Outputs
control=[tol;Fcd];
end