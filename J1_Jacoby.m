function out = J1_Jacoby(q1,q2,q3);
global l1 l2 l3;
out(1,1)= -l1*sin(q1)-l2*sin(q1+q2)-l3*sin(q1+q2+q3);
out(1,2)= -l2*sin(q1+q2)-l3*sin(q1+q2+q3);
out(1,3)= -l3*sin(q1+q2+q3);
out(2,1)= l1*cos(q1)+l2*cos(q1+q2)+l3*cos(q1+q2+q3);
out(2,2)=l2*cos(q1+q2)+l3*cos(q1+q2+q3);
out(2,3)= l3*cos(q1+q2+q3);
