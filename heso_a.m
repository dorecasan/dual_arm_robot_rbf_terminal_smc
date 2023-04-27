 function out =heso_a(x)
% function out =heso_a
global para dX0 X0 Xf dXf ddX0 ddXf
  % para=0.537;

  para=x;
 con_para333;
a01=X0(1);
a02=X0(2);
a03=X0(3);

a11=dX0(1);
a12=dX0(2);
a13=dX0(3);

a21=ddX0(1)/2;
a22=ddX0(2)/2;
a23=ddX0(3)/2;

a31=(20*(Xf(1)-X0(1))-(8*dXf(1)+12*dX0(1))*para-(3*ddX0(1)-ddXf(1))*para^2)/(2*para^3);
a32=(20*(Xf(2)-X0(2))-(8*dXf(2)+12*dX0(2))*para-(3*ddX0(2)-ddXf(2))*para^2)/(2*para^3);
a33=(20*(Xf(3)-X0(3))-(8*dXf(3)+12*dX0(3))*para-(3*ddX0(3)-ddXf(3))*para^2)/(2*para^3);

a41=(30*(X0(1)-Xf(1))+(14*dXf(1)+16*dX0(1))*para+(3*ddX0(1)-2*ddXf(1))*para^2)/(2*para^4);
a42=(30*(X0(2)-Xf(2))+(14*dXf(2)+16*dX0(2))*para+(3*ddX0(2)-2*ddXf(1))*para^2)/(2*para^4);
a43=(30*(X0(3)-Xf(3))+(14*dXf(3)+16*dX0(3))*para+(3*ddX0(3)-2*ddXf(3))*para^2)/(2*para^4);

a51=(12*(Xf(1)-X0(1))-6*(dXf(1)+dX0(1))*para-(ddX0(1)-ddXf(1))*para^2)/(2*para^5);
a52=(12*(Xf(2)-X0(2))-6*(dXf(2)+dX0(2))*para-(ddX0(2)-ddXf(2))*para^2)/(2*para^5);
a53=(12*(Xf(3)-X0(3))-6*(dXf(3)+dX0(3))*para-(ddX0(3)-ddXf(3))*para^2)/(2*para^5);

out=[a01;a11;a21;a31;a41;a51;a02;a12;a22;a32;a42;a52;a03;a13;a23;a33;a43;a53];


