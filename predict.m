function [xhat_k_given_last, P_k_given_last] = predict(xhat_last_given_last ,P_last, F, Q)
%Calculates the prediction of KF algorithm
%xhat: The optimal estimate for k-1
%var_last: Variance of the k-1th optimal estimate
%F: Plant's matrix
%Q: Variance in plant

xhat_k_given_last = F*xhat_last_given_last; % xhat_k|k-1 = F * xhat_k-1|k-1
P_k_given_last = F*P_last*F' + Q; 
end

