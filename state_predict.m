function [xhat_predict, P_predict] ...
    = state_predict(xhat_last ,P_last, F, Qk)

%Calculates the prediction of KF algorithm
%xhat: The optimal estimate for k-1
%var_last: Variance of the k-1th optimal estimate
%F: Plant's matrix
%Q: Variance in plant

xhat_predict = F*xhat_last; % xhat_k|k-1 = F * xhat_k-1|k-1
P_predict = F*P_last*F' + Qk; 

end

