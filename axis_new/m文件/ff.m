function [O, R, F] = ff(X)
n = size(X, 2);

    function L = L(t)
        O = t(1:3); R = t(4);
        P = repmat(O, 1, n) - X;
        L = sum(abs(sqrt(sum(P .* P, 1)) - R));
    end

O0 = mean(X, 2);
R0 = norm(O0 - X(:, 1));
OR = fminsearch(@L, [O0; R0], optimset('MaxFunEvals', 100000));
O = OR(1:3);
R = OR(4);

P = repmat(O, 1, n) - X;
[v, d] = eig(P * P');
[t, i] = min(max(d));
F = v(:, i);
end
