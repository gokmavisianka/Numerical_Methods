function bisection()
    xl = input('xl: ');
    xu = input('xu: ');
    TC = input('TC: ');
    if f(xl)*f(xu)<0
        epsilon = [];
        xr = [];
        i = 1;
        while true
            xr(i) = (xl + xu) / 2;
            temp = f(xl) * f(xr(i));
                
            if temp > 0
                xl = xr(i);
            elseif temp < 0
                xu = xr(i);
            end
                
            if i > 2
                epsilon(i - 1) = abs((xr(i) - xr(i-1)) / xr(i)) * 100;
                if epsilon(i - 1) < TC
                    fprintf("approximate root: %f, iterations: %d", xr(i), i);
                    break;
                end
            end
            i = i + 1;
        end                            
    end
end

function result = f(x)
    result = exp(-x) - x;
end
