function out=DFT(N)

    w=exp(-2*pi()*(-1)^(1/2)/N);
    a=[0:N-1];
    t=a'*a;
    out=1/N*w.^(t);
end