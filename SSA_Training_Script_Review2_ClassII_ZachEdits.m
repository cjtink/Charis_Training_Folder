% SSA Training Script for Review Paper 2
clear
clc
close all

% Class II: Short On/Long Off Periods
tstop = 100; x0 = [0;0]; t0 = 0; S = [-1,1,0,0,0;0,0,1,-1,1];
alpha = 100; % This is a parameter to easily play around with the on/off switch
koff = .3*alpha; kon = .1*alpha; gamma = 1; kr = 100; kr2 = 0;
fon = kon/(kon+koff)

W0 = [0; kon; 0; 0; kr2]; W1 = [koff, 0; -kon, 0; kr, 0; 0, gamma; -kr2,0];
[x, xstor_C1,tstor_C1] = SSA(tstop, x0, t0, S, W1, W0);
%[x, xstor_C1,tstor_C1] = SSA(tstop, x0, S, W1, W0);  % try using zach's algorithm


subplot(2,1,1)
plot(tstor_C1,xstor_C1(2,:))
title('Class II: RNA Changes with time')
xlabel('Time')
ylabel('RNA')

subplot(2,1,2)
plot(tstor_C1,xstor_C1(1,:))
title('On/Off Check')
% 

for i = 1:500

    [x_C1(:,i)] = SSA(tstop, x0, t0, S, W1, W0);
   
end
%%
m = max(max(x_C1));
nbins = 0:m;
  
[N1,X1] = hist(x_C1(2,:),nbins);
N = N1/sum(N1);
figure(3)
plot(X1,N)
hold on
% histogram(x_C1(2,:),nbins)
title('Class II: Probability of RNA at t-stop')
xlabel('RNA')
ylabel('Probability')
hold off



