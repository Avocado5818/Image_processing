function out=FourierTransform(image)
    M=size(image,1);
    N=size(image,2);
    Wr_N=DFT(N);
    Wc_M=DFT(M);
    temp=Wr_N*image';
    outA=Wc_M*temp';
    %out=log(1+abs(outA));
    out=abs(outA);
    %shift
    out=[out(floor(M/2)+1:M,floor(N/2)+1:N),out(floor(M/2)+1:M,1:floor(N/2));out(1:floor(M/2),floor(N/2)+1:N),out(1:floor(M/2),1:floor(N/2))];
end 