function Ad = Adj(g)
    R = g(1:3,1:3);
    p = g(1:3,4);
    Ad = [R SKEW3(p)*R;
        eye(3) R];
end