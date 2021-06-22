function [yhat_predict, K_k] ...
    = measurement_predict(xhat_predict,P_predict, H, Rk)
%Calculates the measurement's prediction in KF algorithm

yhat_predict = H*xhat_predict; 
S_k = H*P_predict * H' + Rk; 
K_k = (P_predict* H')*inv(S_k); 
end