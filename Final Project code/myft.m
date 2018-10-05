function out=myft(filter,image,mode)


ix=size(image,1);
iy=size(image,2);
fx=size(filter,1);
fy=size(filter,2);
fr=floor(fx/2);
fc=floor(fy/2);


if (strcmp(mode,'same'))
   y=zeros(ix+2*fr,iy+2*fc);
   y(1+fr:ix+fr,1+fc:ix+fc)=image;
   out=zeros(ix,iy);
   for i=1+fr:ix+fr
      for j=1+fc:iy+fc
        out(i-fr,j-fc)=sum(sum(y(i-fr:i+fr,j-fc:j+fc).*filter));
      end
   end
   
elseif (strcmp(mode,'valid'))
   y=zeros(ix+2*fr,iy+2*fc);
   y(1+fr:ix+fr,1+fc:ix+fc)=image;
   out=zeros(ix,iy);
   for i=1+fr:ix+fr
      for j=1+fc:iy+fc
        out(i-fr,j-fc)=sum(sum(y(i-fr:i+fr,j-fc:j+fc).*filter));
      end
   end
   out=out(1+fr:ix-fr,1+fc:iy-fc);
   
elseif (strcmp(mode,'full'))
    y=zeros(ix+2*2*fr,iy+2*2*fc);
    y(1+2*fr:ix+2*fr,1+2*fc:ix+2*fc)=image;
    out=zeros(ix+2*fr,iy+2*fc);
   for i=1+fr:ix+3*fr
      for j=1+fc:iy+3*fc
        out(i-fr,j-fc)=sum(sum(y(i-fr:i+fr,j-fc:j+fc).*filter));
      end
   end
   
elseif (strcmp(mode,'samemirror'))
    m_x=[image(fr:-1:1,:);image;image(end:-1:end-(fr-1),:)];
    m_x=[m_x(:,fc:-1:1),m_x,m_x(:,end:-1:end-(fc-1))];
    out=zeros(ix,iy);
   for i=1+fr:ix+fr
      for j=1+fc:iy+fc
        out(i-fr,j-fc)=sum(sum(m_x(i-fr:i+fr,j-fc:j+fc).*filter));
      end
   end
    
elseif (strcmp(mode,'fullmirror'))
    m_x=[image(fr*2:-1:1,:);image;image(end:-1:end-(fr*2-1),:)];
    m_x=[m_x(:,fc*2:-1:1),m_x,m_x(:,end:-1:end-(fc*2-1))];
    out=zeros(ix+2*fr,iy+2*fc);
   for i=1+fr:ix+3*fr
      for j=1+fc:iy+3*fc
        out(i-fr,j-fc)=sum(sum(m_x(i-fr:i+fr,j-fc:j+fc).*filter));
      end
   end
end

end