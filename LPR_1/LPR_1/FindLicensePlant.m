function [x1,x2,y1,y2]=FindLicensePlant(image)
    ix=size(image,1);
    iy=size(image,2);
    out=zeros(ix+2,iy+2);
    M=zeros(ix+2,iy+2);
    M(2:ix+1,2:iy+1)=image;
    %%% ���ҤƳB�z
    %      U B
    %    L N
    Label=0;
    for i=2:ix+1
        for j=2:iy+1
            %if ��e���I N==1
            if(M(i,j)==1)
              
                if (out(i-1,j)==0&&out(i-1,j+1)==0&&out(i,j-1)==0)
                    % if U L B ���Slabel
                    Label=Label+1;
                    % ��e��m= �s����
                    out(i,j)=Label;
                elseif (out(i-1,j+1)~=0&&out(i-1,j)==0&&out(i,j-1)==0)
                    % if B �w���� , L U ������
                    % ��e��m=B ������
                    out(i,j)=out(i-1,j+1);
                elseif (out(i-1,j)~=0&&out(i,j-1)==0)
                    % U �w���� , L ������
                    % ��e��m=U ������
                    out(i,j)=out(i-1,j);
                elseif (out(i-1,j)==0&&out(i,j-1)~=0)
                    % L �w���� , U ������
                    % ��e��m=L ������
                    out(i,j)=out(i,j-1);
                elseif (out(i-1,j)==out(i,j-1)&&out(i-1,j)~=0)
                    % L U �������� ,�B���ҬۦP
                    % ��e��m=U ������
                    out(i,j)=out(i-1,j);
                elseif (out(i-1,j)~=out(i,j-1)&&out(i-1,j)~=0)
                    % L U �������� ,�B���Ҥ��P
                    % ��e��m=U ������
                    out(i,j)=out(i-1,j);
                    % �B���e�H�e��L�����ҧ令U������
                    L=find(out==out(i,j-1));
                    U=out(i-1,j);
                    out(L)=U;
                end
            end
        end
    end
    
    %%% ��̤j������
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