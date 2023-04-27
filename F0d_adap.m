function out = F0d_adap(u);
global   g lamda0_ad lamda
%u=[1;2;3;4;5;6;7;8;9;1;2];
ddzd=[u(1);u(2);u(3)];
dzd=[u(4);u(5);u(6)];
dz=[u(7);u(8);u(9)];
M_ob=u(10);I_ob=u(11);
con_para333;
M0_ad=[M_ob 0 0;0 M_ob 0; 0 0 I_ob];
G0_ad=[0;M_ob*g;0];


F0d =M0_ad*(ddzd+lamda0_ad*(dzd-dz))+G0_ad;
 out= F0d;