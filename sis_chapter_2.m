I0=0.01;
beta=0.2;
k=4;
I= zeros(1,19);
mu=0.2;
c=(I0)/(1-I0);
time=0:18;
t=1;
for i=1:19
    Infectednodes = (1-(mu/(beta*k)))*(c*exp(((beta*k)-mu)*t))/(1+(c*exp(((beta*k)-mu)*t)));    
    t=t+1;
    I(1,i)=Infectednodes;
end
hold on;
plot(time,I,'--b');
xlabel('time');
ylabel('nodes');
legend('infectednodes','Location','northwest');
