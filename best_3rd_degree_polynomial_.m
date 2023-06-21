function best_nth_degree_polynomial()
    sympref('FloatingPointOutput', true);
    data = take_data_from_user();
    n = length(data);
    degree = 3;
    A = zeros(2*degree + 1, 1);
    B = zeros(degree + 1, 1);
    for k = 1: 1: n
        xk = data(k, 1);
        yk = data(k, 2);
        for row = 0: 1: (2*degree)
            A(row + 1, 1) = A(row + 1, 1) + xk ^ (row);
            if (row <= degree)
                B(row + 1, 1) = B(row + 1, 1) + (xk ^ row) * yk;
            end
        end
    end
    A = coefficient_matrix(degree, A);
    variables = linsolve(A, B);
    best_polynom = polynom(degree, variables);
    fprintf("Best n-th polynomial for n = %d is: ", degree);
    best_polynom
    plot_all(best_polynom, data)
end

function data = take_data_from_user()
    n = input("Number of Data Points: ");
    data = zeros(n, 2);
    for i = 1: 1: n
        fprintf("x%d: ", i);
        data(i, 1) = input("");
        fprintf("y%d: ", i);
        data(i, 2) = input("");
    end
end

function A = coefficient_matrix(degree, powers_of_x)
    A = zeros(degree+1, degree+1);
    for row = 1: 1: (degree + 1)
        power = (degree + row);
        for column = 1: 1: (degree + 1)
            A(row, column) = powers_of_x(power);
            power = power - 1;
        end
    end
end

function P = polynom(degree, variables)
    syms x
    P = 0 == 0;
    for row = 1: 1: (degree + 1)
        P = P + variables(row) * x^(degree - row + 1);
    end
end

function plot_all(best_polynom, data)
    x = data(:, 1);
    y_real = data(:, 2);
    y_best = subs(best_polynom, x);
    L1 = plot(x, y_real);
    hold on
    L2 = plot(x, y_best);
    legend([L1, L2], ["real", "best"]);
    hold off
end
