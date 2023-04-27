function out = Y1_position(q1,q2,q3,x,y,theta);
global l1 l2 l3;
x1= l1*cos(q1)+l2*cos(q1+q2)+l3*cos(q1+q2+q3);
y1= l1*sin(q1)+l2*sin(q1+q2)+l3*sin(q1+q2+q3);
out=(x-x1)*sin(theta)-(y-y1)*cos(theta);

