function RK()
    a = 0;
    b = 1;
    N = input("N: ");
    h = (b - a) / N;
    y = zeros(N + 1, 1); 
    y(1) = 1;
    f = @(x, y) exp(-7*x) * (x^4 + 2*x^2 -y^2 + 1) + 2*x;
    for k = 1: 1: N
        x = (k - 1) * h;
        k1 = f(x, y(k));
        k2 = f(x + h/2, y(k) + k1*h/2); 
        k3 = f(x + h/2, y(k) + k2*h/2);
        k4 = f(x + h, y(k) + k3*h);
        y(k + 1) = y(k) + h*(k1 + 2*k2 + 2*k3 + k4)/6;
    end
    f = @(x) x^2 + 1;
    for k = 1: 1: (N + 1)
        x = (k - 1) * h;
        exact(k, 1) = f(x); 
    end
    error = max(abs(y - exact))
end
    
