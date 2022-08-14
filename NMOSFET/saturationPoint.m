function satPoint = saturationPoint(V_GS)
    [W, L, N_a, C_ox, phi_fp, V_T, u_n,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersNchannel;
    velocity_sat = 10^7;                                                     % cm/s       
    syms V_DS
        Q_inversion = C_ox*(V_GS-V_T);                                           % C/cm^2    
    E_effective = (1/(11.7*8.85*10^-14))*(Q_maxDepletion + Q_inversion);     % effective transverse electric field
    u_effective = (700/(10^(-5/3)))*(E_effective)^(-1/3);                    % due to effective transverse electric field
    E_c = 2*velocity_sat/u_effective;
        
    E_horizontal = V_DS/L; 
    u = u_effective/(1+(u_effective*E_horizontal/velocity_sat)^2)^(1/2);
    satPoint = fzero(matlabFunction(diff((W*u*C_ox/(2*L))*(2*(V_GS-V_T)*V_DS-V_DS^2))), 0);

end