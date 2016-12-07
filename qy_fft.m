function X = qy_fft(A)

% this function implements the fft method proposed by James W. Cooley and 
% John W. Tukey.

% A: the input array, the length of which must be 2^k, where k is a
% positive integer.

% X: the output array.

n = length(A);
if n == 1
	X = A;
	return;
end
w = exp(-1i*2*pi/n).^(0:n/2 - 1);
A0 = A(1:2:n);
A1 = A(2:2:n);
X0 = qy_fft(A0);
X1 = qy_fft(A1);
t = w.*X1;
X(1:n/2) = X0 + t;
X(n/2 + 1:n) = X0 - t;

end