function V_GSvsI_DS
clear;
clc;

    [W, L, N_d, C_ox, phi_fn, V_T, u_p,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersPchannel;
    m = 1 + sqrt(11.7*8.85*10^-14*e*N_d/(4*phi_fn))/C_ox;
    
    i = 1;
    V_DS = .1;
    for V_GS = 0:.01:1.3*(1.3-V_T)
        if V_GS < -V_T
            V_GSvalues(i) = -V_GS;  
            I_DS(i) = -u_p*C_ox*W/L*(m-1)*(0.0259)^2*exp((V_GS+V_T)/(0.0259*m))*(1-exp(-V_DS/0.0259));             % subthreshold region    
        elseif (V_GS >= -V_T) && (V_GS < V_DS - V_T)
            V_GSvalues(i) = -V_GS;
            I_DS(i) = -(W*u_p*C_ox/(2*L))*(V_GS+V_T)^2;                                                            % saturation region                                                 
        elseif V_GS >= V_DS - V_T
            V_GSvalues(i) = -V_GS;
            I_DS(i) = -(W*u_p*C_ox/(2*L))*(2*(V_GS+V_T)*V_DS-V_DS^2);                                              % linear region                                                 
        end
        i=i+1;
    end
    
    fig2 = figure('Name','I_DS vs V_GS','NumberTitle','off');
    ax2 = axes('Parent', fig2);
    
    plot(ax2, V_GSvalues,I_DS);
    hold on 
    
    i = 1;
    V_DS = 1.3;
    for V_GS = 0:.01:1.3*(1.3-V_T)
        if V_GS < -V_T
            V_GSvalues(i) = -V_GS;  
            I_DS(i) = -u_p*C_ox*W/L*(m-1)*(0.0259)^2*exp((V_GS+V_T)/(0.0259*m))*(1-exp(-V_DS/0.0259));             % subthreshold region    
        elseif (V_GS >= -V_T) && (V_GS < V_DS - V_T)
            V_GSvalues(i) = -V_GS;
            I_DS(i) = -(W*u_p*C_ox/(2*L))*(V_GS+V_T)^2;                                                            % saturation region                                                 
        elseif V_GS >= V_DS - V_T
            V_GSvalues(i) = -V_GS;
            I_DS(i) = -(W*u_p*C_ox/(2*L))*(2*(V_GS+V_T)*V_DS-V_DS^2);                                              % linear region                                                 
        end
        i=i+1;
    end
    
    plot(ax2, V_GSvalues,I_DS);
    hold off
    
    legend(ax2,'V_{DS} = -.1 V', 'V_{DS} = -1.3 V');
    grid on
    title(ax2,'I_{DS} vs V_{GS}');
    xlabel(ax2,'V_{GS} (V)');
    ylabel(ax2,'I_{DS} (A)');
  
end