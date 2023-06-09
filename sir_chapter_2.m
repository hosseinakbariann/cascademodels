beta=0.25;
k=5;
inf= zeros(1,40);
reco= zeros(1,40);
susc= zeros(1,40);
in=0.02;
r=0;
s=0.98;
mu=0.26;
recov=0.52;
time=0:39;
t=1;
for i=1:40
      susceptiblenodes=((-(beta)*k)*in)*(1-(r)-(in));
      infectednodes=(-((mu)*(in))+((beta)*k)*((in)*(1-r-in)));
      Recoverednodes=(mu)*(in); 
      s=(susceptiblenodes)+(s);
      in=(infectednodes)+(in);
      r=(Recoverednodes)+(r);
      t=t+1;
      inf(1,i)=in;
      reco(1,i)=r;
      susc(1,i)=s;
end
hold on;
TPR=time;
plot(TPR,inf,':b');
plot(TPR,reco,'--r');
plot(TPR,susc,'g');
legend('susc','inf','reco','Location','northwest');
xlabel('time');
ylabel('nodes');
