t=-2*pi:0.01:2*pi;
x=4/pi*sin(t);
plot(t,x);
title('����˹���󶯻�');
xlabel('t');
ylabel('x(t)');
for n=1:2:9
    pause(0.5);
    x=x+(4/(n*pi)*sin(n*pi*t));   
    plot(t,x);
    title('����˹���󶯻�');
    xlabel('t');
    ylabel('x(t)');
end