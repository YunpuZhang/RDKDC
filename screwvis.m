clc;
clear all;
close all;

kesai = [1;0;1/(2*pi);0;0;1];

ur5 = ur5_interface();

Frame = tf_frame("base_link", "Frame", eye(4,4));

v = kesai(1:3);
omega = kesai(4:6);
sk_omega = SKEW3(omega);
pause(0.4);
for theta=0:2*pi/100:2*pi
    R = eye(3,3) + sin(theta)*sk_omega + (1 - cos(theta))*sk_omega*sk_omega;
    p = (eye(3,3) - R)*sk_omega*v + omega*transpose(omega)*v*theta;
    E = [R, p; zeros(1,3), 1];
    pause(1)
    Frame.move_frame("base_link", E);
end

