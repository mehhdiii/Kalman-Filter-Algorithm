%% Definitions: 

% System equation is given as:
% Xk = (I + A*T)*X_{k-1} + T*(V_k')
% or 
% Xk = F*X_{k-1} + V_k
% Where T is sampling time and V_k is white random gaussian noise and is defined as follows: 
% V_k ~ (0, Qk)

% Similarly, the sensor observations is governed by the following equation: 
% Yk = H*Xk + W_k
% where Wk is white random gaussian noise and is defined as follows: 
% W_k ~ (0, Rk)

% The sensor measures all 4 observations inside Xk i.e. x_pos, y_pos, v_x, v_y 



%% System 
T = 0.1; %sampling time

A = [0 0 1 0;
     0 0 0 1; 
     0 0 0 0; 
     0 0 0 0]; 

F = eye(4)+A.*T; % system coefficient 

%Defining Covariance matrix of noise vector
var_v1 = T^2 * 10^-5;
var_v2 = T^2 * 10^-5;
covar_vk = [var_v1 0;
            0 var_v2
                    ];
                    
mean_vk = zeros(1, 2); % mean of Vk

vk = mvnrnd(mean_vk, covar_vk, 2); % random noise vector of dim 2x1



%% Sensor
H = eye(4); 

%Defining Covariance matrix of noise vector
var_x1 = 10^-4;
var_y1 = 10^-4;
var_v1 = 10^-6;
var_v2 = 10^-6; 

covar_vk = [var_v1 0;
            0 var_v2
                    ];                    
mean_vk = 0; % mean of Vk
R = mvnrnd(mean_vk, covar_vk, 2); % random noise vector of dim 2x1


%% Kalman Filter Algorithm

% call the function as follows: 
% KalmanFilter(y_k, xhat_last_given_last,P_last_given_last, F, Q, H, R)



 
