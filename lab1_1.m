%% Part 1
clc;
clear all;
close all;

ur5 = ur5_interface();
config_to_move = -pi + (2*pi)*rand(6, 4);

ur5.move_joints(config_to_move, 10);

theta = ur5.get_current_joints();
