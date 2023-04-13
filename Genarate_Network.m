function [ Ret ] = Genarate_Network
    n=100;
    Nodes = zeros(n,n);
    n1=5;
    m=3;
    
    % Generate clique with n1 nodes
    for i=1:n1
          for j=1:n1
              if i ~= j
                Nodes(i,j)=1;
              end
          end
    end
    
    % Generate Barbashi-Albert Network with N nodes
    
    for i=n1+1 : n
        for j=1:m
            k=randi(i-1);
            if(Nodes(i,k)~=1)
                Nodes(i,k)=1;
                Nodes(k,i)=1;
            else
                j=j-1; 
            end
        end
    end
    
     Ret = Nodes;
end

