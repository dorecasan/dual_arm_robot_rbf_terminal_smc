function out= Y0_term3(ddxd,ddyd,ddthetad,dxd,dyd,dthetad,dx,dy,dtheta);
global  g ;
con_para333;
ddxr=ddxd+lamda0(1)*(dxd-dx);
ddyr=ddyd+lamda0(2)*(dyd-dy);
ddthetar=ddthetad+lamda0(3)*(dthetad-dtheta);
out(1,1)=ddxr;
out(1,2)=0;
out(2,1)=ddyr+g;
out(2,2)=0;
out(3,1)=0;
out(3,2)=ddthetar;

 