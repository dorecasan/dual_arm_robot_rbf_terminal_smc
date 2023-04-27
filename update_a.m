function out = update_a(u);
global gama0 lamda0_ad lamda beta alpha_s
%u=[1;2;3;4;5;6;7;8;9;1;2;3;4;5;6];
con_para333;
ddxd=u(1);ddyd=u(2);ddthetad=u(3);
dxd=u(4);dyd=u(5);dthetad=u(6);
dx=u(7);dy=u(8);dtheta=u(9);
zd=[u(10);u(11);u(12);];
z=[u(13);u(14);u(15);];
e=zd-z;
de=[dxd;dyd;dthetad]-[dx;dy;dtheta];
s=-de-lamda0_ad*e-beta*(sign(e).*(abs(e).^(alpha_s)));
%s=-de-lamda*e;
Y0=Y0_term3(ddxd,ddyd,ddthetad,dxd,dyd,dthetad,dx,dy,dtheta);
out=-gama0*Y0'*s;
