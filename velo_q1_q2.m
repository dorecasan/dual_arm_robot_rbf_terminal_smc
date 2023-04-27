function out = velo_q1_q2(u)
q1=u(1); q2=u(2);q3=u(3);
q4 =u(4);q5=u(5);q6=u(6);
x=u(7);y=u(8);theta=u(9);
dx=u(10);dy=u(11);dtheta=u(12);

J1=J1_Jacoby(q1,q2,q3);
J2=J2_Jacoby(q4,q5,q6);

Y1 = Y1_position(q1,q2,q3,x,y,theta);
Y2=Y2_position(q4,q5,q6,x,y,theta);

JB1=[cos(theta) sin(theta)]*J1;
A1=JB1'/(JB1*JB1')*[cos(theta) sin(theta) -Y1];

JB2=[cos(theta) sin(theta)]*J2;
A2=JB2'/(JB2*JB2')*[cos(theta) sin(theta) -Y2];

A =[A1;A2];
dq=A*[dx;dy;dtheta];

out=dq;