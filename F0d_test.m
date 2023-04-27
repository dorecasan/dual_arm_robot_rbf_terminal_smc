function out = F0d_test(u);
global M g L

ddz=[u(1);u(2);u(3)];
x=u(13);y=u(14);theta=u(15);
q1=u(7);q2=u(8);q3=u(9);
q4=u(10);q5=u(11);q6=u(12);


M0_ad=M_term3_object;
G0_ad=[0;M*g;0];


F =M0_ad*ddz+G0_ad;
 out=F;