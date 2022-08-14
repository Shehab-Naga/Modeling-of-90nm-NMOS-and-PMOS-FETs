function G_mvsV_GS

    [W, L, N_a, C_ox, phi_fp, V_T, u_n,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersNchannel;
    
    i = 1;
    V_DS = .1;
    for V_GS = V_T:.01:1.3*(1.3 + V_T)
        if (V_GS >= V_T) && (V_GS < V_DS + V_T)
            V_GSvalues(i) = V_GS;  
            G_m(i) = u_n*C_ox*W/L*(V_GS-V_T);                               % saturation region    
        elseif V_GS >= V_DS + V_T
            V_GSvalues(i) = V_GS;
            G_m(i) = W*u_n*C_ox/L*V_DS;                                     % linear region                                                 
        end
        i=i+1;
    end
    
    fig3 = figure('Name','G_m vs V_GS','NumberTitle','off');
    ax3 = axes('Parent', fig3);
    
    plot(ax3, V_GSvalues,G_m);
    hold on 
    
    i = 1;
    V_DS = 1.3;
    for V_GS = V_T:.01:1.3*(V_DS+V_T)
        if (V_GS >= V_T) && (V_GS < V_DS + V_T)
            V_GSvalues(i) = V_GS;  
            G_m(i) = u_n*C_ox*W/L*(V_GS-V_T);                               % saturation region    
        elseif V_GS >= V_DS + V_T
            V_GSvalues(i) = V_GS;
            G_m(i) = W*u_n*C_ox/L*V_DS;                                     % linear region                                                 
        end
        i=i+1;
    end
    
    plot(ax3, V_GSvalues,G_m);
    hold off
    
    legend(ax3,'V_{DS} = .1 V', 'V_{DS} = 1.3 V');
    grid on
    title(ax3,'G_m vs V_{GS}');
    xlabel(ax3,'V_{GS} (V)');
    ylabel(ax3,'G_m (S)');
  
end