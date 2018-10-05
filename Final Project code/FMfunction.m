function out=FMfunction(F)
    AF=abs(F);
    M=max(max(AF));
    thres=M/1000;
    m=size(F,1);
    n=size(F,2);
    sum=0;
    for i=1:m
        for j=1:n
            if F(i,j)>thres
                sum=sum+1;
            end
        end
    end
    TH=sum;
    FM=TH/(m*n);
    out=FM;
end 