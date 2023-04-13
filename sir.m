    iteration = 50;
    Beta=0.2;
    Mu=0.1;
    infintime = zeros(iteration,1);
    for H=1 : 50
	    Network = Genarate_Network();
        n= size(Network,1);   
        Seed = randi(n);       
        SI=zeros(1,n);
        SI(Seed)=1;
        counter_R=0;
        counter_I =1;
        counter_S= n-1;
        k=2;
        infintime(H,1)=0.01; 
        while  counter_I ~=0
        for i=1:n
            if (SI(i)==1)
                l =rand();
                if (l < Mu)
                    SI(i)=2;
                    counter_I = counter_I - 1;
                    counter_R = counter_R +1;
                end
                if (SI(i)==1)
                for j=1 : n
                    if (Network(i,j)==1)
                        l =rand();
                        if(l<Beta & SI(j)~=1 & SI(j)~=2)
                            SI(j)=1;
                            counter_I = counter_I + 1;
                            counter_S=counter_S -1;
                        end
                    end
                end
                end
            end
        end
        infintime(H,k)=counter_I/100;
        k=k+1;
        end
         plot(1:1:k-1,infintime(H,1:k-1),'g','LineWidth',2);
         legend('infectednodes in 50 network','Location','northwest');
         xlabel('time');
         ylabel('nodes');    
         hold on;
    end
    e=mean(infintime);
    figure(2);
    plot(e,'r','LineWidth',2);
    legend('infectednodes in 50 network','Location','northwest');  
    xlabel('time');
    ylabel('nodes');
