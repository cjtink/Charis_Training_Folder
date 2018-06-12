% SSA Training Script for a 4 state model
clear
clc

% Four State Model
tstop = 10000; x0 = [1;0;0;0;0]; t0 = 0;
alpha = .01; % This is a parameter to easily play around with the on/off switch
% Gene State Switching Constants
k12 = .3*alpha; k21 = .1*alpha; k23 = .3*alpha; k32 = 0.1*alpha;
k34 = .3*alpha; k43 = .1*alpha;
% RNA creation constants 
kr1 = 10; kr2 = 20; kr3 = 40; kr4 = 80; gamma = 1; 

% Stoichiometry Matrix with sparse function
i_s = [1,1,2,2,2,2,3,3,3,3,4,4,5,5,5,5,5];
j_s = [1,2,1,2,3,4,3,4,5,6,5,6,7,8,9,10,11];
value_s = [-1,1,1,-1,-1,1,1,-1,-1,1,1,-1,1,1,1,1,-1];

S = sparse(i_s,j_s,value_s);

% Propensity W1 with sparse function
i_W1 = [1,2,3,4,5,6,7,8,9,10,11];
j_W1 = [1,2,2,3,3,4,1,2,3,4,5];
value_W1 = [k12, k21, k23, k32, k34, k43, kr1, kr2, kr3, kr4, gamma];

W1 = sparse(i_W1,j_W1,value_W1);

W0 = [0;0;0;0;0;0;0;0;0;0;0]; 
[x, xstor,tstor] = SSA_tv(tstop, x0, t0, S, W1, W0,[],[]);

figure(1)
plot(tstor,xstor(5,:))
title('Class I: RNA Changes with time')
xlabel('Time')
ylabel('RNA')

figure(2)
plot(tstor,xstor(1,:),tstor,xstor(2,:),tstor,xstor(3,:),tstor,xstor(4,:))
title('On/Off Check')
legend('S1','S2','S3','S4')

% for i = 1:500
% 
%     [x_C1(:,i)] = SSA(tstop, x0, t0, S, W1, W0);
%    
% end
%   
% [N1,X1] = hist(x_C1(2,:),50);
% 
% figure(3)
% plot(X1,N1)
% hold on
% histogram(x_C1(2,:),50)
% title('Class I: Probability of RNA at t-stop')
% xlabel('RNA')
% ylabel('Probability')
% hold off



