function y = yn_conv(x,h)
% get the length of the two sequence
m = length(x);
n = length(h);
N = m + n -1;
if m >= n   % let the longest to flip
	t = x;
	x = h;
	h = t;
	t = m;
	m = n;
	n = t;
end
% pading zeros to make two sequence have the same dimensions
b = zeros(1,n);
x = [b x b];
h = h(end:-1:1);
b = zeros(1,m + n);
h = [h b];
% shifting and cycling to attain the convolution sum
for k = 1:m+n-1
	h = circshift(h,[0,1]);
	y(k) = h * x';
end

end
