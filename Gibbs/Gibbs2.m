t=-2*pi:0.01:2*pi;
x=4/pi*sin(t);
plot(t,x);
grid;
title('����˹���󶯻�');
xlabel('t');
ylabel('x(t)');
for n=3:2:99
    pause(0.5);
    x=x+(4/(n*pi)*sin(n*t));   
    plot(t,x);
    grid;
    title('����˹���󶯻�');
    xlabel('t');
    ylabel('x(t)');
end