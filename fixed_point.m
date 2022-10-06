function fixed_point()
    x = [input('x0: ')];
    TC = input('TC: ');
    epsilon = [];
    i = 2;
    while true
        x(i) = f(x(i - 1));
        epsilon(i - 1) = abs((x(i) - x(i-1)) / x(i)) * 100;
        if epsilon(i - 1) < TC
            fprintf("approximate root: %f, iterations: %d", x(i), i - 1);
            break;
        end
        i = i + 1;
    end                            
end

function result = f(x)
    result = exp(-x);
end
