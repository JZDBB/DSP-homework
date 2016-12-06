function y = yn_cconv(x, h)

if length(x)~=length(h)
    printf('err');
    return;
end
N = length(x);
y = zeros(1,N);
h = h(end:-1:1)';
for n = 1:N
    y(n) = x*h;
    x = circshift(x, [0, 1]);
end
end