% FSP 2-State Bursting Gene Model

% Bursting gene model from previous SSA trainging script
tstop = 10000000; x0 = [0;0]; t0 = 0; S = [-1,1,0,0,0;0,0,1,-1,1];
alpha = 100; % This is a parameter to easily play around with the on/off switch
koff = .3*alpha; kon = .1*alpha; gamma = 1; kr = 100;
W0 = [0; kon; 0; 0]; W1 = [koff, 0; -kon, 0; kr, 0; 0, gamma];
n = 200;

W = @(x) W1*x + W0;

A = spalloc(n+1,n+1,(2*(n+1)));
for j = 1:2*(n+1)
    A(j,j) = -sum(W(x(j)));
    for r = 1:4
        k = state2index(x(j)+S(r,:),n);
        if k > 0
            i = k;
            A(i,j) = W(r(x(j)));
        end
    end
end



ode_system = @(t,p) A*p;

tspan = [0 tstop]; 
ICs = x0; 
options = optimset('display','off');

[x_vec, y_mat] = ode45(ode_system,tspan,ICs,options);

P = y_mat(:,end);

plot(P)