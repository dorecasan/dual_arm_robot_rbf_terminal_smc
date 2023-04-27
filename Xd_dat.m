 function out =Xd_dat(u)
global x2 x

x2=x;

t=u(1);
a=heso_a(x2);
con_para333

Xd1=a(1)+a(2)*t+a(3)*t.^2+a(4)*t.^3+a(5)*t.^4+a(6)*t.^5;

Xd2=a(7)+a(8)*t+a(9)*t.^2+a(10)*t.^3+a(11)*t.^4+a(12)*t.^5;
Xd3=a(13)+a(14)*t+a(15)*t.^2+a(16)*t.^3+a(17)*t.^4+a(18)*t.^5;
if t>x2
    Xd1=Xf(1);
    Xd2=Xf(2);
    Xd3=Xf(3);
 
end
 out=[Xd1; Xd2;Xd3];


