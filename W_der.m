function out=W_der(u)
global   node c b_n gama lamda T_temple  W1 W2 W3 W4 W5 W6 Wd anpha beta alpha_s


q1=u(1);q2=u(2);q3=u(3);
q4=u(4);q5=u(5);q6=u(6);
x=u(7);y=u(8);theta=u(9);
dq1=u(10);dq2=u(11);dq3=u(12);
dq4=u(13);dq5=u(14);dq6=u(15);
dx=u(16);dy=u(17);dtheta=u(18);
Xd=[u(19);u(20);u(21)];
d_Xd=[u(22);u(23);u(24)];
dd_Xd=[u(25);u(26);u(27)];
t=u(28);

con_para333;

Y1=Y1_position(q1,q2,q3,x,y,theta);
Y2=Y2_position(q4,q5,q6,x,y,theta);

J1=J1_Jacoby(q1,q2,q3);
J2=J2_Jacoby(q4,q5,q6);
JB1=[cos(theta) sin(theta)]*J1;
A1=JB1'/(JB1*JB1')*[cos(theta) sin(theta) -Y1];
JB2=[cos(theta) sin(theta)]*J2;
A2=JB2'/(JB2*JB2')*[cos(theta) sin(theta) -Y2];
A =[A1;A2];

X=[x;y;theta];
dX=[dx;dy;dtheta];
e=Xd-X;
de=d_Xd-dX;
s=-de-lamda*e - beta*(sign(e).*(abs(e).^(alpha_s)));

 z=[e;de];
 h1=zeros(node,1);
 h2=zeros(node,1);
 h3=zeros(node,1);
 h4=zeros(node,1);
 h5=zeros(node,1);
 h6=zeros(node,1);

h_sum1=0;
h_sum2=0;
h_sum3=0;
h_sum4=0;
h_sum5=0;
h_sum6=0;

 
hr1=zeros(node,1);
hr2=zeros(node,1);
hr3=zeros(node,1);
hr4=zeros(node,1);
hr5=zeros(node,1);
hr6=zeros(node,1);


 for j=1:node

h1(j)=exp(-norm(z-c(:,j))^2/(b_n*b_n));
h2(j)=exp(-norm(z-c(:,j))^2/(b_n*b_n));
h3(j)=exp(-norm(z-c(:,j))^2/(b_n*b_n));
h4(j)=exp(-norm(z-c(:,j))^2/(b_n*b_n));
h5(j)=exp(-norm(z-c(:,j))^2/(b_n*b_n));
h6(j)=exp(-norm(z-c(:,j))^2/(b_n*b_n));


h_sum1=h_sum1+h1(j);
h_sum2=h_sum2+h2(j);
h_sum3=h_sum3+h3(j);
h_sum4=h_sum4+h4(j);
h_sum5=h_sum5+h5(j);
h_sum6=h_sum6+h6(j);

 end
 for j=1:node
  hr1(j)=h1(j)/h_sum1;
  hr2(j)=h2(j)/h_sum2;
  hr3(j)=h3(j)/h_sum3;
  hr4(j)=h4(j)/h_sum4;
  hr5(j)=h5(j)/h_sum5;
  hr6(j)=h6(j)/h_sum6; 

 end
r=A*s;
if t==0
    W1=Wd(1)*ones(node,1);
    W2=Wd(2)*ones(node,1);
    W3=Wd(3)*ones(node,1);
    W4=Wd(4)*ones(node,1);
    W5=Wd(5)*ones(node,1);
    W6=Wd(6)*ones(node,1);

else
    W1=-T_temple*gama*(h1*r(1)-anpha*norm(r)*W1)+W1;
    W2=-T_temple*gama*(h2*r(2)-anpha*norm(r)*W2)+W2;
    W3=-T_temple*gama*(h3*r(3)-anpha*norm(r)*W3)+W3;
    W4=-T_temple*gama*(h4*r(4)-anpha*norm(r)*W4)+W4;
    W5=-T_temple*gama*(h5*r(5)-anpha*norm(r)*W5)+W5;
    W6=-T_temple*gama*(h6*r(6)-anpha*norm(r)*W6)+W6;

      
end
fw1=W1'*hr1;
fw2=W2'*hr2;
fw3=W3'*hr3;
fw4=W4'*hr4;
fw5=W5'*hr5;
fw6=W6'*hr6;

fn=[fw1;fw2;fw3;fw4;fw5;fw6];

out=fn;
