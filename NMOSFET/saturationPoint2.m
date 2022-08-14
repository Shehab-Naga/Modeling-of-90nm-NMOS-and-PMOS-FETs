function satPoint = saturationPoint2(V_GS)
    [W, L, N_a, C_ox, phi_fp, V_T, u_n,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersNchannel;
    velocity_sat = 10^7;                                                     % cm/s       
    E_c = velocity_sat/u_n;

    syms V_DS

    satPoint = fzero(matlabFunction(diff((W*u_n*C_ox/(2*L))*(2*(V_GS-V_T)*V_DS-V_DS^2)*1/(1+V_DS/(L*E_c)))), 0);

end