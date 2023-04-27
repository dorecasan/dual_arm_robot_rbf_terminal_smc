function out = dJ2_Jacoby(q4,q5,q6,dq4,dq5,dq6);
global l1 l2 l3;
out(1,1)= -l1*cos(q4)*dq4-l2*cos(q4+q5)*(dq4+dq5)-l3*cos(q4+q5+q6)*(dq4+dq5+dq6);
out(1,2)=-l2*cos(q4+q5)*(dq4+dq5)-l3*cos(q4+q5+q6)*(dq4+dq5+dq6);
out(1,3)= -l3*cos(q4+q5+q6)*(dq4+dq5+dq6);
out(2,1)= -l1*sin(q4)*dq4-l2*sin(q4+q5)*(dq4+dq5)-l3*sin(q4+q5+q6)*(dq4+dq5+dq6);
out(2,2)=-l2*sin(q4+q5)*(dq4+dq5)-l3*sin(q4+q5+q6)*(dq4+dq5+dq6);
out(2,3)= -l3*sin(q4+q5+q6)*(dq4+dq5+dq6);