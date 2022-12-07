% https://l1near.top/index.php/2021/01/31/91.html
clc;clear;close all;
alpha = 80;

im = double(imread('original.jpg'))/255;
imsize = size(im)
TH=zeros(imsize(1)*0.5,imsize(2),imsize(3));
TH1 = TH;
FA=fft2(im);
FAO=imread('snow.jpg')
FA2=fft2(FAO);
load('encode.mat')
G=(FA2-FA)/alpha;
GG=G;
for i=1:imsize(1)*0.5
    for j=1:imsize(2)
        GG(M(i),N(j),:)=G(i,j,:);
    end
end
for i=1:imsize(1)*0.5
    for j=1:imsize(2)
        GG(imsize(1)+1-i,imsize(2)+1-j,:)=GG(i,j,:);
    end
end
figure,imshow(GG);title('extracted watermark');
%imwrite(uint8(GG),'extracted watermark.jpg');