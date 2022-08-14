function [W, L, N_a, C_ox, phi_fp, V_T, u_n,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersNchannel

    %p-type silicon substrate
    Temperature = 300;                                                       % K
    n_i = 1.5*10^10;                                                         % cm^-3
    L = 90*10^-7;                                                            % cm
    W = 5*L;                                                                 % cm
    t_ox = 2*10^-7;                                                          % cm  SiO2 material 
    e = 1.6*10^-19;
    Q_ox = 313*5*(10^8)*e;                                                   % C/cm^2
        %source/drain junction
        r_j = 60*10^-7;                                                      % cm
        doping_junction = 2*313*5*10^17;                                     % cm^-3
        area_junction = 4*L*W;                                               % cm^2 (top-view area of the junctions)
    t_gate = 200*10^-7;                                                      % cm
    doping_gate = 2*313*5*10^17;                                               % cm^-3  n+ polysilicon
    N_a = (3+10)*10^17;                                                    % cm^-3
    u_n = 280;                                                               % cm^2/V-s
    % threshold voltage calculations
    C_ox = (3.9)*(8.85*10^-14)/t_ox;                                         % F/cm^2
    phi_fp = .0259*log(N_a/n_i);                                             % V 
    Q_maxDepletion = sqrt(4*e*11.7*8.85*10^-14*N_a*phi_fp);                  % C/cm^2
    phi_ms = -(1.1/2+phi_fp);                                                % V
    V_T = Q_maxDepletion/C_ox-Q_ox/C_ox+phi_ms+2*phi_fp;                     % V
    x_dT = sqrt(4*11.7*8.85*10^-14*phi_fp/(e*N_a));
    V_bi =(0.0259)*log(N_a*doping_junction/n_i^2);
    l = sqrt(x_dT*t_ox*11.7/3.9);
    
end