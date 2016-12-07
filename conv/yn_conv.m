function y = yn_conv(x,h)
m = length(x);
n = length(h);
N = m + n -1;
if m >= n
	t = x;
	x = h;
	h = t;
	t = m;
	m = n;
	n = t;
end
b = zeros(1,n);
x = [b x b];
h = h(end:-1:1);
b = zeros(1,m + n);
h = [h b];

for k = 1:m+n-1
	h = circshift(h,[0,1]);
	y(k) = h * x';
	
end

end
