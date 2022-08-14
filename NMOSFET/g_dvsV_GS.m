function g_dvsV_GS
clear;
clc;

    [W, L, N_a, C_ox, phi_fp, V_T, u_n,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersNchannel;
    
    i = 1;
    V_DS = .1;
    for V_GS = 0:.01:1.3*(1.3 + V_T)
        if (V_GS >= 0) && (V_GS < V_DS + V_T)
            V_GSvalues(i) = V_GS;  
            g_d(i) = 0;                                                     % saturation region    
        elseif V_GS >= V_DS + V_T
            V_GSvalues(i) = V_GS;
            g_d(i) = W*u_n*C_ox/L*(V_GS-V_T-V_DS);                          % linear region                                                 
        end
        i=i+1;
    end
    
    fig3 = figure('Name','g_d vs V_GS','NumberTitle','off');
    ax3 = axes('Parent', fig3);
    
    plot(ax3, V_GSvalues,g_d);
    hold on 
    
    i = 1;
    V_DS = 1.3;
    for V_GS = 0:.01:1.3*(V_DS+V_T)
        if (V_GS >= 0) && (V_GS < V_DS + V_T)
            V_GSvalues(i) = V_GS;  
            g_d(i) = 0;                                                     % saturation region    
        elseif V_GS >= V_DS + V_T
            V_GSvalues(i) = V_GS;
            g_d(i) = W*u_n*C_ox/L*(V_GS-V_T-V_DS);                          % linear region                                                 
        end
        i=i+1;
    end
    
    plot(ax3, V_GSvalues,g_d);
    hold off
    
    legend(ax3,'V_{DS} = .1 V', 'V_{DS} = 1.3 V');
    grid on
    title(ax3,'g_d vs V_{GS}');
    xlabel(ax3,'V_{GS} (V)');
    ylabel(ax3,'g_d (S)');
  
end