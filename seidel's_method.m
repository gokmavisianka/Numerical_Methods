function fixed_point_for_NS()
    x = [input('x0: ')];
    y = [input('y0: ')];
    TC = input('TC: ');
    epsilon = [];
    i = 2;
    while true
        x(i) = f(x(i - 1), y(i - 1));
        y(i) = g(x(i), y(i - 1));
        epsilon(i - 1) = max(abs((x(i) - x(i-1)) / x(i)) * 100, abs((y(i) - y(i-1)) / y(i)) * 100);
        if epsilon(i - 1) < TC
            fprintf("approximate solution: %f, %f, iterations: %d", x(i), y(i), i - 1);
            break;
        end
        i = i + 1;
    end                            
end

function result = f(x, y)
    result = (1 / 4) * (x + sin(y)) - 0.25;
end

function result = g(x, y)
    result = (1 / 4) * (exp(-x) + y) - 0.10;
end
    
