function  out = C32_term2(q4,q5,q6,dq4,dq5,dq6);

global l1 l2 l3 m1 m2 m3 ;
lc1=l1/2;
lc2=l2/2;
lc3=l3/2;

lsq11=-dq5*(m2*l1*lc2*sin(q5)+m3*l1*l2*sin(q5)+m3*l1*lc3*sin(q5+q6));
lsq12=-dq6*(m3*l1*lc3*sin(q5+q6)+m3*l2*lc3*sin(q6));

out(1,1)=lsq11+lsq12;

lsq21=-dq4*(m3*l1*lc3*sin(q5+q6)+m2*l1*lc2*sin(q5)+m3*l1*l2*sin(q5));
lsq22=-dq5*(m2*l1*lc2*sin(q5)+m3*l1*l2*sin(q5)+m3*l1*lc3*sin(q5+q6));
lsq23=-dq6*(m3*l2*lc3*sin(q6)+m3*l1*lc3*sin(q5+q6));

out(1,2)=lsq21+lsq22+lsq23;

lsq31=-dq4*(m3*l1*lc3*sin(q5+q6)+m3*l2*lc3*sin(q6));
lsq32=-dq5*(m3*l1*lc3*sin(q5+q6)+m3*l2*lc3*sin(q6));
lsq33=-dq6*(m3*l1*lc3*sin(q5+q6)+m3*l2*lc3*sin(q6));

out(1,3)=lsq31+lsq32+lsq33;

out(2,1)=dq4*(m2*l1*lc2*sin(q5)+m3*l1*l2*sin(q5)+m3*l1*lc3*sin(q5+q6))-dq6*m3*l2*lc3*sin(q6);
out(2,2)=-dq6*m3*l2*lc3*sin(q6);
out(2,3)=-dq4*m3*l2*lc3*sin(q6)-dq5*m3*l2*lc3*sin(q6)-dq6*m3*l2*lc3*sin(q6);
out(3,1)=dq4*(m3*l1*lc3*sin(q5+q6)+m3*l2*lc3*sin(q6))+dq5*m3*l2*lc3*sin(q6);
out(3,2)=dq4*m3*l2*lc3*sin(q6)+dq5*m3*l2*lc3*sin(q6);
out(3,3)=0;





