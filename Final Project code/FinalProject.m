%   Final Project Matlab Code
%   2018/1/22
%   404415026 呂哲宇
%   Image Quality Measure FM
%   總共分成五個部分 , 每個clear; 之間就是一個部分.
%   CPBD 在Final Project CPBD.m裡面,開啟執行即可
%   JNB  在Final Project JNB .m裡面,開啟執行即可
%   BM3D的部分在BM3D的資料夾裡面, 開啟test.m檔執行即可
%=============== Part-1 pepper image RGB to Gray ===============part1
clear;
image=imread('caribou.tif');
image=double(image);
%========== image Gaussian filter -> matlab funciton ==========
G1=image;
figure(1);imshow(G1/255);
G2=imgaussfilt(image,0.4);
figure(2);imshow(G2/255);
G3=imgaussfilt(image,0.8);
figure(3);imshow(G3/255);
G4=imgaussfilt(image,1.2);
figure(4);imshow(G4/255);
G5=imgaussfilt(image,1.6);
figure(5);imshow(G5/255);
G6=imgaussfilt(image,2.0);
figure(6);imshow(G6/255);
G7=imgaussfilt(image,2.4);
figure(7);imshow(G7/255);
G8=imgaussfilt(image,2.8);
figure(8);imshow(G8/255);

%=============== Fourier Transform image ===============

F1=FourierTransform(G1);
figure(21);imshow(F1);
F2=FourierTransform(G2);
figure(22);imshow(F2);
F3=FourierTransform(G3);
figure(23);imshow(F3);
F4=FourierTransform(G4);
figure(24);imshow(F4);
F5=FourierTransform(G5);
figure(25);imshow(F5);
F6=FourierTransform(G6);
figure(26);imshow(F6);
F7=FourierTransform(G7);
figure(27);imshow(F7);
F8=FourierTransform(G8);
figure(28);imshow(F8);
%========== 3-1  image quality measure ==========
% Input : Image I of size M * N
% Output: Image Quality measure (FM) 
% where FM stands for Frequency Domain Image Blur Measure

% calculate image quality measure (FM)
% Just Test
% FM8=FMfunction(F8);

%========== 3-2  Lena image Demonstration ==========part2
clear;
Image=imread('cameraman.png');
Image=double(Image);

Image1=Image;
figure(1);imshow(Image1/255);
ImageF1=FourierTransform(Image1);
figure(2);imshow(ImageF1);
FM1=FMfunction(ImageF1);

Image2=imgaussfilt(Image,4);
figure(3);imshow(Image2/255);
ImageF2=FourierTransform(Image2);
figure(4);imshow(ImageF2);
FM2=FMfunction(ImageF2);
x1=[1];
y1=[FM1];
x2=[2];
y2=[FM2];
plot(x1,y1,'*',x2,y2,'*');
title('Image Quality Measure (FM) vs Figure');
xlabel('Figure ');
ylabel('Image Quality Measure (FM)');
legend('Figure-1','Figure-2','Location','best');

%=============== 4.Result ===============
%=============== 4-1 ====================part3
clear;
x=[0,0.4,0.8,1.2,1.6,2.0,2.4,2.8,3.2,3.6,4.0];
caribou=imread('caribou.tif');
y1=Resultdata(caribou);
cameraman=imread('cameraman.png');
y2=Resultdata(cameraman);
barbara=imread('barbara.bmp');
y3=Resultdata(barbara);
boats=imread('boats.png');
boats=rgb2gray(boats);
y4=Resultdata(boats);
bike=imread('bike.png');
bike=rgb2gray(bike);
y5=Resultdata(bike);
buffalo=imread('buffalo.tif');
y6=Resultdata(buffalo);
wombats=imread('wombats.tif');
y7=Resultdata(wombats);
%===========Plot 5-(a)==========================
plot(x,y1,'--s',x,y2,'--*',x,y3,'--o',x,y4,'--h',x,y5,'-->',x,y6,'--<',x,y7,'--x');
title('Image Quality Measure (FM) vs Standard Deviation of Gaussian Blur');
xlabel('Standard Deviation of Gaussian Blur');
ylabel('Image Quality Measure (FM)');
legend('caribou','cameraman','barbara','boats','bike','buffalo','wombats','Location','best');

%=============== 4-2 ===========================
%= a large of calculations =====================
%= need some times =============================
%= theta 0 45 90 135 ===========================part4
clear;
image=imread('peppers256.png');
image=double(image);
x=[0,5,10,15,20,25,30,35,40,45,50];
y1=MotionBlur(image,0);
y2=MotionBlur(image,45);
y3=MotionBlur(image,90);
y4=MotionBlur(image,135);
%================Plot 6-(a)=========================
plot(x,y1,'r',x,y2,'g',x,y3,'b',x,y4,'k');
title('Image Quality Measure (FM) vs Number of pixels moved L for different theta');
xlabel('Number of pixels moved L');
ylabel('Image Quality Measure (FM)');
legend('theta=0','theta=45','theta=90','theta=135','Location','best');
%===================================================
%===================================================
%==========BM3D image to calculate FM===============Part5
clear;
image=imread('test11.png');
image=double(image);
figure(1);
imshow(image/255);
G1=image;
F1=FourierTransform(G1);
FM1=FMfunction(F1);

image=imread('test12.png');
image=double(image);
figure(2);
imshow(image/255);
G1=image;
F1=FourierTransform(G1);
FM2=FMfunction(F1);
%====================================================
%=================     END     ======================