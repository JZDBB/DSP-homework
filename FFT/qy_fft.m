function X = qy_fft(A, n)
if n == 1
	X = A;
	return;
end
w = exp(1i*2*pi/n).^(0:n/2 - 1);
A0 = A(1:2:n);
A1 = A(2:2:n);
X0 = qy_fft(A0, n/2);
X1 = qy_fft(A1, n/2);
t = w.*X1;
X(1:n/2) = X0 + t;
X(n/2 + 1:n) = X0 - t;
end