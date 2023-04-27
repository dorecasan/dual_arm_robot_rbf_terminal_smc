function out = F_ad_force(u);
global  g L

ddz=[u(1);u(2);u(3)];
x=u(4);y=u(5);theta=u(6);
q1=u(7);q2=u(8);q3=u(9);
q4=u(10);q5=u(11);q6=u(12);

M_ob=u(13);I_ob=u(14);
M0_ad=[M_ob 0 0;0 M_ob 0; 0 0 I_ob];
G0_ad=[0;M_ob*g;0];

Y1=Y1_position(q1,q2,q3,x,y,theta);
Y2=Y2_position(q4,q5,q6,x,y,theta);

E = [cos(theta) sin(theta) -cos(theta) sin(theta);
     sin(theta) -cos(theta) -sin(theta) -cos(theta);
     -Y1  L/2 Y2 -L/2];
E_inv=E'*inv(E*E');

F =E_inv*(M0_ad*ddz+G0_ad);

F_sum=E*F-G0_ad;
%if F_sum(3)<0
   % F_sum(3)=0;
%end
 out=[F;F_sum];