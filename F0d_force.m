function out = F0d_force(u)
global   M g nheta 
%u=[1;2;3;4;5;6;7;8;9];
ddzd=[u(1);u(2);u(3)];
dzd=[u(4);u(5);u(6)];
dz=[u(7);u(8);u(9)];
con_para333;
M0=M_term3_object;
G0=[0;M*g;0];

% F0 =M0*(ddzd+nheta*(dzd-dz))+G0;

F0 =M0*ddzd+G0;
 out=F0;