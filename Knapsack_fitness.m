function result=Knapsack_fitness(ind,p,w,c,type);
ro=max(p./w);
W=sum(w.*ind);
    pen2=((W>c).*ro*(W-c));
    pen1=((W>c).*log2(1+pen2));
if type==1
    result=sum(p.*ind)-pen1;
elseif type==2
    result=sum(p.*ind)-pen2;
elseif type==3
    result=sum(p.*ind);
end
