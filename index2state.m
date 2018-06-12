function Y = index2state(i,n)

% This function takes the index of the state (i) within the boundaries of
% the state (n) and outputs the state vector:
% y1 = gene state
% y2 = number of RNA
% This is to be used in an FSP Simulation for a two-state gene bursting
% model.

% SORRY I gave you the wrong formula, I forgot to account for the fact that
% species starts from 0
% y2 = mod(i-1,n+1);
% y1 = (i-y2)/(n+1);

% Here's my correction
y2 = mod(i-1,n+1);
y1 = (i-1-y2)/(n+1);
Y = [y1 y2]';

% How do I put conditions on this to not allow it to give me an output that
% is outside of the bounds?
% HV: I don't know either. I never had to check the output for index2state.
% The state2index function is the one that requires checking bounds.

end