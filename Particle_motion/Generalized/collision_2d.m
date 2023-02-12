function out = collision_2d(crd)

% crd = [m1,m2,v1,v2,theta1,theta2,theta2_]
syms v1_ v2_ theta1_

eq1 = crd(1)*v1_*sind(theta1_) + crd(2)*v2_*sind(crd(7)) == 0;
eq2 = crd(1)*v1_*cosd(theta1_) + crd(2)*v2_*cosd(crd(7)) == crd(1)*crd(3)*sind(crd(5)) + crd(2)*crd(4)*sind(crd(6));
eq3 = 0.5*crd(1)*v1_^2 + 0.5*crd(2)*v2_^2 == 0.5 * crd(1) * crd(3)^2 + 0.5 *crd(2)*crd(4)^2;
eqn = [eq1,eq2,eq3];
[v1_, v2_, theta1_ ] = solve(eqn,[v1_, v2_, theta1_ ]);

choose = 1;
out1 = double(v1_(choose));
out2 = double(v2_(choose));
out3 = double(theta1_(choose));
out = [out1,out2,out3,crd(7)];

