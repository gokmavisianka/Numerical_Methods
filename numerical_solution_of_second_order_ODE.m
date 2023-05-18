function second_order_ODE()
    a = 0;
    b = 1;
    N = input("N: ");
    h = (b - a) / N;
    t = @(k) a + (k - 1)*h;
    A = zeros(N + 1, N + 1);
    F = zeros(N + 1, 1);
    % Mixed-Type Boundary Conditions:
    A(1, 1) = 1;
    F(1, 1) = 1;
    A(N + 1, 1:1:3) = [-3, 4, -1];
    F(N + 1, 1) = -2*h;
    for k = 2: 1: N
        A(k, k-1) = 1 - ((h/2) * exp(-2*t(k)));
        A(k, k) = (h^2) - 2;
        A(k, k+1) = 1 + ((h/2) * exp(-2*t(k)));
        F(k, 1) = (h^2) * (5*exp(-2*t(k)) - 2*exp(-4*t(k)) + exp(-2*t(k)) + t(k));
    end
    Y = linsolve(A, F);
    exact = zeros(N + 1, 1);
    for k = 1: 1: (N + 1)
        exact(k, 1) = exp(-2*t(k)) + t(k);
    end
    error = max(abs(Y - exact))
end
