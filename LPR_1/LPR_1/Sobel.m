function out=Sobel(filter,image)

ix=size(image,1);
iy=size(image,2);
fx=size(filter,1);
fy=size(filter,2);
fr=floor(fx/2);
fc=floor(fy/2);

   y=zeros(ix+2*fr,iy+2*fc);
   y(1+fr:ix+fr,1+fc:iy+fc)=image;
   out=zeros(ix,iy);
   for i=1+fr:ix+fr
      for j=1+fc:iy+fc
        out(i-fr,j-fc)=sum(sum(y(i-fr:i+fr,j-fc:j+fc).*filter));
      end
   end
   out=abs(out);
   T=find(out>255);
   out(T)=255;
end