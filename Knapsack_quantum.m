function result=Knapsack_quantum(agents,profits,weights,capacity,H,repair,penalty,iteration,teta);
    local_group_size=5;
    local_migration_condition=30;
    global_migration_condition=70;
    best_global_fitness=-Inf;
    [row_p column_p]=size(profits);
    ind_size=column_p;      %length of chromosom
%I) First initialize-------------------------------
    for i=1:agents
        Q(i).ind(1:ind_size)=pi/4;
    end
%II) _ IV)-----------------------------------------
for i=1:agents
    P(i).ind=Knapsack_observe(Q(i).ind);                    %put observe of Q(i).ind in P(i) array
    P(i).ind=Knapsack_repair(P(i).ind,profits,weights,capacity,repair);        %rapair size of knapsack
    fitness(i)=Knapsack_fitness(P(i).ind,profits,weights,capacity,penalty);    %calculate fitness of each P array                                          
    best_agent_fitness(i)=fitness(i);                       %calculate best agent fitness of each iteration
    B(i).ind=P(i).ind;                                      %B(i) is best observe of each iteration(best local Observe)
end
%V) _ VI)-----------------------------------------------
for j=1:iteration
    for i=1:agents
        P(i).ind=Knapsack_observe(Q(i).ind);                  %put observe of Q(i).ind in P(i) array
        P(i).ind=Knapsack_repair(P(i).ind,profits,weights,capacity,repair);      %rapair size of knapsack
        fitness(i)=Knapsack_fitness(P(i).ind,profits,weights,capacity,penalty);  %calculate fitness of each P array
        %VII) calculate delta_teta sign----------------------
%         if fitness(i)>best_agent_fitness(i)                  %Q(i) must Converge to 0 , if P(i)=0
%             clear help;                                      %and Converge to 1 , if P(i)=1
%             help=(2*(sin(Q(i).ind).*cos(Q(i).ind)>0)-1)...
%             .*(2*P(i).ind-1)*teta;
%             Q(i).ind=Q(i).ind+help;
%         else                                                 %Q(i) must Converge to 0 , if B(i)=0
%             clear help;                                      %and Converge to 1 , if B(i)=1
%             help=(2*(sin(Q(i).ind).*cos(Q(i).ind)>0)-1)...
%             .*(2*B(i).ind-1)*teta;
%             Q(i).ind=Q(i).ind+help;        
%         end
%Q Gate-------------------------------------------------
        if fitness(i)>best_agent_fitness(i)                  %Q(i) must Converge to 0 , if P(i)=0
            clear help;                                      %and Converge to 1 , if P(i)=1
            help=(2*(sin(Q(i).ind).*cos(Q(i).ind)>0)-1)...
            .*(2*P(i).ind-1)*teta;
            
            %%%%%%%%%%%%%%%%%%%%  jamshid %%%%%%%%%%%%%%%%%%%%
            
%             QGcondition1 = 2 * (sqrt(sin(Q(i).ind))>sin(pi/4)) - 1 ; % ~0 or ~1
%             QGxnor = ( ( sign(help) .* QGcondition1 ) + 1 ) / 2 ;	% true ==> going out pi/4
%             QGxor  = ~QGxnor ;                                    	% true ==> going on  pi/4
%             QGrands = rand(size(Q(i).ind)) ;
%             QGrands =   ( ( QGrands <  (1/3) ) .* 0.5 ) + ...
%                         ( ( QGrands >= (1/3) ) .* ( QGrands < (2/3) ) .* 1.0 ) + ...
%                         ( ( QGrands >= (1/3) ) .* 1.5 ) ;
%             help = (       1 .* help ) .* QGxnor ...	% true ==> going out pi/4
%                  + ( QGrands .* help ) .* QGxor ;       % true ==> going on  pi/4
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            Q(i).ind=Q(i).ind+help;
        else                                                 %Q(i) must Converge to 0 , if B(i)=0
            clear help;                                      %and Converge to 1 , if B(i)=1
            help=(2*(sin(Q(i).ind).*cos(Q(i).ind)>0)-1)...
            .*(2*B(i).ind-1)*teta;
            
            %%%%%%%%%%%%%%%%%%%%  jamshid %%%%%%%%%%%%%%%%%%%%
            
%             QGcondition1 = 2 * (sqrt(sin(Q(i).ind))>sin(pi/4)) - 1 ; % ~0 or ~1
%             QGxnor = ( ( sign(help) .* QGcondition1 ) + 1 ) / 2 ;	% true ==> going out pi/4
%             QGxor  = ~QGxnor ;                                    	% true ==> going on  pi/4
%             QGrands = rand(size(Q(i).ind)) ;
%             QGrands =   ( ( QGrands <  (1/3) ) .* 0.5 ) + ...
%                         ( ( QGrands >= (1/3) ) .* ( QGrands < (2/3) ) .* 1.0 ) + ...
%                         ( ( QGrands >= (1/3) ) .* 1.5 ) ;
%             help = (       1 .* help ) .* QGxnor ...	% true ==> going out pi/4
%                  + ( QGrands .* help ) .* QGxor ;       % true ==> going on  pi/4
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            Q(i).ind=Q(i).ind+help;
        end
   
        %H-Gate
        display(Q(1).ind)
        Q(i).ind=min(Q(i).ind,acos(sqrt(H)));
        Q(i).ind=max(Q(i).ind,acos(sqrt(1-H)));
        display(Q(1).ind)
    end
    %VIII) _ IX)---------------------------------------        
    for i=1:agents
        if fitness(i)>best_agent_fitness(i)        %agent Compartion
            B(i).ind=P(i).ind;
            best_agent_fitness(i)=fitness(i);
        end
    end
        [Max I]=max(best_agent_fitness);                     %calculate maximum fitness of individuals
    if Max>best_global_fitness                    %global Compartion
        best_global_observe=P(I).ind;
        best_global_fitness=Max;
    end
    iteration_fitness(j)=best_global_fitness;     %global fitness array
    %X)-------------------------------------------------------
    local_migration=false;
    global_migration=false;
    if mod(j,local_migration_condition)==0
        local_migration=true;
    end
    if mod(j,global_migration_condition)==0
        global_migration=true;
    end
%     if isconvergence(agents,ind_size,Q,0.98)      %Convergence
%         for i=1:agents
%             B(i).ind=best_global_observe;              %exchange individual Best observe with best global observe
%             best_agent_fitness(i)=best_global_fitness; %exchange individual Best fitness with best global fitness
%         end
    if global_migration                      %global migration
        for i=1:agents
            B(i).ind=best_global_observe;              %exchange individual Best observe with best global observe
            best_agent_fitness(i)=best_global_fitness; %exchange individual Best fitness with best global fitness
        end
    elseif local_migration                      %local migration
        local_groups_no=floor(agents/local_group_size);
        for i=1:local_groups_no
            del=best_agent_fitness((i-1)*local_group_size+1:i*local_group_size);
            [Best_local_fitness I]=max(del);
            display(I);
            Best_local=B(I).ind;
            for kk=(i-1)*local_group_size+1:i*local_group_size
                B(kk).ind=Best_local;                        %exchange individual Best observe with best local observe
                best_agent_fitness(kk)=Best_local_fitness;   %exchange individual Best fitness with best local observe
            end
        end
    end
end
result=iteration_fitness;