x = [1 3 2 -1];
h = [1 -1 0 1];
n = length(x);
tic
y1 = conv(x,h);
toc
tic
y2 = yn_conv(x,h);
toc
tic
y3 = cconv(x,h,n);
toc
tic
y4 = yn_cconv(x,h);
toc