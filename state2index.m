function i = state2index(X, n) % you can input the whole vector here

%function i = state2index(x1,x2,n)

% This function takes an input of the state of the system where:
% x1 = gene state
% x2 = number of RNA
% And outputs the index of the state according to the bounds as assigned by
% n. This is to be used in an FSP Simulation for a two-state gene bursting
% model.
%
% If the index is outside of the bounds, then the output is a negative
% value.

x1 = X(1); x2 = X(2);

% n_col_max = 2*(n+1);

% I gave the wrong formula, here is the correct one
i_initial = 1+x2 + (n+1)*x1;

% What if x1 or x2 are negative and i_initial <= n_col_max?
% if i_initial > n_col_max 
%     i = -1;
% else
%     i = i_initial;
% end

% My suggestion:
if (x1<0 || x1>1 || x2<0 || x2>n)
    i = -1;
else 
    i = i_initial;
end

end

