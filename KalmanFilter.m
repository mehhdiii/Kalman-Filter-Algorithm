function [xhat_k, P_k] ...
    = KalmanFilter(y_k, xhat_last, P_last, F, Qk, H, Rk)
%The Kalman Filter Algorithm: 
% Inputs (In order):
% yk: measurement at time k 
% xhat_last_given_last: Optimal estimate at time k - 1
% P_last_given_last: Covariance matrix of X at time k-1
% F, Q: System and its noise Covariance matrix
% H, R: Sensor and its noise Covariance matrix
%
%Outputs: 
% xhat_k_given_k: Optimal estimate at time k
% P_k_given_k: Variance of X at time k 


[xhat_predict, P_predict] = state_predict(xhat_last ,P_last, F, Qk); 
[yhat_predict, K_k] = measurement_predict(xhat_predict,P_predict, H, Rk); 
xhat_k = xhat_predict + K_k*(y_k - yhat_predict); 
P_k = P_predict - K_k*H*P_predict; 

end