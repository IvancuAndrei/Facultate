function [g_nodes, g_coeff] = Gauss_Jacobi_ab(n, alpha, beta, a, b)
    [g_nodes_j, g_coeff_j] = Gauss_Jacobi(n, alpha, beta);
    g_nodes = (b-a)/2 * (g_nodes_j + 1) + a;
    g_coeff = g_coeff_j * ((b-a)/2)^(alpha+beta+1);
end