function Jb =  ur5BodyJacobian(theta)
% function accepts a 6*1 joint space variable vector, theta,
% and return the body jacobian, a 6*6 matrix Jb.
%% define parameters
e1 = [1, 0, 0]'; % x-unit vector in red color
e2 = [0, 1, 0]'; % y-unit vector in green color
e3 = [0, 0, 1]'; % z-unit vector in blue color
% initialize the rotational axis w
w1 = e3; % shoulder_link
w2 = e2; % upper_arm_link
w3 = e2; % forearm_link
w4 = e2; % wrist_1_link
w5 = -e3; % wrist_2_link
w6 = e2; % wrist_3_link

q1 = [0;0;0];
q2 = [0;0;0.0892];
q3 = [0.425;0;0.0892];
q4 = [0.425+0.392;0;0.0892];
q5 = [0.425+0.392;0.1093;0];
q6 = [0.425+0.392;0.1093;0.0892-0.09475];

g0 = [-1,0,0,0.425+0.392;0,0,1,0.0825+0.1093;0,1,0,0.0892-0.09475;0,0,0,1];

rot1 = expm([SKEW3(w1) -cross(w1,q1) ;0 0 0 0]*theta(1,1));
rot2 = expm([SKEW3(w2) -cross(w2,q2) ;0 0 0 0]*theta(2,1));
rot3 = expm([SKEW3(w3) -cross(w3,q3) ;0 0 0 0]*theta(3,1));
rot4 = expm([SKEW3(w4) -cross(w4,q4) ;0 0 0 0]*theta(4,1));
rot5 = expm([SKEW3(w5) -cross(w5,q5) ;0 0 0 0]*theta(5,1));
rot6 = expm([SKEW3(w6) -cross(w6,q6) ;0 0 0 0]*theta(6,1));

%% calculate body jacobian
fk = rot1*rot2*rot3*rot4*rot5*rot6*g0;
Xi1 = [-cross(w1,q1);w1];
Xi2 = [-cross(w2,q2);w2];
Xi3 = [-cross(w3,q3);w3];
Xi4 = [-cross(w4,q4);w4];
Xi5 = [-cross(w5,q5);w5];
Xi6 = [-cross(w6,q6);w6];
Js = [Xi1 Adj(rot1)*Xi2 Adj(rot1*rot2)*Xi3 Adj(rot1*rot2*rot3)*Xi4 Adj(rot1*rot2*rot3*rot4)*Xi5 Adj(rot1*rot2*rot3*rot4*rot5)*Xi6];
Jb = Adj(fk)^(-1)*Js;
end