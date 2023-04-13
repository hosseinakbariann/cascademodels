    iteration = 50;
    B=0.2;
    infintime = ones(iteration,1);
    for H=1 : iteration
        Network = Genarate_Network();
        n= size(Network,1);
        Seed = randi(n);
        SI=zeros(1,n);
        SI(Seed)=1;
        iinfect=1;
        t=2;
        infintime(H,1)=0.01;
        while  iinfect~=100         
            for i=1:n
                if (SI(i)==1)
                    for j=1 : n
                        if (Network(i,j)==1)
                            l =rand();
                            if(l<B & SI(j)~=1)
                                SI(j)=1;
                                iinfect = iinfect + 1;
                            end
                        end
                    end
                end
            end
            infintime(H,t)=iinfect;
            t=t+1;
        end
        plot(1:1:t-1,infintime(H,1:t-1)/100,':g','LineWidth',2);
        legend('infectednodes in 50 network','Location','northwest');
        xlabel('time');
        ylabel('nodes');
        hold on;
    end   
    figure(2);
    infintime(infintime==0) = n;
    e=mean(infintime)/100;
    plot(e,'r','LineWidth',2);
    xlabel('time');
    ylabel('nodes');
    legend('infectednodes','Location','northwest');