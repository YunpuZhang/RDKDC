%% Start
clc;
clear all;
close all;


ur5  = ur5_interface();

%% Define three random SE3
% g0a
roll = -pi + (2*pi)*rand(1);
pitch  = -pi + (2*pi)*rand(1);
yall = -pi + (2*pi)*rand(1);


R = ROTX(roll)*ROTY(pitch)*ROTZ(yall);
p = -0.5 + (2*0.5)*rand(3, 1);


g0a = [R, p; zeros(1, 3), 1];

% gab
roll = -pi + (2*pi)*rand(1);
pitch  = -pi + (2*pi)*rand(1);
yall = -pi + (2*pi)*rand(1);


R = ROTX(roll)*ROTY(pitch)*ROTZ(yall);
p = -0.5 + (2*0.5)*rand(3, 1);


gab = [R, p; zeros(1, 3), 1];

% gbc
roll = -pi + (2*pi)*rand(1);
pitch  = -pi + (2*pi)*rand(1);
yall = -pi + (2*pi)*rand(1);


R = ROTX(roll)*ROTY(pitch)*ROTZ(yall);
p = -0.5 + (2*0.5)*rand(3, 1);

gbc = [R, p; zeros(1, 3), 1];

%% TF Frame
pause(0.4);
Frame_A = tf_frame("base_link", "Frame_A", g0a);
pause(0.4);
Frame_B = tf_frame("Frame_A", "Frame_B", gab);
pause(0.4);
Frame_C = tf_frame("base_link", "Frame_C", eye(4,4));
pause(0.4);
Frame_C.move_frame("Frame_B", gbc);

gac = gab*gbc;
pause(2);
diff = gac - Frame_C.read_frame("Frame_A");
disp(diff);


