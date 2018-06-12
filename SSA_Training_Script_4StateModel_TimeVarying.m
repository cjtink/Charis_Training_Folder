%SSA Training Script for a 4 state model
clear
clc

% Four State Model
tstop = 1000; x0 = [1;0;0;0;0]; t0 = 190;
alpha = 1; % This is a parameter to easily play around with the on/off switch
% Gene State Switching Constants
k12 = 1.3*alpha; k21 = 3200*alpha; k23 = .0067*alpha; k32 = 0.027*alpha;
k34 = .13*alpha; k43 = .038*alpha;
% RNA creation constants 
kr1 = 0.00078; kr2 = 0.012; kr3 = 0.99; kr4 = 0.054; gamma = 0.0049; 

% Time varying component
k21a = k21*1;
k21b = k21*2.4;
A = 9.3e9; n = 3.1; M = 6.4e-4;
r1 = 6.9e-5; r2 = 7.1e-3; %1/s
hog1t = @(t) A*(((1-exp(-r1*t)*exp(-r2*t))/(1+(((1-exp(12*t))*exp(-r2*t))/M)))^n);
Wt = @(t)(k21a - k21b*hog1t(t));
i = 2;

% Stoichiometry Matrix
S = [-1,1,0,0,0,0,0,0,0,0,0;
     1,-1,-1,1,0,0,0,0,0,0,0;
     0,0,1,-1,-1,1,0,0,0,0,0;
     0,0,0,0,1,-1,0,0,0,0,0;
     0,0,0,0,0,0,1,1,1,1,-1];


% Propensity W1 with sparse function
i_W1 = [1,2,3,4,5,6,7,8,9,10,11];
j_W1 = [1,2,2,3,3,4,1,2,3,4,5];
value_W1 = [k12, k21, k23, k32, k34, k43, kr1, kr2, kr3, kr4, gamma];

W1 = sparse(i_W1,j_W1,value_W1);

W0 = [0;0;0;0;0;0;0;0;0;0;0]; 
[x, xstor,tstor] = SSA_tv(tstop, x0, t0, S, W1, W0, Wt, i);

figure(1)
plot(tstor,xstor(5,:))
title('Class I: RNA Changes with time')
xlabel('Time')
ylabel('RNA')

figure(2)
plot(tstor,xstor(1,:),tstor,xstor(2,:),tstor,xstor(3,:),tstor,xstor(4,:))
title('On/Off Check')
legend('S1','S2','S3','S4')





