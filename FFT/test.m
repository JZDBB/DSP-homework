a = [1 2 3 4 5 6 7 8];
n = 1:8;
tic
A1 = fft(a);      % result using its own function
toc
tic
A2= yn_fft(a);    % result using iterative algorithm
toc
tic
A3 = yn_fft1(a);  % result using recursive algorithm
toc               % toc is to estimate the time we take using the function