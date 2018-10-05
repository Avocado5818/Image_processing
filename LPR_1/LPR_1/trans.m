function z=trans(w)
x=size(w,1);
y=size(w,2);

e=zeros(1,256);
z=zeros(x,y);
for i=1:x
    for j=1:y
        e(1,round(w(i,j)))=e(1,round(w(i,j)))+1;
    end
end

f=zeros(1,256);
f(1,1)=e(1,1);
for i=2:256
    f(1,i)=f(1,i-1)+e(1,i);
end

for i=1:x
    for j=1:y
        z(i,j)=f(1,round(w(i,j))+1)*255/(x*y);
    end
end

end