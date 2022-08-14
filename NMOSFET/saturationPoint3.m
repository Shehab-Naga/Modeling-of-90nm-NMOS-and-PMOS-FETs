function satPoint = saturationPoint3(V_GS)
    [W, L, N_a, C_ox, phi_fp, V_T, u_n,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersNchannel;

    syms V_DS
    satPoint = fzero(matlabFunction(diff((W*u_n*C_ox/(2*L))*(2*(V_GS-(V_T-(2*(V_bi-2*phi_fp)+V_DS)*(exp(-L/(2*l))+exp(-L/l))))*V_DS-V_DS^2))), 0);

end