 function out =ddXd_dat(u)
 global x2 x

% global para 
%  global para 
%  x= para  ;
x2=x;
  a=heso_a(x2);

  t=u(1);

ddXd1=2*a(3)+6*a(4)*t+12*a(5)*t.^2+20*a(6)*t.^3;

ddXd2=2*a(9)+6*a(10)*t+12*a(11)*t.^2+20*a(12)*t.^3;
ddXd3=2*a(15)+6*a(16)*t+12*a(17)*t.^2+20*a(18)*t.^3;
if t>x2
    ddXd1=0;
    ddXd2=0;
    ddXd3=0;
end

  
 out=[ddXd1; ddXd2;ddXd3];
