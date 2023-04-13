iteration = 50;
beta=0.4;
Mu=0.7;
infintime = zeros(iteration,1);
for netrnk=1 : 50
    Network = Genarate_Network();
    n= size(Network,1);
    Seed = randi(n);
    SI=zeros(1,n);
    SI(Seed)=1;
    I =1;
    avgdeg=2;
    S=1;
    infintime(netrnk,1)=0.01;
    while  avgdeg ~=102
        for i=1:n
            if (SI(i)==1)
                l =rand();
                if (l < Mu)
                    SI(i)=0;
                    I = I - 1;
                end
                if (SI(i)==1)
                    for j=1 : n
                        if (Network(i,j)==1)
                            l =rand();
                            if(l<beta & SI(j)~=1 & SI(j)~=2)
                                SI(j)=1;
                                I = I + 1;
                            end
                        end
                    end
                end
            end
        end
        infintime(netrnk,avgdeg)=I;
        avgdeg=avgdeg+1;
    end
    
    plot(1:1:avgdeg-1,infintime(netrnk,1:avgdeg-1)/100,'g');
    xlabel('time');
    ylabel('nodes');
    legend('infectednodes in 50 network','Location','northwest');
    hold on;

end
    figure(2);
    e=mean(infintime)/100;
    plot(e,'r','LineWidth',2);
    xlabel('time');
    ylabel('nodes');
    legend('infectednodes','Location','northwest');
