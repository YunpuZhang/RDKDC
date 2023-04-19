function Xi = getXi(g)
% Input: 4x4 transformation matrix g
% Output: 6x1 unnormalized Xi
Xi = zeros(6, 1);

R = g(1:3, 1:3);
p = g(1:3, 4);

theta = acos((trace(R) - 1)/2);
if (theta <= 1e-5)
    w = zeros(3, 1);
    v = p/norm(p);
    theta = norm(p);
    Xi = [v; w]*theta;
else
    diff = R- R';
    diff_vec = [diff(3, 2); diff(1, 3); diff(2, 1)];
    w = 1/(2*sin(theta)) * diff_vec;
    v = ((eye(3, 3) - expm(theta*SKEW3(w)))*SKEW3(w) + w*w'*theta)\p;
    Xi = [v; w]*theta;
end

end

