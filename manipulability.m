function mu = manipulability(J, measure)
% Input: 6x6 jacobian J; manipulability measure: either sigmamin, detjac,
% or invcond
% Output: measure of manipulability
mu = -9999;
[~, S, ~] = svd(J);

switch measure
    case 'sigmamin'
        mu = min(diag(S));
    case 'invcond'
        mu = min(diag(S))/max(diag(S));
    case 'detjac'
        mu = 1;
        for i = 1:1:size(diag(S))
            mu = mu*S(i, i);
        end
    otherwise
        disp("Wrong measure, show mu = -9999");
end
end
