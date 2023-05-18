function modified_gauss_elimination()
    a = zeros(1, 23);
    b = zeros(1, 23);
    c = zeros(1, 23);
    f = zeros(1, 23);
    lambda = [1.32, 1];
    nu = [0.38, -0.89];
    alpha = [1.32, 2:1:24];
    beta = [0.38, 2:1:24];
    for k = 1: 1: 23
        a(k) = sin(k);
        b(k) = exp(-k);
        c(k) = -1;
        f(k) = -1.2;
        alpha(k + 1) = b(k) / (c(k) - a(k) * alpha(k));
        beta(k + 1) = (f(k) + a(k) * beta(k)) / (c(k) - a(k) * alpha(k));
    end
    u = [1:1:24, (nu(2) + lambda(2) * beta(24)) / (1 - lambda(2) * alpha(24))];
    for k = 25: -1: 2
        u(k - 1) = alpha(k - 1) * u(k) + beta(k - 1);
    end
    for i = 1: 1: 25
        fprintf("u%d: %f\n", (i - 1), u(i));
    end
end
