function seidel()
    t = [input('t0: ')];
    a = [input('a0: ')];
    TC = input('TC: ');
    error = TC + 1;
    i = 1;
    while error > TC
        t(i + 1) = f(t(i), a(i));
        a(i + 1) = g(t(i + 1), a(i));
        error_of_t = abs((t(i + 1) - t(i)) / t(i + 1)) * 100;
        error_of_a = abs((a(i + 1) - a(i)) / a(i + 1)) * 100;
        error =  max(error_of_t, error_of_a);
        i = i + 1;
    end   
    fprintf("number of iterations: %d\n", i);
    fprintf("t: %f\n", t(i));
    fprintf("α: %f\n", a(i));
end

function t = f(t, a)
    t = (8.02 - cos(a)*t) / 2;
end

function a = g(t, a)
    a = (asin(-0.3040*t + 1.6) + a) / 2;
end
    