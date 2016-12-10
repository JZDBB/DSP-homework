m=100;
t=-2*pi:0.01:2*pi;
n=round(length(t)/4);
f=[ones(n,1);-1*ones(n,1);ones(n,1);-1*ones(n+1,1)];
y=zeros(m+1,max(size(t)));
y(m+1,:)=f';
figure(1);
plot(t/pi,y(m+1,:));
grid;
axis([ -2 2 -1.5 1.5]);
title('周期方波');
xlabel('单位: pi','Fontsize',8);
x=zeros(size(t));
kk='1';
for k=1:2:2*m-1
pause(0.5);
x=x+sin(k*t)/k;
y((k+1)/2,:)=4/pi*x;
plot(t/pi,y(m+1,:));
hold on;
plot(t/pi,y((k+1)/2,:));
hold off;
grid;
axis([-2 2 -1.5 1.5]);
title(strcat('第',kk,'次谐波叠加'));
xlabel('单位: pi','Fontsize',8);
kk=strcat(kk,',',num2str(k+2));
end
pause;
plot(t/pi,y(1:m+1,:));
grid;
axis([-2 2 -1.5 1.5]);
title('各次谐波叠加波形');
xlabel('单位: pi','Fontsize',8);
%End