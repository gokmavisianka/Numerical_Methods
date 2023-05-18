function simpsons_3over8_rule()
    a = input('a: ');
    b = input('b: ');
    N = floor(input('N: ')/3)*3;
    h = (b - a) / N;
    x = @(i) a + (i)*h;
    f = @(x) cos(x)*exp(-2*x);
    approximate_value = 0;
    for j = 1: 1: round(N / 3)
        approximate_value = approximate_value + f(x(3*j - 3)) + 3*f(x(3*j - 2)) + 3*f(x(3*j - 1)) + f(x(3*j));
    end
    syms x
    real_value = int(f(x), a, b);
    approximate_value = (3*h / 8) * approximate_value;
    relative_error = abs((real_value - approximate_value) / real_value) * 100;
    fprintf('real value: %f\n', real_value);
    fprintf('approximate value: %f\n', approximate_value);
    fprintf('relative error: %f\n', relative_error);
end
