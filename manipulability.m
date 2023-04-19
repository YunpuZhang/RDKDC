function mu = manipulability(J, measure)
% Input: 6x6 jacobian J; manipulability measure: either sigmamin, detjac,
% or invcond
% Output: measure of manipulability
mu = -9999;
[~, S, ~] = svd(Jb);

switch measure
    case sigmamin
        mu = min(Diag(S));
    case invcond
        mu = max(Diag(S))/min(Diag(S));
    case detjac
        mu = det(J);
    otherwise
        disp("Wrong measure, show mu = -9999");
end
end
