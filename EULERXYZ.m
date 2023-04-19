function R = EULERXYZ(angles)
 roll = angles(1);
 pitch = angles(2);
 yall = angles(3);
 Rx = ROTX(roll);
 Ry = ROTY(pitch);
 Rz = ROTZ(yall);
 
 R = Rx*Ry*Rz;
end

