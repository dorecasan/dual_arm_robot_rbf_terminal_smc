function control = DAR_SMC_controller_intergrated(inputs)
%% Model parameters
global    L  lamda  Kv M g beta alpha_s
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
dJ1=dJ1_Jacoby(q1,q2,q3,dq1,dq2,dq3);
dJ2=dJ2_Jacoby(q4,q5,q6,dq4,dq5,dq6);

dY1=[sin(theta) -cos(theta) L/2]*[dx; dy; dtheta]-[sin(theta) -cos(theta)]*(J1*[dq1;dq2;dq3]);
dY2=[sin(theta) -cos(theta) -L/2]*[dx; dy; dtheta]-[sin(theta) -cos(theta)]*(J2*[dq4;dq5;dq6]);
% dY1=0; dY2=0;
JB1=[cos(theta) sin(theta)]*J1;
A1=[cos(theta) sin(theta) -Y1];

B1_in=JB1'/(JB1*JB1');
dB1=[-sin(theta) cos(theta)]*dtheta*J1+[cos(theta) sin(theta)]*dJ1;
dA1=[-sin(theta)*dtheta cos(theta)*dtheta -dY1];

JB2=[cos(theta) sin(theta)]*J2;
A2=[cos(theta) sin(theta) -Y2];

B2_in=JB2'/(JB2*JB2');
dB2=[-sin(theta) cos(theta)]*dtheta*J2+[cos(theta) sin(theta)]*dJ2;
dA2=[-sin(theta)*dtheta cos(theta)*dtheta -dY2];

M1=M1_term3(q1,q2,q3);
M2=M2_term3(q4,q5,q6);
M0=M_term3_object;

C31=C31_term1(q1,q2,q3,dq1,dq2,dq3);
C32=C32_term2(q4,q5,q6,dq4,dq5,dq6);

G1= G31(q1,q2,q3);
G2=G32(q4,q5,q6);
G0=[0;M*g;0];
 
B1J=J1'*[cos(theta);sin(theta)];
B2J=J2'*[cos(theta);sin(theta)];
Mterm=[ M1  zeros(3);
        zeros(3) M2];
C=[C31 zeros(3);
   zeros(3) C32];

E1T=J1'*[sin(theta);-cos(theta)];
E2T=J2'*[sin(theta);-cos(theta)];

BT =[B1J E1T zeros(3,1) zeros(3,1);
     zeros(3,1) zeros(3,1) -B2J E2T];

 E = [cos(theta) sin(theta) -cos(theta) sin(theta);
     sin(theta) -cos(theta) -sin(theta) -cos(theta);
     -Y1  L/2 Y2 L/2];
E_inv=E'/(E*E');

A=[B1_in*A1;B2_in*A2];
dA=[B1_in*(dA1-dB1*B1_in*A1);B2_in*(dA2-dB2*B2_in*A2)];

Hp=Mterm*A+BT*E_inv*M0;
Cp=C*A+Mterm*dA;
Gp=[G1;G2]+BT*E_inv*G0;

%% Controller
X=[x;y;theta];
dX=[dx;dy;dtheta];
e=Xd-X;
de=d_Xd-dX;
s=de+lamda*e + beta*(sign(e).*(abs(e).^(alpha_s)));
% z=[e;de;Xd;d_Xd;dd_Xd];
z=[e;de];
r=A*s;
Fcd=E_inv*F0;
fn=Hp*(dd_Xd+lamda*de+ beta*alpha_s*(abs(e).*(alpha_s-1)))+Cp*(d_Xd+lamda*e+ beta*(sign(e).*(abs(e).^(alpha_s))))+Gp; 

tol= fn + Kv*r+ BT*Fcd;
%% Outputs
control=[tol;fn];
end