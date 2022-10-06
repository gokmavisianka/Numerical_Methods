function secant()
    x = [input('x0: '), input('x1: ')];
    TC = input('TC: ');
    epsilon = [];
    i = 2;
    while true
        x(i + 1) = x(i) - f(x(i)) * ((x(i) - x(i - 1)) / (f(x(i)) - f(x(i - 1))));
        epsilon(i - 1) = abs((x(i + 1) - x(i)) / x(i + 1)) * 100;
        if epsilon(i - 1) < TC
            fprintf("approximate root: %f, iterations: %d", x(i + 1), i - 1);
            break;
        end
        i = i + 1;
    end                            
end

function result = f(x)
    result = exp(-x) - x;
end
