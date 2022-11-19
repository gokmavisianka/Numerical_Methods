function seidel()
    x = [input('x0: ')];
    y = [input('y0: ')];
    z = [input('z0: ')];
    TC = input('TC: ');
    epsilon = [];
    i = 1;
    while true
        x(i + 1) = f(x(i), y(i), z(i));
        y(i + 1) = g(x(i + 1), y(i), z(i));
        z(i + 1) = h(x(i + 1), y(i + 1), z(i));
        ex = abs((x(i + 1) - x(i)) / x(i + 1)) * 100;
        ey = abs((y(i + 1) - y(i)) / y(i + 1)) * 100;
        ez = abs((z(i + 1) - z(i)) / z(i + 1)) * 100;
        epsilon(i) =  max([ex ey ez]);
        if epsilon(i) < TC
            fprintf("number of iterations: %d", i);
            [x(i + 1); y(i + 1); z(i + 1)]
            break;
        end
        i = i + 1;
    end                            
end

function result = f(x, y, z)
    result = (0.25)*(x + sin(y) + exp(-z)) + 1.43;
end

function result = g(x, y, z)
    result = (0.25)*(cos(x) + y - sin(z)) - 0.76;
end

function result = h(x, y, z)
    result = (0.25)*(sin(x) - sin(y) + z) - 0.49;
end
    
