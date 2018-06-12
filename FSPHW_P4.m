function [] = FSPHW_P4()

% This function solves the following ODE system using nested functions with
% the parameterys and the system of equations given.
clear
clc

[e1, An, n] = get_params();
tspan = [0 10]; 
ICs = e1; 
options = optimset('display','off');

[x_vec, y_mat] = ode45(@ode_system,tspan,ICs,options, An, n);
    
time = x_vec;
P = y_mat(:,end);

plot(P)

end


function [dadt] = ode_system(t,a, An, n)

P = a(1:n);
dadt = An*P;

% dadt = [dP];

end


function [e1, An, n] = get_params()
n = 5000;
e1 = zeros(n,1);
e1(1) = 1;

k = 100;
gamma = 0.1;

An = A_n_spdiags(k,gamma,n);
end