function [x1,x2,y1,y2]=FindLicensePlant(image)
    ix=size(image,1);
    iy=size(image,2);
    out=zeros(ix+2,iy+2);
    M=zeros(ix+2,iy+2);
    M(2:ix+1,2:iy+1)=image;
    %%% 標籤化處理
    %      U B
    %    L N
    Label=0;
    for i=2:ix+1
        for j=2:iy+1
            %if 當前的點 N==1
            if(M(i,j)==1)
              
                if (out(i-1,j)==0&&out(i-1,j+1)==0&&out(i,j-1)==0)
                    % if U L B 都沒label
                    Label=Label+1;
                    % 當前位置= 新標籤
                    out(i,j)=Label;
                elseif (out(i-1,j+1)~=0&&out(i-1,j)==0&&out(i,j-1)==0)
                    % if B 已標籤 , L U 未標籤
                    % 當前位置=B 的標籤
                    out(i,j)=out(i-1,j+1);
                elseif (out(i-1,j)~=0&&out(i,j-1)==0)
                    % U 已標籤 , L 未標籤
                    % 當前位置=U 的標籤
                    out(i,j)=out(i-1,j);
                elseif (out(i-1,j)==0&&out(i,j-1)~=0)
                    % L 已標籤 , U 未標籤
                    % 當前位置=L 的標籤
                    out(i,j)=out(i,j-1);
                elseif (out(i-1,j)==out(i,j-1)&&out(i-1,j)~=0)
                    % L U 都有標籤 ,且標籤相同
                    % 當前位置=U 的標籤
                    out(i,j)=out(i-1,j);
                elseif (out(i-1,j)~=out(i,j-1)&&out(i-1,j)~=0)
                    % L U 都有標籤 ,且標籤不同
                    % 當前位置=U 的標籤
                    out(i,j)=out(i-1,j);
                    % 且把當前以前的L的標籤改成U的標籤
                    L=find(out==out(i,j-1));
                    U=out(i-1,j);
                    out(L)=U;
                end
            end
        end
    end
    
    %%% 找最大的標籤
    K=zeros(1,Label);
    for i=1:Label
        F=find(out==i);
        K(i)=size(F,1);
    end
    N=find(K==max(K));
    out=out(2:ix+1,2:iy+1);
    P=find(out==N);
    Pout=zeros(ix,iy);
    Pout(P)=1;
    Q1=find(Pout==1);
    Q2=floor(Q1/size(Pout,1));
    Q3=mod(Q1,size(Pout,1));
    x1=min(Q2);
    y1=min(Q3)-2;
    x2=max(Q2)+1;
    y2=max(Q3);
    
end