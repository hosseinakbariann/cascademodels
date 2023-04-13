I0=0.01;
beta=0.27;
k=4;
I= zeros(1,13);
time=0:12;
t=1;
for i=1:13
    Infectednodes = ((I0)* (exp((beta)*k*t)))/(1-(I0)+(I0)* (exp((beta)*k*t)));
    t=t+1;
    I(1,i)=Infectednodes;
end
hold on;
plot(time,I,'--r');
legend('infectednodes','Location','northwest');
xlabel('time');
ylabel('nodes');
