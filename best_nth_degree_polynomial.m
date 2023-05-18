function best_nth_degree_polynomial()
    sympref('FloatingPointOutput', true);
    data = take_data_from_user();
    n = length(data);
    degree = 3;
    sum_of_xk = zeros(2*degree + 1, 1);
    Y = zeros(degree + 1, 1);
    for k = 1: 1: n
        xk = data(k, 1);
        yk = data(k, 2);
        for row = 0: 1: (2*degree)
            sum_of_xk(row + 1, 1) = sum_of_xk(row + 1, 1) + (xk ^ row);
            if (row <= degree)
                Y(row + 1, 1) = Y(row + 1, 1) + (xk ^ row) * yk;
            end
        end
    end
    X = coefficient_matrix(degree, sum_of_xk);
    coefficients = linsolve(X, Y);
    best_polynomial = polynomial(degree, coefficients);
    fprintf("Best n-th polynomial for n = %d is: ", degree);
    best_polynomial
    plot_all(best_polynomial, data);
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

function plot_all(best_polynomial, data)
    x1 = data(:, 1);
    x2 = linspace(min(x1), max(x1), 100);
    y1 = data(:, 2);
    y2 = subs(best_polynomial, x2);
    L1 = plot(x1, y1, 'o');
    hold on
    L2 = plot(x2, y2, '--');
    legend([L1, L2], ["exact points", "best polynomial"]);
    hold off
end
