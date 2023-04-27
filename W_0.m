function out=W_0(u)
global   nodez cz bz_n gamaz Tz_temple Wz1 Wz2 Wz3 Wzd anphaz lamda

ddxd=u(1);ddyd=u(2);ddthetad=u(3);
dxd=u(4);dyd=u(5);dthetad=u(6);
dx=u(7);dy=u(8);dtheta=u(9);
zd=[u(10);u(11);u(12);];
z=[u(13);u(14);u(15);];
% ddzd=[ddxd;ddyd;ddthetad];
% dzd=[dxd;dyd;dthetad];
e=zd-z;

de=[dxd;dyd;dthetad]-[dx;dy;dtheta];
s=-de-lamda*e;

t=u(16);

con_para333;

 z=[e;de];
 
 h1=zeros(nodez,1);
 h2=zeros(nodez,1);
 h3=zeros(nodez,1);

 
h_sum1=0;
h_sum2=0;
h_sum3=0;

 
hr1=zeros(nodez,1);
hr2=zeros(nodez,1);
hr3=zeros(nodez,1);



 for j=1:nodez

h1(j)=exp(-norm(z-cz(:,j))^2/(bz_n*bz_n));
h2(j)=exp(-norm(z-cz(:,j))^2/(bz_n*bz_n));
h3(j)=exp(-norm(z-cz(:,j))^2/(bz_n*bz_n));


h_sum1=h_sum1+h1(j);
h_sum2=h_sum2+h2(j);
h_sum3=h_sum3+h3(j);

 end
 for j=1:node
  hr1(j)=h1(j)/h_sum1;
  hr2(j)=h2(j)/h_sum2;
  hr3(j)=h3(j)/h_sum3;

 end

if t==0
    Wz1=Wzd(1)*ones(nodez,1);
    Wz2=Wzd(2)*ones(nodez,1);
    Wz3=Wzd(3)*ones(nodez,1);
    
else
    Wz1=-Tz_temple*gamaz*(hr1*s(1)-anphaz*norm(s)*Wz1)+Wz1;
    Wz2=-Tz_temple*gamaz*(hr2*s(2)-anphaz*norm(s)*Wz2)+Wz2;
    Wz3=-Tz_temple*gamaz*(hr3*s(3)-anphaz*norm(s)*Wz3)+Wz3;
      
end
fw1=Wz1'*hr1;
fw2=Wz2'*hr2;
fw3=Wz3'*hr3;

fn=[fw1;fw2;fw3];
out=fn;
