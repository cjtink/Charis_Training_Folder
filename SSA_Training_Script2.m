% SSA_Training_Script2
% Problem 5 from Huy

clear
clc

% System Specifications
k = 100; gamma = 0.1;
W0 = [0;k];
W1 = [gamma;0];
tstop = 10;
t0 = 0;
x0 = 0;
S = [-1,1];


for i = 1:100
    [x1(:,i)] = SSA(tstop, x0, t0, S, W1, W0);
end

for i = 1:1000
    [x2(:,i)] = SSA(tstop, x0, t0, S, W1, W0);
end

for i = 1:10000
    [x3(:,i)] = SSA(tstop, x0, t0, S, W1, W0);
end

for i = 1:100000
    [x4(:,i)] = SSA(tstop, x0, t0, S, W1, W0);
end
%%
[N1,X1] = hist(x1(1,:),50);
[N2,X2] = hist(x2(1,:),50);
[N3,X3] = hist(x3(1,:),50);
[N4,X4] = hist(x4(1,:),50);

N_new1 = N1/size(x1,2);
N_new2 = N2/size(x2,2);
N_new3 = N3/size(x3,2);
N_new4 = N4/size(x4,2);

subplot(4,1,1)
plot(X1,N_new1)
% hold on
% histogram(x1(1,:),50)
title('100 Simulations')
xlabel('X')
ylabel('Probability')
axis([0 700 0 .1])
% hold off

subplot(4,1,2)
plot(X2,N_new2)
% hold on
% histogram(x2(1,:),50)
title('1000 Simulations')
xlabel('X')
ylabel('Probability')
axis([0 700 0 .1])
% hold off

subplot(4,1,3)
plot(X3,N_new3)
% hold on
% histogram(x3(1,:),50)
title('10000 Simulations')
xlabel('X')
ylabel('Probability')
axis([0 700 0 .1])
% hold off

subplot(4,1,4)
plot(X4,N_new4)
% hold on
% histogram(x4(1,:),50)
title('100000 Simulations')
xlabel('X')
ylabel('Probability')
axis([0 700 0 0.1])
% hold off