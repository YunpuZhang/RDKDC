function finalerr = ur5RRcontrol(gdesired,K, ur5)
% The function moves the UR5 to desired position and return the error
% Input: 4x4 desired transformation gdesired, controller gain K, ur5 object
% Output: -1 if error or singularity; else for position error in cm
finalerr = -1;

gst = ur5.get_current_transformation('base_link','tool0');



end

