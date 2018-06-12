%SSA Training Script for a 4 state model
clear
clc
% Four State Model - Wildtype 0.4M
tstop = 4800; x0 = [1;0;0;0;0]; t0 = 190;
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
r1 = 6.9e-5; r2 = 3.6e-3; %1/s

% % Four State Model - Hot1p
% tstop = 1000; x0 = [1;0;0;0;0]; t0 = 190;
% alpha = 1; % This is a parameter to easily play around with the on/off switch
% % Gene State Switching Constants
% k12 = 1.3*alpha; k21 = 1100*alpha; k23 = .0045*alpha; k32 = 0.024*alpha;
% k34 = .15*alpha; k43 = .038*alpha;
% % RNA creation constants 
% kr1 = 0.0008; kr2 = 0.0052; kr3 = 0.90; kr4 = 0.082; gamma = 0.0049; 
% 
% % Time varying component
% k21a = k21*1;
% k21b = k21*2.4;
% A = 9.3e9; n = 0.87; M = 3.2e-12;
% r1 = 2.9e-14; r2 = 3.4e-3; %1/s
% let's plot the hog signal as well
hog1t = @(t) A*((((1-exp(-r1*t))*exp(-r2*t))/(1+(((1-exp(-r1*t))*exp(-r2*t))/M)))^n);
tvec = linspace(0,80*60,100);
% h = [];
% for ti = tvec
%     h = [h hog1t(ti)];
% end
% figure(3)
% plot(tvec,h)
% xlabel('time'); ylabel('hog1 nuclearization')

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
[x, xstor,tstor] = SSA_tv2(tstop, x0, t0, S, W1, W0, Wt, i);

% subplot(2,1,1)
% plot(tstor,xstor(5,:))
% title('RNA Changes with time')
% xlabel('Time')
% ylabel('RNA')
% 
% subplot(2,1,2)
% plot(tstor,xstor(1,:),tstor,xstor(2,:),tstor,xstor(3,:),tstor,xstor(4,:))
% title('On/Off Check')
% legend('S1','S2','S3','S4')

tstop2 = [190,285,475,950,1425,1900,2375];
tstop2_min = [4,6,10,20,30,40,50];
for w = 1:length(tstop2)
for j = 1:500
    [x2(:,j),tst{j}.xstor,tst{j}.tstor] = SSA_tv2(tstop2(w), x0, t0, S, W1, W0, Wt, i);
%         figure (2)
%         plot(tst{j}.tstor,tst{j}.xstor(5,:))
%         title('Trajectories of RNA')
%         xlabel('Time')
%         ylabel('RNA')
%         hold on
end
hold off

[N1,X1] = hist(x2(5,:),50);

figure(3)
subplot(1,7,w);
plot(X1,N1)
hold on
histogram(x2(5,:),50)
title(sprintf('Probability at %1.f min',tstop2_min(w)))
xlabel('RNA')
ylabel('Probability')
axis([0 80 0 450])
hold off
end