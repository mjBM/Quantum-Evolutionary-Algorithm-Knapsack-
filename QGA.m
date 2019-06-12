function QGA
tic ;
run = 5;                         %run                        
colors = 'krmbgcyw' ;
iteration=200;     %generation
mean_fitness=zeros(1,iteration);
temp=dlmread('100.txt');     %read from text file
capacity=temp(1,1);          %assign capacity from text file
temp(1,:)=[];
knapsack_input=temp';        %rotate array
profits=knapsack_input(1,:);
weights=knapsack_input(2,:);
repair_type=2;      %type=1 random . type=2 greedy . type=3 none
penalty_type=3;     %type=1 linear . type=2 logarithm . type=3 none
x=1:iteration ; 
teta=0.01*pi;       %Q gate
H_gate=0.01;        %epsilon
agent_number=25;
for i=1:run
    mean_fitness(i,:)=Knapsack_quantum(agent_number,profits,weights,capacity,H_gate,repair_type,penalty_type,iteration,teta);
    disp(['End of run ',num2str(i),' th.']) ;
%     figure ;
%     j = randsample(1:7,1) ;
%     plot(x,iteration_fitness,[colors(j),'-'])  ;
%   axis([min(x)-100 max(x)+100 min(iteration_fitness)-100 max(iteration_fitness)+100]) ;
end
y = mean(mean_fitness,1) ;
h=figure ;
hold on ;
plot(x,y,'b-')  ;
% axis([min(x)-100 max(x)+100 min(y(:))-100 max(y(:))+100]) ;
axis auto ;
xlabel('All Iterations') ;
ylabel('Fitness Mean') ;
title('All Quantum Genetic Algorithm') ;
disp('Allruntime=')      ;
qgatime  = toc ;        % Run Time          % Set QGA Time
disp(mat2str(qgatime))   ;
dlmwrite('new\time.txt',qgatime);
dlmwrite('new\res.txt',y(iteration));
hgsave(h,'new\fig');
end
%--------------------------------------------------------------------------