function An = A_n_spdiags(k,gamma,n)

% This function uses the built in Matlab function of spdiags to create an
% n-1xn-1 sparse matrix of ks in the lower diagonal, gamma*(1:n-1) in the upper
% diagonal, and -k-gamma*(1:n-1) along the diagonal.

v1 = k*ones(n,1); % Creates a vector of k for the lower diagonal
v2 = gamma*(0:n-1)'; % creates a vector of 
v3 = -k - v2;

B = [v1,v2,v3];

d = [-1, 1, 0];
An = spdiags(B,d,n,n);

end
