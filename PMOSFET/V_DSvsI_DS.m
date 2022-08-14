function  V_DSvsI_DS
clear;
clc;

    [W, L, N_d, C_ox, phi_fn, V_T, u_p,e,Q_maxDepletion, r_j, x_dT, V_bi, l] = deviceParametersPchannel;
    i = 1;
    V_GS = -1;
    for V_DS = 0:.05:1.3*(1.3-V_T)
        if V_DS <= -V_GS+V_T
            V_DSvalues(i) = -V_DS;    
            I_DS(i) = -(W*u_p*C_ox/(2*L))*(2*(-V_GS+V_T)*V_DS-V_DS^2);            % linear region    
        else
            V_DSvalues(i) = -V_DS;
            I_DS(i) = -(W*u_p*C_ox/(2*L))*(-V_GS+V_T)^2;                      % saturation region                                                 
        end
        i=i+1;
    end
    
    fig1 = figure('Name','I_DS vs V_DS','NumberTitle','off');
    ax1 = axes('Parent', fig1);
    
    plot(ax1, V_DSvalues,I_DS, -(-V_GS+V_T), -(W*u_p*C_ox/(2*L))*(-V_GS+V_T)^2);
    hold on 
    
    i = 1;
    V_GS = -1.3;
    for V_DS = 0:.05:1.3*(-V_GS-V_T)
        if V_DS <= -V_GS+V_T
            V_DSvalues(i) = -V_DS;    
            I_DS(i) = -(W*u_p*C_ox/(2*L))*(2*(-V_GS+V_T)*V_DS-V_DS^2);            % linear region    
        else
            V_DSvalues(i) = -V_DS;
            I_DS(i) = -(W*u_p*C_ox/(2*L))*(-V_GS+V_T)^2;                      % saturation region                                                 
        end
        i=i+1;
    end    
    
    
     plot(ax1, V_DSvalues,I_DS, -(-V_GS+V_T), -(W*u_p*C_ox/(2*L))*(-V_GS+V_T)^2, 'X');
    hold off 
    
    legend('V_{GS} = -1', 'V_{GS} = -1.3');
    grid on
%    ylim([-inf 14*10^-4]);
    title('I_{DS} vs V_{DS}');
    xlabel('V_{DS} (V)');
    ylabel('I_{DS} (A)');

end