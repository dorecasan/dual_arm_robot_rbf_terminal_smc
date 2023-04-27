function out= M_term3_object
global M L b 
I=M*L^3*b/12;
out(1,1)=M;
out(1,2)=0;
out(1,3)=0;
out(2,1)=0;
out(2,2)=M;
out(2,3)=0;
out(3,1)=out(1,3);
out(3,2)=out(2,3);
out(3,3)=I;
