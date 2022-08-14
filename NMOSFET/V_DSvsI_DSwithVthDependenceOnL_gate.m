function  V_DSvsI_DSwithVthDependenceOnL_gate
clear;
clc;
    [W, L, N_a, C_ox, phi_fp, V_T, u_n,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersNchannel;
    delta_V_T = -e*N_a*x_dT/C_ox*(r_j/L*(sqrt(1+2*x_dT/r_j)-1));
    V_T = V_T + delta_V_T;
    endPoint = V_T;
    
    i = 1;
    V_GS = 1;

    for V_DS = 0:.05:1.3*(1.3-endPoint)
    
        if V_DS <= V_GS-V_T
            V_DSvalues(i) = V_DS;    
            I_DS(i) = (W*u_n*C_ox/(2*L))*(2*(V_GS-V_T)*V_DS-V_DS^2);            % linear region    
        else
            V_DSvalues(i) = V_DS;
            I_DS(i) = (W*u_n*C_ox/(2*L))*(V_GS-V_T)^2;                      % saturation region                                                 
        end
        i=i+1;
    end
    
    fig1 = figure('Name','I_DS vs V_DS with Vth dependence on L_gate','NumberTitle','off');
    ax1 = axes('Parent', fig1);
    
    plot(ax1, V_DSvalues,I_DS);
    hold on 
    
    i = 1;
    V_GS = 1.3;
    for V_DS = 0:.05:1.3*(V_GS-endPoint)
    
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
    

    [W, L, N_a, C_ox, phi_fp, V_T, u_n,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersNchannel;
    i = 1;
    V_GS = 1;
    for V_DS = 0:.05:1.3*(1.3-endPoint)
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
    for V_DS = 0:.05:1.3*(V_GS-endPoint)
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
    
    legend('V_{GS} = 1 (with V_{th} dependence on L_{gate})', 'V_{GS} = 1.3 (with V_{th} dependence on L_{gate})','V_{GS} = 1 (ideal)', 'V_{GS} = 1.3 (ideal)');
    grid on
    title('I_{DS} with V_{th} dependence on L_{gate} vs V_{DS}');
    xlabel('V_{DS} (V)');
    ylabel('I_{DS} (A)');

end