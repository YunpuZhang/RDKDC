function Einv = FINV(E)
R = E(1:3, 1:3);
p = E(1:3, 4);

Einv = [         R',     -R'*p;
        zeros(1, 3),         1];
end

