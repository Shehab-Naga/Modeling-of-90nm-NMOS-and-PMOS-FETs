function  V_DSvsI_DSwithCLM
clear;
clc;

    [W, L, N_a, C_ox, phi_fp, V_T, u_n,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersNchannel;
    i = 1;
    V_GS = 1;
    for V_DS = 0:.05:2*(1.3-V_T)
        if V_DS <= V_GS-V_T
            V_DSvalues(i) = V_DS;    
            I_DS(i) = (W*u_n*C_ox/(2*L))*(2*(V_GS-V_T)*V_DS-V_DS^2);            % linear region    
        else
            V_DSvalues(i) = V_DS;
            delta_L = sqrt(2*11.7*8.85*10^-14/(e*N_a))*(sqrt(phi_fp + V_DS)-sqrt(phi_fp + V_GS-V_T));
            I_DS(i) = (L/(L-delta_L))*(W*u_n*C_ox/(2*L))*(V_GS-V_T)^2;                             % saturation region           ;
        end
        i=i+1;
    end
    
    fig1 = figure('Name','I_DS vs V_DS with CLM','NumberTitle','off');
    ax1 = axes('Parent', fig1);
    
    plot(ax1, V_DSvalues,I_DS);
    hold on 
    
    i = 1;
    V_GS = 1.3;
    for V_DS = 0:.05:2*(V_GS-V_T)
        if V_DS <= V_GS-V_T
            V_DSvalues(i) = V_DS;    
            I_DS(i) = (W*u_n*C_ox/(2*L))*(2*(V_GS-V_T)*V_DS-V_DS^2);            % linear region    
        else
            V_DSvalues(i) = V_DS;
            delta_L = sqrt(2*11.7*8.85*10^-14/(e*N_a))*(sqrt(phi_fp + V_DS)-sqrt(phi_fp + V_GS-V_T));
            I_DS(i) = (L/(L-delta_L))*(W*u_n*C_ox/(2*L))*(V_GS-V_T)^2;                             % saturation region           ;
        end
        i=i+1;
    end    
    
    
     plot(ax1, V_DSvalues,I_DS);
    hold off 
    
    legend('V_{GS} = 1', 'V_{GS} = 1.3');
    grid on
    ylim([-inf 16*10^-4]);
    title('I_{DS} with CLM vs V_{DS}');
    xlabel('V_{DS} (V)');
    ylabel('I_{DS} (A)');

end