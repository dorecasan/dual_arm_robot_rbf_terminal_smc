function out = Cp_system_ref (u);
global   L 
q1=u(1); q2=u(2);q3=u(3);
q4 =u(4);q5=u(5);q6=u(6);
x=u(7);y=u(8);theta=u(9);
dq1=u(10); dq2=u(11);dq3=u(12);
dq4 =u(13);dq5=u(14);dq6=u(15);
dx=u(16);dy=u(17);dtheta=u(18);

J1=J1_Jacoby(q1,q2,q3);
J2=J2_Jacoby(q4,q5,q6);

dJ1=dJ1_Jacoby(q1,q2,q3,dq1,dq2,dq3);
dJ2=dJ2_Jacoby(q4,q5,q6,dq4,dq5,dq6);

C31=C31_term1(q1,q2,q3,dq1,dq2,dq3);
C32=C32_term2(q4,q5,q6,dq4,dq5,dq6);

Y1=Y1_position(q1,q2,q3,x,y,theta);
Y2=Y2_position(q4,q5,q6,x,y,theta);

%dY1=[sin(theta) -cos(theta) L/2]*[dx; dy; dtheta]-[sin(theta) -cos(theta)]*(J1*[dq1;dq2;dq3]);
%dY2=[sin(theta) -cos(theta) -L/2]*[dx; dy; dtheta]-[sin(theta) -cos(theta)]*(J2*[dq4;dq5;dq6]);
dY1=0;dY2=0;
JB1=[cos(theta) sin(theta)]*J1;
B1_in=JB1'/(JB1*JB1');
A1=[cos(theta) sin(theta) -Y1];
dB1=[-sin(theta) cos(theta)]*dtheta*J1+[cos(theta) sin(theta)]*dJ1;
dA1=[-sin(theta)*dtheta cos(theta)*dtheta -dY1];

JB2=[cos(theta) sin(theta)]*J2; 
B2_in=JB2'/(JB2*JB2');
A2=[cos(theta) sin(theta) -Y2];
dB2=[-sin(theta) cos(theta)]*dtheta*J2+[cos(theta) sin(theta)]*dJ2;
dA2=[-sin(theta)*dtheta cos(theta)*dtheta -dY2];
M1=M1_term3(q1,q2,q3);
M2=M2_term3(q4,q5,q6);

Mterm=[ M1  zeros(3);
        zeros(3) M2];
    
C=[C31 zeros(3);
    zeros(3) C32];
A=[B1_in*A1;B2_in*A2];
dA=[B1_in*(dA1-dB1*B1_in*A1);B2_in*(dA2-dB2*B2_in*A2)];
 
Cp0=C*A+Mterm*dA;
Cp=Cp0+0.3*Cp0;

 out=Cp*[dx;dy;dtheta];
 
