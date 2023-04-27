function out = Y2_position(q4,q5,q6,x,y,theta);
global l1 l2 l3 a;
x2= a+l1*cos(q4)+l2*cos(q4+q5)+l3*cos(q4+q5+q6);
y2= l1*sin(q4)+l2*sin(q4+q5)+l3*sin(q4+q5+q6);
out=(x-x2)*sin(theta)-(y-y2)*sin(theta);


