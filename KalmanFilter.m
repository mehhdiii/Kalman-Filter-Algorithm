function [xhat_k_given_k, P_k_given_k] = KalmanFilter(y_k, xhat_last_given_last, P_last_given_last, F, Q, H, R)
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


[xhat_k_given_last, P_k_given_last] = predict(xhat_last_given_last ,P_last_given_last, F, Q); 
[yhat_k_given_last, K_k] = measurement_predict(xhat_k_given_last,P_k_given_last, H, R); 
xhat_k_given_k = xhat_k_given_last + K_k*(y_k - yhat_k_given_last); 
P_k_given_k = P_k_given_last - K_k*H*P_k_given_last; 

end

