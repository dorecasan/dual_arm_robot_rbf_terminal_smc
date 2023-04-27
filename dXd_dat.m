 function out =dXd_dat(u)
 global x2 x

% global para 
%  global para 
%  x= para  ;
x2=x;
  a=heso_a(x2);

  t=u(1);

dXd1=a(2)+2*a(3)*t+3*a(4)*t.^2+4*a(5)*t.^3+5*a(6)*t.^4;
dXd2=a(8)+2*a(9)*t+3*a(10)*t.^2+4*a(11)*t.^3+5*a(12)*t.^4;
dXd3=a(14)+2*a(15)*t+3*a(16)*t.^2+4*a(17)*t.^3+5*a(18)*t.^4;
if t>x2
   dXd1=0;
   dXd2=0;
   dXd3=0;
end

  
 out=[dXd1; dXd2;dXd3];
