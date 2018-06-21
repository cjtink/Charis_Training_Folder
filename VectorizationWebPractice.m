% Vectorization Practice: https://www.ee.columbia.edu/~marios/matlab/Vectorization.pdf

M = magic(300);
% We want to negate every element greater than 4.

% With a for loop, it looks like this

tic
for i = 1:300
    for j = 1:300
        if M(i,j) > 4
            M(i,j) = -M(i,j);
        end
    end
end
toc

tic
ind = find(M>4);
M(ind) = -M(ind); 
toc

% For this exercize, we will do something different in each column of a
% without a loop.
B = rand(10,5);
V = mean(B);

% A partially vectorixed solution would look like
for i = 1:5
    B(i,:) = B(i,:) - V(i);
end

A = rand(10,5);
U = mean(A);

% A better solution is
A = A-U(ones(10,1),:);
% That is that our mean matrix truned into a matrix the size of M and the
% matrices are subtracted in one operation. There is one subtlety. It makes
% use of "Tony's Trick"

a = [17 29 31];
v = a([1 1 1],:)
% This method is much faster than using the v = a*ones(1,3). THis method
% makes it more efficient than it was before. And it completes the same
% purpose

% Another tid-bit is to avoid using [] when they aren't necessary.
