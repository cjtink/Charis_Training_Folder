function Bn = B_n(n)

% This is a basic function to creates an nxn sparse matrix
% where (-2) is the diagonal and the lower and upper diagonal are 1.
%
% This is meant to practice my sparse ability.

% Identifying Diagonal indeces

for dummy = 1:n
    i_diag(dummy) = dummy;
    j_diag(dummy) = dummy;
    val_diag(dummy) = -2;
end

% Identifying Upper Diagonal indeces

for dummy2 = 2:n
    i_ud(dummy2-1) = dummy2 - 1;
    j_ud(dummy2-1) = dummy2;
    val_ud(dummy2-1) = 1;
end

% Identifying Lower Diagonal indeces

for dummy3 = 2:n
    i_ld(dummy3-1) = dummy3;
    j_ld(dummy3-1) = dummy3 - 1;
    val_ld(dummy3-1) = 1;
end

i = [i_diag, i_ld, i_ud];
j = [j_diag, j_ld, j_ud];
val = [val_diag, val_ld, val_ud];

Bn = sparse(i,j,val);


end
    

