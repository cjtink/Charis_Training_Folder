function [x,xstor,tstor] = SSA(tstop, x0, t0, S, W1, W0)

% This is a function to solve a Stochastic Simulation Algorithm (SSA) for
% a single trajectory at tstop.
%
% The parameters are as follows:
% tstop = the time variable in which the SSA is solved for
% x0 = initial amount of species, can be a vector depending on the number
% of species (N)
% t0 = time of start of the model, usually is zero
% S = stoichiometry matrix with N rows and R columns where N is the number
% of species and R is the number of reactions, positive for the generation
% of the species and negative for the consumption of the species
% W1 = propensity vector terms to be multiplied by x, column vector
% W0 = propensity vector terms to be added at the end, column vector

% Set initial parameters
x = x0;
t = t0;
xstor = [];
tstor = [];
while t < tstop
    % Propensity vector - linear, and always has to be positive
    W = W1*x + W0;
    
    % Find time until next reaction
    tau = exprnd(1/sum(W));
    t = t+tau; 
    if t > tstop % corrects from adding extra time at the end and not stopping at tstop
        break
    end
    % Find the next reaction
    r = rand()*sum(W); % Finds a random value btwn 0 and 1
%     Wtot = cumsum(W); % Cumulative sum
    i = 1;
    while sum(W(1:i)) < r
        i = i + 1;
    end
    
    x = x + S(:,i);
%     S(:,i)
%     pause
    xstor = [xstor,x]; %inefficient but it works
    tstor = [tstor,t];
end
  xstor = [xstor,x]; %inefficient but it works
    tstor = [tstor,tstop];
end
    

