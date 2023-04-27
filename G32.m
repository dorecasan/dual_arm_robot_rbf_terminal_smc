function out = G32(q4,q5,q6);
global m1 m2 m3 l1 l2 l3 g;

lc1=l1/2;
lc2=l2/2;
lc3=l3/2;
g11=(m1*g*lc1+m2*g*l1+m3*g*l2)*cos(q4)+(m2*g*lc2+m3*g*l2)*cos(q4+q5)+m3*g*lc3*cos(q4+q5+q6);
g22=(m2*g*lc2+m3*g*l2)*cos(q4+q5)+m3*g*lc3*cos(q4+q5+q6);
g33=m3*g*lc3*cos(q4+q5+q6);
out=[g11;g22;g33];