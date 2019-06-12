function result=Knapsack_repair(x,p,w,C,type);
[rowx columnx]=size(x);
if type==1
    while sum(w.*x)>C
        I=ceil(columnx*rand);
        x(I)=0;
    end
end
if type==2
    while sum(w.*x)>C
        help=(w./p).*x;
        [Max I]=max(help);
        x(I)=0;
    end
    while sum(w.*x)<=C
        help=(p./w).*~x;
        [Max I]=max(help);
        x(I)=1;
    end
    x(I)=0;
end
result=x;