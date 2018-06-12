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

dummy = logspace(1,2,3);

for j = 1:length(dummy)
for i = 1:dummy(j)
    % we are only looking at RNA abundance
    xi = SSA(tstop, x0, t0, S, W1, W0);
    x_C1(i) = xi(2);
end
% m = max(max(x_C1));
% compute the approximated probability from the SSA.
% ZF: remember, we want "bins" for each for the integer values 
% ZF: of potential RNA, 0,1,2,...n. 
bins = 0:n;
[N1,X1] = hist(x_C1,bins);
P_ssa = N1/sum(N1);

% store epsilon at each step 
% ZF: added a transpose so they are the same shape. 
eps(j) = sum((P_fsp - P_ssa').^2);

% ZF: uncomment below to make a different figure that plots the 
% ZF: distributions at each iteration. 
% figure(j)
% plot(P_ssa);
% hold on
% plot(P_fsp);
%title(sprintf('SSA Number %1.f',dummy(j)))
end

figure()
plot(dummy,eps)
xlabel('# of trajectories')
ylabel('Sum of Squares Error')

% figure(3)
% plot(X1,N)
% hold on
% histogram(x_C1(2,:),nbins)
% title('Probability of RNA at t-stop')
% xlabel('RNA')
% ylabel('Probability')
% hold off


