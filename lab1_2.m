%% 1.a 
clc;
clear all;
close all;

figure;
hold on;
plotr(eye(3), 'initial');
roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
disp("First: " + roll);
plotr(Rx, 'first');
roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
plotr(Rx, 'second');
disp("Second: " + roll);
roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
plotr(Rx, 'third');
disp("Third: " + roll);

    


%% 1.b
clc;
clear all;
close all;

figure;
plotr(eye(3));
hold on;


point = [0, 1, 2]';
plotp3(point, 'black');
roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
tf_pt = Rx*point;
plotp3(tf_pt, 'red');
disp("First roll: " + roll);
disp("First point: " + tf_pt);


roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
tf_pt = Rx*point;
plotp3(tf_pt, 'green');
disp("Second roll: " + roll);
disp("Second point: " + tf_pt);

roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
tf_pt = Rx*point;
plotp3(tf_pt, 'blue');
disp("Third roll: " + roll);
disp("Third point: " + tf_pt);


%% 1.c
clc;
clear all;
close all;

figure;
plotr(eye(3));
hold on;
point = [0, 1, 2, 1]';
plotp4(point, 'black');
roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
Rx = [         Rx,  [1, 1, 1]';
      zeros(1, 3),           1];
tf_pt = Rx*point;
plotp4(tf_pt, 'red');
disp("First roll: " + roll);
disp("First point: " + tf_pt);

roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
Rx = [         Rx,  [1, 1, 1]';
      zeros(1, 3),           1];
tf_pt = Rx*point;
plotp4(tf_pt, 'green');
disp("First roll: " + roll);
disp("First point: " + tf_pt);

roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
Rx = [         Rx,  [1, 1, 1]';
      zeros(1, 3),           1];
tf_pt = Rx*point;
plotp4(tf_pt, 'blue');
disp("First roll: " + roll);
disp("First point: " + tf_pt);


%% 1.d
clc;
clear all;
close all;

figure;
plotr(eye(3));
hold on;
point2 = [0, 1, 2]';
point1 = [0, 0, 0]';
plotv3(point1, point2, 'black');
roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
tf_pt1 = Rx*point1;
tf_pt2 = Rx*point2;
plotv3(tf_pt1, tf_pt2, 'red');
disp("First roll: " + roll);
disp("First p1: " + tf_pt1);
disp("First p2: " + tf_pt2);

roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
tf_pt1 = Rx*point1;
tf_pt2 = Rx*point2;
plotv3(tf_pt1, tf_pt2, 'green');
disp("Second roll: " + roll);
disp("Second p1: " + tf_pt1);
disp("Second p2: " + tf_pt2);

roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
tf_pt1 = Rx*point1;
tf_pt2 = Rx*point2;
plotv3(tf_pt1, tf_pt2, 'blue');
disp("Third roll: " + roll);
disp("Third p1: " + tf_pt1);
disp("Third p2: " + tf_pt2);

%% 1.e
clc;
clear all;
close all;

figure;
plotr(eye(3));
hold on;
point2 = [0, 1, 2, 1]';
point1 = [0, 0, 0, 1]';
plotv4(point1, point2, 'black');
roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
Rx = [         Rx,  [0, 0, 1]';
      zeros(1, 3),           1];
tf_pt1 = Rx*point1;
tf_pt2 = Rx*point2;
plotv4(tf_pt1, tf_pt2, 'red');
disp("First roll: " + roll);
disp("First p1: " + tf_pt1);
disp("First p2: " + tf_pt2);

roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
Rx = [         Rx,  [0, 0, 1]';
      zeros(1, 3),           1];
tf_pt1 = Rx*point1;
tf_pt2 = Rx*point2;
plotv4(tf_pt1, tf_pt2, 'green');
disp("Second roll: " + roll);
disp("Second p1: " + tf_pt1);
disp("Second p2: " + tf_pt2);


roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
Rx = [         Rx,  [0, 0, 1]';
      zeros(1, 3),           1];
tf_pt1 = Rx*point1;
tf_pt2 = Rx*point2;
plotv4(tf_pt1, tf_pt2, 'blue');
disp("Third roll: " + roll);
disp("Third p1: " + tf_pt1);
disp("Third p2: " + tf_pt2);
%% 1.f
clc;
clear all;
close all;

figure;
hold on;
plotf(eye(4), 'black');
roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
Rx = [         Rx,  [0, 0, 1]';
      zeros(1, 3),           1];
plotf(Rx, 'red');
disp("First: " + roll);

roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
Rx = [         Rx,  [0, 0, 1]';
      zeros(1, 3),           1];
plotf(Rx, 'green');
disp("Second: " + roll);

roll = -pi + (2*pi)*rand(1);
Rx = ROTX(roll);
Rx = [         Rx,  [0, 0, 1]';
      zeros(1, 3),           1];
plotf(Rx, 'blue');
disp("Third: " + roll);

%% 2 
clc;
clear all;
close all;

roll = -pi + (2*pi)*rand(1);
pitch = -pi + (2*pi)*rand(1);
yall = -pi + (2*pi)*rand(1);

Ry = ROTY(pitch);

Rz = ROTZ(yall);

figure;
hold on;
plotr(eye(3), 'initial');
plotr(Ry);

figure;
hold on;
plotr(eye(3), 'initial');
plotr(Rz);

%% 3
clc;
clear all;
close all;


for i = 1:1:3
    roll = -pi + (2*pi)*rand(1);
    pitch = -pi + (2*pi)*rand(1);
    yall = -pi + (2*pi)*rand(1);
    
    angles = [roll, pitch, yall];
    R = EULERXYZ(angles);
    figure;
    hold on;
    plotr(eye(3), 'initial');
    plotr(R);
end

%% 4
clc;
clear all;
close all;

roll = -pi + (2*pi)*rand(1);
pitch = -pi + (2*pi)*rand(1);
yall = -pi + (2*pi)*rand(1);
angles = [roll, pitch, yall];
% For a
R = EULERXYZ(angles);
roll= roll + 2*pi;
angles = [roll, pitch, yall];
disp("Difference between EULERXYZ([a b c])and EULERXYZ([a+(2π) b c]): "); 
disp(R - EULERXYZ(angles));
% For b
% It is included in the function

% For c
angles = [4*pi, pi, 0];
disp("Input angles: ");
disp(angles');
disp("Angles from Inverse: ");
disp(EULERXYZINV(EULERXYZ(angles)));

% For d
roll = -pi + (2*pi)*rand(1);
pitch = -pi + (2*pi)*rand(1);
yall = -pi + (2*pi)*rand(1);
angles = [roll, pitch, yall];

R = EULERXYZ(angles);
disp("Difference between R and EULERXYZ(EULERXYZINV(R)): "); 
disp(R - EULERXYZ(EULERXYZINV(R)));

%% 5
clc;
clear all;
close all;

syms x1 x2 x3
x = [x1, x2, x3];
disp(SKEW3(x));

%% 6 & 7
clc;
clear all;
close all;

% First plotr
x = -pi + (2*pi)*rand(3, 1);
dir = x/norm(x);
mag = [1, 2, 3];
R1 = EXPCR(mag(1)*dir);
R2 = EXPCR(mag(2)*dir);
R3 = EXPCR(mag(3)*dir);
disp("First Dir: " + dir);

figure;
hold on;
plotr(eye(3), 'initial');
plotr(R1, 'First');
plotr(R2, 'Second');
plotr(R3, 'Third');

% First plotv3
p1 = -pi + (2*pi)*rand(3, 1);
p2 = -pi + (2*pi)*rand(3, 1);
disp("1.0 p1: " + p1);
disp("1.0 p2: " + p2);
figure;
hold on;
plotr(eye(3), 'initial');
plotv3(p1, p2, 'black');
tf_p1 = R1*p1;
tf_p2 = R1*p2;
disp("1.1 p1: " + tf_p1);
disp("1.1 p2: " + tf_p2);
plotv3(tf_p1, tf_p2, 'red');
tf_p1 = R2*p1;
tf_p2 = R2*p2;
disp("1.2 p1: " + tf_p1);
disp("1.2 p2: " + tf_p2);
plotv3(tf_p1, tf_p2, 'green');
tf_p1 = R3*p1;
tf_p2 = R3*p2;
disp("1.3 p1: " + tf_p1);
disp("1.3 p2: " + tf_p2);
plotv3(tf_p1, tf_p2, 'blue');


% Second plotr
x = -pi + (2*pi)*rand(3, 1);
dir = x/norm(x);
mag = [1, 2, 3];
R1 = EXPCR(mag(1)*dir);
R2 = EXPCR(mag(2)*dir);
R3 = EXPCR(mag(3)*dir);
disp("Second Dir: " + dir);

figure;
hold on;
plotr(eye(3), 'initial');
plotr(R1, 'First');
plotr(R2, 'Second');
plotr(R3, 'Third');

% Second plotv3
p1 = -pi + (2*pi)*rand(3, 1);
p2 = -pi + (2*pi)*rand(3, 1);
disp("1.0 p1: " + p1);
disp("1.0 p2: " + p2);
figure;
hold on;
plotr(eye(3), 'initial');
plotv3(p1, p2, 'black');
tf_p1 = R1*p1;
tf_p2 = R1*p2;
disp("1.1 p1: " + tf_p1);
disp("1.1 p2: " + tf_p2);
plotv3(tf_p1, tf_p2, 'red');
tf_p1 = R2*p1;
tf_p2 = R2*p2;
disp("1.2 p1: " + tf_p1);
disp("1.2 p2: " + tf_p2);
plotv3(tf_p1, tf_p2, 'green');
tf_p1 = R3*p1;
tf_p2 = R3*p2;
disp("1.3 p1: " + tf_p1);
disp("1.3 p2: " + tf_p2);
plotv3(tf_p1, tf_p2, 'blue');

%% 8
clc;
clear all;
close all;

roll = -pi + (2*pi)*rand(1);
pitch = -pi + (2*pi)*rand(1);
yall = -pi + (2*pi)*rand(1);
angles = [roll, pitch, yall];

R = EULERXYZ(angles);
p = -5 + (10)*rand(3, 1);

E = [         R,     p;
     zeros(1, 3),    1];
Einv = FINV(E);

disp(E*Einv);
disp("It is identity! ");




