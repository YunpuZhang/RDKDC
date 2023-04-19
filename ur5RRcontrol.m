function finalerr = ur5RRcontrol(gdesired,K, ur5)
% The function moves the UR5 to desired position and return the error
% Input: 4x4 desired transformation gdesired, controller gain K, ur5 object
% Output: -1 if error or singularity; else for position error in cm
finalerr = -1;
T_step = 0.2;
t_err = 999;
r_err = 999;

while (true)
    gst = ur5.get_current_transformation('base_link','tool0');
    Xi = getXi(gdesired\gst);
    t_err = norm(Xi(1:3));
    r_err = norm(Xi(4:6));

    if (t_err < 5 && r_err < 15)
        finalerr = t_err;
        disp("Goal Reached within Tolerance");
        return;
    end

    qk = ur5.get_current_joints();

    J = ur5BodyJacobian(qk);
    if (abs(det(J)) < 1e-3)
        disp("ABORT");
        return
    end
    q_k1 = qk - K*T_step*(J\Xi);

    ur5.move_joints(q_k1, T_step);
    pause(T_step);

end


end

