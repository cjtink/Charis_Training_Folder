function B = B_n_spdiags(n)

% This function uses the built in Matlab function of spdiags to create an
% nxn sparse matrix of 1s in the lower and upper diagonals and -2 in the 
% diagonal of the final matrix.
%
% This uses the A = spdiags(B,d,m,n) function

v1 = ones(n,2); % Creates a vector of ones of a nx2 matrix
v2 = -2*ones(n,1); % Creates a vector of negative 2s as inputs for the diagonal

B3 = [v1,v2];
d = [-1, 1, 0];
B = spdiags(B3,d,n,n);

end
