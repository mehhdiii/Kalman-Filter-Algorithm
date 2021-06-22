function [yhat_k_given_last,S_k] = measurement_predict(xhat_k_given_last,P_k_given_last, H, R)
%Calculates the measurement's prediction in KF algorithm

yhat_k_given_last = H*xhat_k_given_last; 
S_k = H*P_k_given_last * H' + R; 

end

