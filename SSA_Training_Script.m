% Charis SSA Training Script
clear
clc

% A single trajectory
tstop = 10000000; x0 = [0;0]; t0 = 0; S = [-1,1,0,0,0;0,0,1,-1,1];
alpha = 100; % This is a parameter to easily play around with the on/off switch
koff = .3*alpha; kon = .1*alpha; gamma = 1; kr = 100; kr2 = 0;
W0 = [0; kon; 0; 0; kr2]; W1 = [koff, 0; -kon, 0; kr, 0; 0, gamma; -kr2,0];
[x, xstor,tstor] = SSA(tstop, x0, t0, S, W1, W0);

% plot(tstor,xstor(2,:))
% figure(2)
% plot(tstor,xstor(1,:))

% Loop with Histogram

for i = 1:25
    [x2(:,i),tst{i}.xstor,tst{i}.tstor] = SSA(tstop, x0, t0, S, W1, W0);
%     plot(tst{i}.tstor,tst{i}.xstor) %this stores each trajectory
end
histogram(x2)

