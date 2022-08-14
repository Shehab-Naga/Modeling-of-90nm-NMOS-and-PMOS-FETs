function [W, L, N_d, C_ox, phi_fn, V_T, u_p,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersPchannel

    %p-type silicon substrate
    Temperature = 300;                                                       % K
    n_i = 1.5*10^10;                                                         % cm^-3
    L = 90*10^-7;                                                            % cm
                             W = 10*L;                                                                 % cm
    t_ox = 2*10^-7;                                                          % cm  SiO2 material 
    e = 1.6*10^-19;
    Q_ox = 313*5*(10^8)*e;                                                   % C/cm^2
        %source/drain junction
        r_j = 60*10^-7;                                                      % cm
        doping_junction = 2*313*5*10^17;                                     % cm^-3
        area_junction = 4*L*W;                                               % cm^2 (top-view area of the junctions)
    t_gate = 200*10^-7;                                                      % cm
                             doping_gate = 2*313*5*10^17;                                               % cm^-3  P+ polysilicon
    N_d = (3+10)*10^17;                                                    % cm^-3
                             u_p = 131;                                                               % cm^2/V-s
    % threshold voltage calculations
    C_ox = (3.9)*(8.85*10^-14)/t_ox;                                         % F/cm^2
    phi_fn = .0259*log(N_d/n_i);                                             % V 
    Q_maxDepletion = sqrt(4*e*11.7*8.85*10^-14*N_d*phi_fn);                  % C/cm^2
                            phi_ms = (1.1/2+phi_fn);                                                % V
    V_T = -Q_maxDepletion/C_ox-Q_ox/C_ox+phi_ms-2*phi_fn;                     % V
    x_dT = sqrt(4*11.7*8.85*10^-14*phi_fn/(e*N_d));
    V_bi =(0.0259)*log(N_d*doping_junction/n_i^2);
    l = sqrt(x_dT*t_ox*11.7/3.9);
    
end