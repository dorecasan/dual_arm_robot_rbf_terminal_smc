function out = dyna3_ref(u)
global  L
%u=[1;2;3;4;5;5;6;7;8;9;1;2;3;4;5;6];
q1=u(1); q2=u(2);q3=u(3);
q4 =u(4);q5=u(5);q6=u(6);
x=u(7);y=u(8);theta=u(9);
M1=M1_term3(q1,q2,q3);
M2=M2_term3(q4,q5,q6);
M0=M_term3_object;
J1=J1_Jacoby(q1,q2,q3);
B1J=J1'*[cos(theta);sin(theta)];
J2=J2_Jacoby(q4,q5,q6);
B2J=J2'*[cos(theta);sin(theta)];
Y1=Y1_position(q1,q2,q3,x,y,theta);
Y2=Y2_position(q4,q5,q6,x,y,theta);
JB1=[cos(theta) sin(theta)]*J1;
A1=JB1'/(JB1*JB1')*[cos(theta) sin(theta) -Y1];
JB2=[cos(theta) sin(theta)]*J2;  
A2=JB2'/(JB2*JB2')*[cos(theta) sin(theta) -Y2];
 
E1T=J1'*[sin(theta);-cos(theta)];
E2T=J2'*[sin(theta);-cos(theta)];

A=[A1;A2];

Mterm=[ M1  zeros(3);
        zeros(3) M2];
BT =[B1J E1T zeros(3,1) zeros(3,1);
     zeros(3,1) zeros(3,1) -B2J E2T];

E = [cos(theta) sin(theta) -cos(theta) sin(theta);
     sin(theta) -cos(theta) -sin(theta) -cos(theta);
     -Y1  L/2 Y2 L/2];
E_inv=E'/(E*E');
 

Hp0=Mterm*A+BT*E_inv*M0;
Hp=Hp0 + 0.3*Hp0;


TU=[u(10);u(11);u(12);u(13);u(14);u(15)];
out=Hp\TU;