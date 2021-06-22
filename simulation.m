% % Definitions:

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

clc; clear

% % System
T = 0.1; %sampling time

A = [0 0 1 0;
    0 0 0 1;
    0 0 0 0;
    0 0 0 0];

F = eye(4)+A.*T; % system coefficient

%Defining Covariance matrix of noise vector
var_v1 = T^2 * 1e-3;
var_v2 = T^2 * 1e-3;
Qk = diag([0 0 var_v1 var_v2]);

% % Sensor
H = eye(4);

%Defining Covariance matrix of noise vector
var_x = 1e-4;
var_y = 1e-4;
var_vx = 1e-5;
var_vy = 1e-5;

Rk = diag([var_x, var_y, var_vx, var_vy]);

% % Kalman Filter Algorithm

% call the function as follows:
ITER = 1e3;
xkm1 = zeros(4,1);
xhat_last = zeros(4,1);
P_last = eye(4);
Error2_xk_yk = 0;
Error2_xk_xhatk = 0;
for index = 1:ITER
    vk=sqrt(Qk)*randn(4,1);
    xk = F*xkm1 + vk;
    wk=sqrt(Rk)*randn(4,1);
    yk = H*xk + wk;
    [xhat_k, P_k] = KalmanFilter(yk,xhat_last,P_last,F,Qk,H,Rk);
    xkm1 = xk;
    xhat_last = xhat_k;
    P_last = P_k;
    Error2_xk_yk = sum((xk-yk).^2) + Error2_xk_yk;
    Error2_xk_xhatk = sum((xk-xhat_k).^2) + Error2_xk_xhatk;
    xtrue(index)=xk(1);
    xmeas(index)=yk(1);
    xestd(index)=xhat_k(1);
    
    ytrue(index)=xk(2);
    ymeas(index)=yk(2);
    yestd(index)=xhat_k(2);
end

Error2_xk_yk = Error2_xk_yk/ITER;
Error2_xk_xhatk = Error2_xk_xhatk/ITER;

disp([Error2_xk_yk Error2_xk_xhatk])

P=50;
figure;
plot(xtrue(end:-1:end-P),ytrue(end:-1:end-P),'k-')
hold on
plot(xmeas(end:-1:end-P),ymeas(end:-1:end-P),'ro','markersize',5)
hold on
plot(xestd(end:-1:end-P),yestd(end:-1:end-P),'b--','linewidth',2)
h=legend('True trajectory', 'Measured trajectory', 'Estimated trajectory');
set(h,'fontsize',18);set(gca,'fontsize',18)

