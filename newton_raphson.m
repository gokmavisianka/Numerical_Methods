function newton_raphson()
    x = [input('x0: ')];
    TC = input('TC: ');
    epsilon = [];
    i = 1;
    while true
        x(i + 1) = x(i) - f(x(i)) / f_prime(x(i));
        epsilon(i) = abs((x(i + 1) - x(i)) / x(i + 1)) * 100;
        if epsilon(i) < TC
            fprintf("approximate root: %f, iterations: %d", x(i + 1), i);
            break;
        end
        i = i + 1;
    end                            
end

function result = f(x)
    result = exp(-x) - x;
end

function result = f_prime(value)
    syms x;
    y = diff(exp(-x) - x);
    result = vpa(subs(y, x, value));
end
