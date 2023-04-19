%% Test ur5FwdKin
ur5 = ur5_interface();

% ur5.move_joints(ur5.home,2);
% 
% test_frame = tf_frame('base_link','test_frame',eye(4));
% 
% joint = [pi/3;pi/3;pi/3;pi/3;pi/3;pi/3;];
% 
% fk=ur5FwdKin(joint);
% 
% test_frame.move_frame('base_link',fk);
% 
% ur5.move_joints(joint,2);

joint = [pi/3;pi/3;pi/3;pi/3;pi/3;pi/3];
fk=ur5FwdKin(joint);
test_frame = tf_frame('base_link','test_frame',fk);
init = zeros(6, 1);
ur5.move_joints(init,5);
pause(5);
ur5.move_joints(joint,5);

%% Test ur5BodyJacobian

error = 1e-2;

q = [pi/3;pi/3;pi/3;pi/3;pi/3;pi/6];
fk = ur5FwdKin(q);
% e1 = [1;0;0;0;0;0];
% e2 = [0;1;0;0;0;0];
% e3 = [0;0;1;0;0;0];
% e4 = [0;0;0;1;0;0];
% e5 = [0;0;0;0;1;0];
% e6 = [0;0;0;0;0;1];

e_n = eye(6);


J_approx = zeros(6,6);

for i = 1:6
    q1 = q+error*e_n(:,i);
    q2 = q-error*e_n(:,i);

    g1 = ur5FwdKin(q1);
    g2 = ur5FwdKin(q2);

    d_i = (g1-g2)/(2*error);
    Xi_i_hat = fk\d_i;

    Xi_i = [Xi_i_hat(1:3,4);Xi_i_hat(3,2);Xi_i_hat(1,3);Xi_i_hat(2,1)];

    J_approx(:,i) = Xi_i;
    
end
J = ur5BodyJacobian(q);
norm(J_approx-J)



%% Test manipulability
clc;
clear;
close all;

angles = linspace(-pi/4, pi/4, 100);
a = zeros(100,1);
b = zeros(100,1);
c = zeros(100,1);
joint = [1, 0.7, 1.5, 1.7, 1.5, 1]';
for i = 1:1:100
    joint(3) = angles(i);
    J = ur5BodyJacobian(joint);
    a(i) = manipulability(J, 'sigmamin');
    b(i) = manipulability(J, 'detjac');
    c(i) = manipulability(J, 'invcond');
end

figure;
plot(angles, a);
title("sigmamin");
xlabel("Angles");
ylabel("Mu");
legend('sigmamin');
figure;
plot(angles, b);
title("detjac");
xlabel("Angles");
ylabel("Mu");
legend('detjac')
figure;
plot(angles, c);
title("Invcond");
xlabel("Angles");
ylabel("Mu");
legend("invcond");



%% Test getXi

rot = ROTX(-pi + (2*pi)*rand(1))

trans = [1;1;1]

T = [rot trans;
    zeros(1,3) 1];

Xi = getXi(T);

w= Xi(4:6,1);

w_hat = SKEW3(w);

v = Xi(1:3,1);

twist_rot = [w_hat v;
    zeros(1,3) 0];

res = expm(twist_rot)

%% Test RRcontrol

test_frame.move_frame('base_link',fk_test);
K = 0.05;
test = [pi/6;pi/6;pi/6;pi/6;pi/6;pi/6];
fk_test = ur5FwdKin(test);

err = ur5RRcontrol(fk_test,K,ur5);



