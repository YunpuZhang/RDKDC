function angle = EULERXYZINV(R)
% Condition: sin(pitch) != 0 && cos(pitch) != 0 
% In other words, R(1, 3) != 0, and cos(pitch) != 0
    if (R(1, 3) ~= 0)
        pitch = atan2(R(1, 3), sqrt(R(2, 3)^2 + R(3, 3)^2));
        if (cos(pitch) ~= 0)
            yall = atan2(R(1, 2)/(-cos(pitch)), R(1, 1)/cos(pitch));
            roll = atan2(R(2, 3)/(-cos(pitch)), R(3, 3)/cos(pitch));
        else
            disp("cos(pitch) is 0! RETURNING 0 ");
            angle = [0,0,0];
            return;
        end
    else
        disp("R(1,3) is 0! ");
        pitch = atan2(R(1, 3), sqrt(R(2, 3)^2 + R(3, 3)^2));
        yall = atan2(R(1, 2)/(-cos(pitch)), R(1, 1)/cos(pitch));
        roll = atan2(R(2, 3)/(-cos(pitch)), R(3, 3)/cos(pitch));
    end   
    
    angle = [roll; pitch; yall];
end

