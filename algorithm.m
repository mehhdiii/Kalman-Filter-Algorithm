%% Definition: 

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

%% Sensor
H = eye(4); 




 