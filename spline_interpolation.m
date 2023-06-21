function spline_interpolation()
    sympref('FloatingPointOutput', true);
    polynomials = {};
    % data = take_data_from_user();
    data = zeros(75, 2);
    data(:, 1) = 1: 1: 75;
    data(:, 2) = log10(data(:, 1));
    n = length(data);
    degree = 2;
    for t = 1: degree: (n - 1)
        A = zeros(2*degree + 1, 1);
        B = zeros(degree + 1, 1);
        for k = t: 1: (t + degree)
            xk = data(k, 1);
            yk = data(k, 2);
            for row = 0: 1: (2*degree)
                A(row + 1, 1) = A(row + 1, 1) + (xk ^ row);
                if (row <= degree)
                    B(row + 1, 1) = B(row + 1, 1) + (xk ^ row) * yk;
                end
            end
        end
        A = coefficient_matrix(degree, A);
        variables = linsolve(A, B);
        best_polynomial = polynomial(degree, variables);
        polynomials{floor(t/degree) + 1} = best_polynomial;
    end
    plot_all(polynomials, data, degree);
end

function data = take_data_from_user()
    n = input("Number of Data Points: ");
    data = zeros(n, 2);
    for row = 1: 1: n
        fprintf("x%d: ", row);
        data(row, 1) = input("");
        fprintf("y%d: ", row);
        data(row, 2) = input("");
    end
end

function A = coefficient_matrix(degree, sum_of_xk)
    A = zeros(degree+1, degree+1);
    for row = 1: 1: (degree + 1)
        power = (degree + row);
        for column = 1: 1: (degree + 1)
            A(row, column) = sum_of_xk(power);
            power = power - 1;
        end
    end
end

function P = polynomial(degree, variables)
    syms x
    P = 0;
    for row = 1: 1: (degree + 1)
        P = P + variables(row) * x^(degree - row + 1);
    end
end

function plot_all(polynomials, data, degree)
    x1 = data(:, 1);
    y1 = data(:, 2);
    x2 = linspace(min(x1), max(x1), 100);
    for t = 1: degree: (length(data) - 1)
        x2 = linspace(x1(t), x1(t+degree), 10);
        polynomial = polynomials{floor(t/degree) + 1};
        y2 = subs(polynomial, x2);
        L2 = plot(x2, y2, '-');
        hold on
    end
    L1 = plot(x1, y1, 'o');
    hold on
end
