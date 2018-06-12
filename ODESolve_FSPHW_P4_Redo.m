% ODE Solver
close all
clear
clc


tstart1 = tic;
n = 5000;
e1 = zeros(n,1);
e1(1) = 1;
k = 100;
gamma = 0.1;
An = A_n_spdiags(k,gamma,n);

ode_system = @(t,p) An*p;

tspan = [0 10]; 
ICs = e1; 
options = optimset('display','off');

[x_vec, y_mat] = ode45(ode_system,tspan,ICs,options);

P = y_mat(:,end);

plot(P)

time_lapsed1 = toc(tstart1);

tstart2 = tic;
FSPHW_P4()
time_lapsed2 = toc(tstart2);

fprintf('Time lapsed for initial FSPHW_P4 = %1.4f\n',time_lapsed2)
fprintf('Time lapsed for non-function FSPHW_P4 Redo = %1.4f\n', time_lapsed1)
