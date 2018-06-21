% Department of Engineering IT Services - University of Cambridge
% Matlab vectorization tricks notes
clear
clc

% Indexing using vectors
X = [2 5 8 11 14 17 20 23 26 29];
V = [4 2 6];
A = X(V) % This idea is using the vector V to index vector X and output the 
% new information in another variable. This idea can be applied much
% further and help when wanting to apply different indeces

% If B and C are the same size, and C only consists of true or false
% elements, then Matlab interprets C as a mask, and returns only the
% elemebts of B whose position corresponds to the location of a true in C.
% For example:
B = 1:10;
C = B>6;
D = B(C)
% Thus the resulting vector is only greater than 6.

% Practice problem: How can you determine the number of items in a 2D array
% that are greater than 8?
m = magic(5);
tic
slow_ans = sum(sum(m>8))
toc
tic
fast_ans = sum(m(:)>8)
toc
% Both give the same answer, except using the fact that m(:) has all of the
% elements of m into a single column cans shorten the run time.

% Creating and manipulating matrixes
% To use the indexing ideas effectively, you need to be able to create
% 'mask' matrices efficiently, and manipulate arrays. This requires the use
% fo functions that you may not have used before. 

% array manipulation
% flipud, fliplr, rot90, triu(extracts upper triangle 