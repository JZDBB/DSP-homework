function A = yn_fft(a)

q = ceil(log2(length(a)));
A = yn_copy(a,q);
n = length(a);
for s = 1:1:log2(n)
    m = 2^s;
    Wm = exp(-1i*2*pi/m);
    for k = 0:m:n-1
        W = 1;
        for j = 0:1:m/2-1
            t = W*A(k+j+m/2+1);
            u = A(k+j+1);
            A(k+j+1) = u + t;
            A(k+j+m/2+1) = u - t;
            W = W * Wm;
        end
    end
end

end

function A = yn_copy(a,q)

n = length(a);
for k = 0:n-1
    b = rev(k,q);
    A(b + 1) = a(k+1);
end 

end

function y = rev(a,q)

t = dec2bin(a, q);
t = t(end:-1:1);
y = bin2dec(t);

end