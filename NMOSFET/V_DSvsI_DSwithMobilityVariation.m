function  V_DSvsI_DSwithMobilityVariation
clear;
clc;

    [W, L, N_a, C_ox, phi_fp, V_T, u_n,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersNchannel;
    velocity_sat = 10^7;                                                     % cm/s       
    i = 1;
    V_GS = 1;

    for V_DS = 0:.05:1.3*(1.3-V_T)
    
    Q_inversion = C_ox*(V_GS-V_T);                                           % C/cm^2    
    E_effective = (1/(11.7*8.85*10^-14))*(Q_maxDepletion + Q_inversion);     % effective transverse electric field
    u_effective = (700/(10^(-5/3)))*(E_effective)^(-1/3);                    % due to effective transverse electric field
    E_c = 2*velocity_sat/u_effective;
        
    E_horizontal = V_DS/L; 
    u = u_effective/(1+(u_effective*E_horizontal/velocity_sat)^2)^(1/2);
    satPoint = saturationPoint(V_GS);
    
        if V_DS <= satPoint
            V_DSvalues(i) = V_DS;    
            I_DS(i) = (W*u*C_ox/(2*L))*(2*(V_GS-V_T)*V_DS-V_DS^2);          % linear region    
        else
            V_DSvalues(i) = V_DS;
            E_horizontal = satPoint/L; 
            u = u_effective/(1+(u_effective*E_horizontal/velocity_sat)^2)^(1/2);
            I_DS(i) = (W*u*C_ox/(2*L))*(2*(V_GS-V_T)*satPoint-satPoint^2);  % saturation region           ;
        end
        i=i+1;
    end
    
    fig1 = figure('Name','I_DS vs V_DS with Mobility Variation','NumberTitle','off');
    ax1 = axes('Parent', fig1);
    
    plot(ax1, V_DSvalues,I_DS);
    hold on 
    
    i = 1;
    V_GS = 1.3;
    for V_DS = 0:.05:1.3*(V_GS-V_T)
    
    Q_inversion = C_ox*(V_GS-V_T);                                           % C/cm^2    
    E_effective = (1/(11.7*8.85*10^-14))*(Q_maxDepletion + Q_inversion);     % effective transverse electric field
    u_effective = (700/(10^(-5/3)))*(E_effective)^(-1/3);                    % due to effective transverse electric field
    E_c = 2*velocity_sat/u_effective;
        
    E_horizontal = V_DS/L; 
    u = u_effective/(1+(u_effective*E_horizontal/velocity_sat)^2)^(1/2);
    satPoint = saturationPoint(V_GS);
    
        if V_DS <= satPoint
            V_DSvalues(i) = V_DS;    
            I_DS(i) = (W*u*C_ox/(2*L))*(2*(V_GS-V_T)*V_DS-V_DS^2);          % linear region    
        else
            V_DSvalues(i) = V_DS;
            E_horizontal = satPoint/L; 
            u = u_effective/(1+(u_effective*E_horizontal/velocity_sat)^2)^(1/2);
            I_DS(i) = (W*u*C_ox/(2*L))*(2*(V_GS-V_T)*satPoint-satPoint^2);  % saturation region           ;
        end
        i=i+1;
    end    
    
    
     plot(ax1, V_DSvalues,I_DS);
    hold on
    

    [W, L, N_a, C_ox, phi_fp, V_T, u_n,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersNchannel;
    i = 1;
    V_GS = 1;
    for V_DS = 0:.05:1.3*(1.3-V_T)
        if V_DS <= V_GS-V_T
            V_DSvalues(i) = V_DS;    
            I_DS(i) = (W*u_n*C_ox/(2*L))*(2*(V_GS-V_T)*V_DS-V_DS^2);            % linear region    
        else
            V_DSvalues(i) = V_DS;
            I_DS(i) = (W*u_n*C_ox/(2*L))*(V_GS-V_T)^2;                      % saturation region                                                 
        end
        i=i+1;
    end

    plot(ax1, V_DSvalues,I_DS);
    hold on 
    
    i = 1;
    V_GS = 1.3;
    for V_DS = 0:.05:1.3*(V_GS-V_T)
        if V_DS <= V_GS-V_T
            V_DSvalues(i) = V_DS;    
            I_DS(i) = (W*u_n*C_ox/(2*L))*(2*(V_GS-V_T)*V_DS-V_DS^2);            % linear region    
        else
            V_DSvalues(i) = V_DS;
            I_DS(i) = (W*u_n*C_ox/(2*L))*(V_GS-V_T)^2;                      % saturation region                                                 
        end
        i=i+1;
    end    
    
    
     plot(ax1, V_DSvalues,I_DS);
    hold off    
    
    legend('V_{GS} = 1 (with Mobility Variation)', 'V_{GS} = 1.3 (with Mobility Variation)','V_{GS} = 1 (ideal)', 'V_{GS} = 1.3 (ideal)');
    grid on
    ylim([-inf 14*10^-4]);
    title('I_{DS} with Mobility Variation vs V_{DS}');
    xlabel('V_{DS} (V)');
    ylabel('I_{DS} (A)');

end