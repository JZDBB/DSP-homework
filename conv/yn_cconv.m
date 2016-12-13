function y = yn_cconv(x, h)
% cyclic covolution is used to two sequnence have the same length
if length(x)~=length(h)
    printf('err');
    return;
end
N = length(x);% length of the result sequnence
y = zeros(1,N);
h = h(end:-1:1)';  % sequence fliping and transposing
for n = 1:N   % convolution sum
    y(n) = x*h;
    x = circshift(x, [0, 1]);  % shifting
end
y = y(end:-1:1);
end