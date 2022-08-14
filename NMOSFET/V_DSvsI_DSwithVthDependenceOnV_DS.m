function  V_DSvsI_DSwithVthDependenceOnV_DS
clear;
clc;
    [W, L, N_a, C_ox, phi_fp, V_T, u_n,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersNchannel;
        
    i = 1;
    V_GS = 1;

    for V_DS = 0:.05:1.3*(1.3-V_T)
        delta_V_T = -(2*(V_bi-2*phi_fp)+V_DS)*(exp(-L/(2*l))+exp(-L/l));
        satPoint = saturationPoint3(V_GS);
        if V_DS <= satPoint
            V_DSvalues(i) = V_DS;    
            I_DS(i) = (W*u_n*C_ox/(2*L))*(2*(V_GS-(V_T+delta_V_T))*V_DS-V_DS^2);            % linear region    
        else
            V_DSvalues(i) = V_DS;
            I_DS(i) = (W*u_n*C_ox/(2*L))*(2*(V_GS-(V_T-(2*(V_bi-2*phi_fp)+satPoint)*(exp(-L/(2*l))+exp(-L/l))))*satPoint-satPoint^2);                      % saturation region                                                 
        end
        i=i+1;
    end

    fig1 = figure('Name','I_DS vs V_DS with Vth dependence on V_DS','NumberTitle','off');
    ax1 = axes('Parent', fig1);
    
    plot(ax1, V_DSvalues,I_DS);
    hold on 
    
    i = 1;
    V_GS = 1.3;
    for V_DS = 0:.05:1.3*(V_GS-V_T)
        delta_V_T = -(2*(V_bi-2*phi_fp)+V_DS)*(exp(-L/(2*l))+exp(-L/l));
        satPoint = saturationPoint3(V_GS);
        if V_DS <= satPoint
            V_DSvalues(i) = V_DS;    
            I_DS(i) = (W*u_n*C_ox/(2*L))*(2*(V_GS-(V_T+delta_V_T))*V_DS-V_DS^2);            % linear region    
        else
            V_DSvalues(i) = V_DS;
            I_DS(i) = (W*u_n*C_ox/(2*L))*(2*(V_GS-(V_T-(2*(V_bi-2*phi_fp)+satPoint)*(exp(-L/(2*l))+exp(-L/l))))*satPoint-satPoint^2);                      % saturation region                                                 
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
    
    legend('V_{GS} = 1 (with V_{th} dependence on V_{DS})', 'V_{GS} = 1.3 (with V_{th} dependence on V_{DS})','V_{GS} = 1 (ideal)', 'V_{GS} = 1.3 (ideal)');
    grid on
    ylim([-inf 14.9*10^-4]);
    title('I_{DS} with V_{th} dependence on V_{DS} vs V_{DS}');
    xlabel('V_{DS} (V)');
    ylabel('I_{DS} (A)');

end