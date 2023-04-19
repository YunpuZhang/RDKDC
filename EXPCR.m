function R = EXPCR(x)
 if (norm(x) ~= 0)
     w = x/(norm(x));
     theta = norm(x);
     w = SKEW3(w);
    
     R = eye(3) + sin(theta)*w + (1 - cos(theta))*w*w;
 else
     disp("x is a zero vector! RETURNING IDENTITY");
     R = eye(3);
 end
end

