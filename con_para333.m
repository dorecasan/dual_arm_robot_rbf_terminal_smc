Xf=[1.2;1.9;pi/9];
X0=[0.5429;1.3999;0];

dXf=[0;0;0];
dX0=[0;0;0];
ddX0=[0;0;0];
ddXf=[0;0;0];

lamda=300*[1 0 0;0 2 0; 0 0 3];%250;350;500
beta = 50*[2 0 0;0 2 0; 0 0 3];
alpha_s = 2;
Kv=100*eye(6);

epN=0;bd=0;

% thiet ke mang
T_temple=0.2;
Wd=6*ones(1,6);%6,0
gama=2;%2
anpha=0.0;%0.032
node=8000;
b_n=10;%8;10

Tz_temple=0.1;
Wzd = [20 20 20];%6,0
gamaz=3;%2
anphaz=0.0;%0.032
nodez=8000;
bz_n=30;%8;10

Ti_temple=0.1;
Wid=[-8.40614096860259,14.1215151603857,5.88556216811888,8.41157137301567,-14.1029745999894,-5.87443783188112];%6,0
gamai=3;%2
anphai=0.0;%0.032
nodei=8000;
bi_n=30;%8;10


max_delx=2;%2;5;10
min_delx=-2;%2;-5
max_dely=2;%0.05;
min_dely=-2;%-0.05;
max_deltheta=2;%0.5;
min_deltheta=-2;%-0.5;
max_dx=2;%0.5;
min_dx=-2;%-0.5;
max_dy=2;%3;
min_dy=-2;%-3;
max_dtheta=2;%7;
min_dtheta=-2;

min_xd=0.5429;
max_xd=1.2;
min_yd=1.3999;
max_yd=1.9;
min_thetad=0;
max_thetad=pi/9;

min_dxd=0;
max_dxd=0.5984;
min_dyd=0;
max_dyd= 0.4554 ;
min_dthetad=0;
max_dthetad=0.3179;

min_ddxd=-0.8948; 
max_ddxd=0.8948 ;
min_ddyd=-0.6810;
max_ddyd= 0.6810;
min_ddthetad=-0.4754;
max_ddthetad=0.4754;

c1=linspace(min_delx,max_delx,node);
c2=linspace(min_dely,max_dely,node);
c3=linspace(min_deltheta,max_deltheta,node);
c4=linspace(min_dx,max_dx,node);
c5=linspace(min_dy,max_dy,node);
c6=linspace(min_dtheta,max_dtheta,node);
c=[c1;c2;c3;c4;c5;c6];


c1z=linspace(min_delx,max_delx,nodez);
c2z=linspace(min_dely,max_dely,nodez);
c3z=linspace(min_deltheta,max_deltheta,nodez);
c4z=linspace(min_dx,max_dx,nodez);
c5z=linspace(min_dy,max_dy,nodez);
c6z=linspace(min_dtheta,max_dtheta,nodez);
cz=[c1z;c2z;c3z;c4z;c5z;c6z];
   
c1i=linspace(min_delx,max_delx,nodei);
c2i=linspace(min_dely,max_dely,nodei);
c3i=linspace(min_deltheta,max_deltheta,nodei);
c4i=linspace(min_dx,max_dx,nodei);
c5i=linspace(min_dy,max_dy,nodei);
c6i=linspace(min_dtheta,max_dtheta,nodei);
ci=[c1i;c2i;c3i;c4i;c5i;c6i];
  
% luc dat khong thich nghi doi tuong
% nheta=[300 0 0;0 300 0; 0 0 50;];%5;6;x=0.5;1;0.5;0.2
% %nheta=[0.5 0 0;0 2 0; 0 0 2;];%4;1
% 
% % luc dat thich nghi doi tuong
% lamda0=[300 0 0;0 300 0; 0 0 50;];
% lamda0_ad=[300 0 0;0 300 0; 0 0 50;];

nheta=[0.3 0 0;0 5 0; 0 0 0.5;];%5;6;x=0.5;1;0.5;0.2
%nheta=[0.5 0 0;0 2 0; 0 0 2;];%4;1

% luc dat thich nghi doi tuong
lamda0=[0.3;5;0.5];
lamda0_ad=[0.3 0 0;0 5 0;0 0 0.5];
gama0=[10 0;0 10];%2;5;10
