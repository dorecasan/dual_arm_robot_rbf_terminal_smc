function out = C31_term1(q1,q2,q3,dq1,dq2,dq3);

global l1 l2 l3 m1 m2 m3 ;
lc1=l1/2;
lc2=l2/2;
lc3=l3/2;

lsq11=-dq2*(m2*l1*lc2*sin(q2)+m3*l1*l2*sin(q2)+m3*l1*lc3*sin(q2+q3));
lsq12=-dq3*(m3*l1*lc3*sin(q2+q3)+m3*l2*lc3*sin(q3));

out(1,1)=lsq11+lsq12;

lsq21=-dq1*(m3*l1*lc3*sin(q2+q3)+m2*l1*lc2*sin(q2)+m3*l1*l2*sin(q2));
lsq22=-dq2*(m2*l1*lc2*sin(q2)+m3*l1*l2*sin(q2)+m3*l1*lc3*sin(q2+q3));
lsq23=-dq3*(m3*l2*lc3*sin(q3)+m3*l1*lc3*sin(q2+q3));

out(1,2)=lsq21+lsq22+lsq23;

lsq31=-dq1*(m3*l1*lc3*sin(q2+q3)+m3*l2*lc3*sin(q3));
lsq32=-dq2*(m3*l1*lc3*sin(q2+q3)+m3*l2*lc3*sin(q3));
lsq33=-dq3*(m3*l1*lc3*sin(q2+q3)+m3*l2*lc3*sin(q3));

out(1,3)=lsq31+lsq32+lsq33;

out(2,1)=dq1*(m2*l1*lc2*sin(q2)+m3*l1*l2*sin(q2)+m3*l1*lc3*sin(q2+q3))-dq3*m3*l2*lc3*sin(q3);
out(2,2)=-dq3*m3*l2*lc3*sin(q3);
out(2,3)=-dq1*m3*l2*lc3*sin(q3)-dq2*m3*l2*lc3*sin(q3)-dq3*m3*l2*lc3*sin(q3);
out(3,1)=dq1*(m3*l1*lc3*sin(q2+q3)+m3*l2*lc3*sin(q3))+dq2*m3*l2*lc3*sin(q3);
out(3,2)=dq1*m3*l2*lc3*sin(q3)+dq2*m3*l2*lc3*sin(q3);
out(3,3)=0;
