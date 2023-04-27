function out = Gp_system_ref (u);
global   L M g

q1=u(1); q2=u(2);q3=u(3);
q4 =u(4);q5=u(5);q6=u(6);
x=u(7);y=u(8);theta=u(9);

J1=J1_Jacoby(q1,q2,q3);
J2=J2_Jacoby(q4,q5,q6);

G1= G31(q1,q2,q3);
G2=G32(q4,q5,q6);

Y1=Y1_position(q1,q2,q3,x,y,theta);
Y2=Y2_position(q4,q5,q6,x,y,theta);

B1J=J1'*[cos(theta);sin(theta)];

B2J=J2'*[cos(theta);sin(theta)]; 

E1T=J1'*[sin(theta);-cos(theta)];
E2T=J2'*[sin(theta);-cos(theta)];

BT =[B1J E1T zeros(3,1) zeros(3,1);
     zeros(3,1) zeros(3,1) -B2J E2T];

 E = [cos(theta) sin(theta) -cos(theta) sin(theta);
     sin(theta) -cos(theta) -sin(theta) -cos(theta);
     -Y1  L/2 Y2 L/2];
E_inv=E'/(E*E');
G0=[0;M*g;0];

Gp0=[G1;G2]+BT*E_inv*G0;
Gp=Gp0+0.3*Gp0;
out=Gp;

 
