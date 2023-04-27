function out = F_force(u);
global  L M g

ddz=[u(1);u(2);u(3)];
x=u(4);y=u(5);theta=u(6);
q1=u(7);q2=u(8);q3=u(9);
q4=u(10);q5=u(11);q6=u(12);
M0=M_term3_object;
G0=[0;M*g;0];
Y1=Y1_position(q1,q2,q3,x,y,theta);
Y2=Y2_position(q4,q5,q6,x,y,theta);

E = [cos(theta) sin(theta) -cos(theta) sin(theta);
     sin(theta) -cos(theta) -sin(theta) -cos(theta);
     -Y1  L/2 Y2 -L/2];
E_inv=E'/(E*E');

F =E_inv*(M0*ddz+G0);
F_sum=E*F-G0;
 out=[F;F_sum];