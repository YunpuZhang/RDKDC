function gst = ur5FwdKin(thetas)
% Input: thetas -> six joint angles in radian
% Output: gst -> 4*4 transformation matrix from robot base to end effector
gst = eye(4, 4);
L1 = 0.425;
L2 = 0.392;
L3 = 0.1093;
L4 = 0.09475;
L5 = 0.0825;
L6 = 0.0892;

e1 = [1; 0; 0];
e2 = [0; 1; 0];
e3 = [0; 0; 1];

w = [e3, e2, e2, e2, -e3, e2];
q = [      0,  0,       0;
           0,  0,      L6;
          L1,  0,      L6;
     L1 + L2,  0,      L6;
     L1 + L2, L3,       0;
     L1 + L2,  0,      L6 - L4]';

Xi = zeros(6, 6);
eXi = zeros(4, 4, 6);
for i = 1:1:6
    Xi(1:3, i) = -cross(w(:,i), q(:,i));
    Xi(4:6, i) = w(:, i);

    eXi(1:3, 1:3, i) = expm(SKEW3(w(:, i))*thetas(i));
    eXi(1:3, 4, i) = (eye(3, 3) - eXi(1:3, 1:3, i))*cross(w(:, i), Xi(1:3, i)) + w(:, i)*transpose(w(:, i))*Xi(1:3, i)*thetas(i);
    eXi(4, 4, i) = 1;

    gst = gst*eXi(:, :, i);
end

gst0 = [  ROTX(pi/2)*ROTY(pi), [L1 + L2; L3 + L5; L6 - L4]; 
                  zeros(1, 3),                          1];

gst = gst*gst0;

end