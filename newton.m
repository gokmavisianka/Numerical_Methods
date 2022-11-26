function newton()
    x = [input('x0: ')];
    y = [input('y0: ')];
    TC = input('TC: ');
    error = [TC + 1];
    i = 2;
    while true
        M = (f(x(i - 1), y(i - 1)));
        x(i) = M(1);
        y(i) = M(2);
        ex = abs((x(i) - x(i - 1)) / x(i)) * 100;
        ey = abs((y(i) - y(i - 1)) / y(i)) * 100;
        error(i) = max([ex, ey]);
        if error(i) < TC
            fprintf('number of iterations: %d', i - 1);
            [x(i); y(i)]
            break;
        end
        i = i + 1;
    end
end

% J^(-1) = (-1 / (9 + exp(-x) * cos(y))) * [3, cos(y); -exp(-x), 3];
function result = f(x, y)
    result = [x; y] - ( -1 / (9 + exp(-x) * cos(y))) * [3, cos(y); -exp(-x), 3] * [-3*x + sin(y) - 1; exp(-x) - 3*y - 0.4];
end
