% Vectorized verses Looped Matrix
clc
clear

% Time for Looped
tstartL = tic;
B1 = B_n(1000000);
tlapsedL = toc(tstartL);

% Time for Vectorized
tstartV = tic;
B2 = B_n_vectorized(1000000);
tlapsedV = toc(tstartV);

time_saved = (tlapsedV/tlapsedL)*100;

% Use of spdiags

n = 1000000;
tstarts = tic;
B = B_n_spdiags(n);
tlapseds = toc(tstarts);


fprintf('Time for Looped: %1.4f\n',tlapsedL)
fprintf('Time for Vectorized: %1.4f\n',tlapsedV)
fprintf('Time for spdiags: %1.4f\n', tlapseds)
% fprintf('Percentage of Time Saved: %1.4f percent\n',time_saved)

