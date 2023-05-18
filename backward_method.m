function backward_method()
    m = 3;
    n = 2;
    mesh_points = m + n;
    A = zeros(mesh_points, mesh_points);
    B = zeros(mesh_points, 1);
    B((n + 1), 1) = 1;
    for i = mesh_points: -1: 1
        c = -(i - 1);
        A(:, i) = taylor_series_expansion(c, mesh_points);
    end
    coefficients = linsolve(A, B);
    coefficients
end

function matrix = taylor_series_expansion(c, mesh_points)
    matrix = zeros(1, mesh_points);
    for n = 0: 1: (mesh_points - 1)
        matrix(1, n + 1) = (c^n) / factorial(n);
    end
end
