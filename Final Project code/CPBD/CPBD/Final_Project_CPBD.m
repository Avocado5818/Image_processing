% CPBD
clear;
x=[0,0.4,0.8,1.2,1.6,2.0,2.4,2.8,3.2,3.6,4.0];

caribou=imread('caribou.tif');
caribou = double(caribou);
y1 = integration_CPBD(caribou);

cameraman=imread('cameraman.tif');
cameraman = double(cameraman);
y2 = integration_CPBD(cameraman);

barbara=imread('barbara.bmp');
barbara = double(barbara);
y3 = integration_CPBD(barbara);

boats=imread('boats.png');
boats = double(boats);
y4 = integration_CPBD(boats);

bike=imread('bike.png');
bike=rgb2gray(bike);
bike = double(bike);
y5 = integration_CPBD(bike);

buffalo=imread('buffalo.tif');
buffalo = double(buffalo);
y6 = integration_CPBD(buffalo);

wombats=imread('wombats.tif');
wombats = double(wombats);
y7 = integration_CPBD(wombats);

plot(x,y1,'--s',x,y2,'--*',x,y3,'--o',x,y4,'--h',x,y5,'-->',x,y6,'--<',x,y7,'--x');
title('CPBD Measure  vs Standard Deviation of Gaussian Blur');
xlabel('Standard Deviation of Gaussian Blur');
ylabel('CPBD Measure');
legend('caribou','cameraman','barbara','boats','bike','buffalo','wombats','Location','best');
