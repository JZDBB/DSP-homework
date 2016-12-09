function Y = yn_fft1(a)
n = length(a);
if n == 1
	Y = a;
	return;
end
Wn = exp(1i*2*pi/n).^(0:n/2 - 1);
a0 = a(1:2:n-1);
a1 = a(2:2:n);
Y0 = yn_fft1(a0);
Y1 = yn_fft1(a1);
Y(1:n/2) = Y0 + Wn.*Y1;% 维度要一致，因此用点乘
Y(n/2 + 1:n) = Y0 - Wn.*Y1;
end