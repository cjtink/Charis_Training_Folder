function [P_fsp] = FSP_2state_BurstingGene(alpha,n)

clc
clear
% Bursting gene model from previous SSA trainging script
tstop = 100; x0 = [0;0]; t0 = 0; S = [-1,1,0,0,0;0,0,1,-1,1];
% alpha = 100; % This is a parameter to easily play around with the on/off switch
koff = .3*alpha; kon = .1*alpha; gamma = 1; kr = 100;
W0 = [0; kon; 0; 0]; W1 = [koff, 0; -kon, 0; kr, 0; 0, gamma];
% n = 40;

W = @(x) W1*x + W0;

A = spalloc(n+1,n+1,(2*(n+1)));
for j = 1:2*(n+1)
    % My addition:
    x_j = index2state(j, n);
    W_j = W(x_j);
    A(j,j) = -sum(W_j);
    
%     A(j,j) = -sum(W(x(j)));
    for r = 1:4
        k = state2index(x_j+S(:,r),n);
        if k > 0
            i = k;
            A(i, j) = W_j(r);
            
            %             A(i,j) = W(r(x_j));
        end
    end
end



ode_system = @(t,p) A*p;

tspan = [0 tstop]; 

% ICs = x0; This initial condition will yield error

index_x0 = state2index(x0, n);
ICs = zeros(size(A,1), 1);
ICs(index_x0) = 1;


options = optimset('display','off');

[x_vec, y_mat] = ode45(ode_system,tspan,ICs,options);

P = y_mat(end,:);

z = reshape(P,n+1,2);
Z = sum(z,2);

P_fsp = P;

% figure(3)
% hold on
% plot(0:n,Z)

end