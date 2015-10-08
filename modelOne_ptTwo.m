clear all;
close all;
%provide input
a=1; b=0.2; m=1; n=0.1; k=20;
f=@(t,x,y) (a-(1/k)*x-b*y)*x;  % RHS of x differential equation to be solved
g=@(t,x,y) (-m+n*x)*y;  % RHS of y differential equation to be solved
T =50;                %maximum time
dt=0.0001;              % deltat
t0=0;                %initial time
x0=10; y0=2.5;         %initial values
 
% set up t and y vectors
N= round(T/dt);
t= zeros(1, N+1);
x= zeros(1, N+1);
y= zeros(1, N+1);
 
t(1)= t0; x(1)= x0; y(1)= y0;
 
%apply euler to generate the y values
for k=2: N+1
    x(k)=x(k-1)+f(t(k-1),x(k-1),y(k-1))*dt;
    y(k)=y(k-1)+g(t(k-1),x(k-1),y(k-1))*dt;
    t(k)=t(k-1)+dt;
end
%plot the numerical solution
figure(1);  %Graph of (t,x and y)
plot(t,x);
xlabel('Time,t');
ylabel('Population')
axis([0 T 0 11]);
hold on;
plot(t,y,'r');
 
figure(2) %Graph of (,y)
plot(x,y,'or');
xlabel('x population');
ylabel('y population');
axis([0 11 0 11]);
