function out= M1_term3(q1,q2,q3);

global m1 m2 m3 l1 l2 l3;
lc1=l1/2; lc2=l2/2;lc3=l3/2;
I1=m1*l1*l1/12;
I2=m2*l2*l2/12;
I3=m3*l3*l3/12;

qk11=m1*lc1^2+I1+m2*l1^2+m3*l1^2+m2*lc2^2+I2;
qk12=m3*l2^2+m3*lc3^2+I3+2*cos(q2)*m2*l1*lc2;
qk13=2*m3*l1*lc3*cos(q2+q3)+2*m3*l2*lc3*cos(q3);
qk14=2*m3*l1*l2*cos(q2);

out(1,1)=qk11+qk12+qk13+qk14;

qk21=m2*lc2^2+I2+I3+m3*lc3^2+m2*l1*lc2*cos(q2)+m3*l1*l2*cos(q2)+m3*l2^2;
qk22=m3*l1*lc3*cos(q2+q3)+2*m3*l2*lc3*cos(q3);

out(1,2)=qk21+qk22;

out(1,3)=m3*l1*lc3*cos(q2+q3)+m3*l2*lc3*cos(q3)+m3*lc3^2+I3;

 out(2,1) =out(1,2);
 
 out(2,2) =m2*lc2^2+I2+m3*l2^2+m3*lc3^2+I3+2*m3*l2*lc3*cos(q3);
 
 out(2,3)=m3*lc3^2+I3+m3*l2*lc3*cos(q3);
 
  out(3,1)=out(1,3); 
 out(3,2)=out(2,3);
  out(3,3)=m3*lc3^2+I3;
 