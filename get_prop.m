function W = get_prop(x,t,W0,W1,Wt,i)

% This  nested function changes the initial Ws in order to get our time 
% varying function.
%
% x and t are going to be anonymously solved for later.
% W0, W1, Wt, and i are as defined in SSA_tv function above.

Wnew = W1*x + W0;
Wnew(i) = max([0,Wt(t)]); %replaces necessary W value with the 

W = Wnew;

end