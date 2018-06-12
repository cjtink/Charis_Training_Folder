% Compare SSA and FSP
clear
clc
close all

% Parameters
tstop = 100; x0 = [0;0]; t0 = 0; S = [-1,1,0,0,0;0,0,1,-1,1];
alpha = 100; % This is a parameter to easily play around with the on/off switch
koff = .3*alpha; kon = .1*alpha; gamma = 1; kr = 100; kr2 = 0;
fon = kon/(kon+koff); n = 200;

W0 = [0; kon; 0; 0; kr2]; W1 = [koff, 0; -kon, 0; kr, 0; 0, gamma; -kr2,0];
[P_fsp] = FSP_2state_BurstingGene(alpha,n);

dummy = logspace(1,4);

for j = length(dummy)
for i = 1:dummy(j)
    [x_C1(:,i)] = SSA(tstop, x0, t0, S, W1, W0);
end
% m = max(max(x_C1));
nbins = n+1;
  
[N1,X1] = hist(x_C1(2,:),nbins);
P_ssa = N1/sum(N1);
eps = sum((P_fsp - P_ssa)^2);
    figure (j)
    plot(1:n+1,eps)
    xlabel('Unknown')
    ylabel('Sum of Squares Error')
    title(sprintf('SSA Number %1.f',dummy(j)))
end



% figure(3)
% plot(X1,N)
% hold on
% histogram(x_C1(2,:),nbins)
% title('Probability of RNA at t-stop')
% xlabel('RNA')
% ylabel('Probability')
% hold off



