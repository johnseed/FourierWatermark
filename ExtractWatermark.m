%% extract watermark
clc;clear;close all;
alpha = 1;
im = double(imread('gl1.jpg'))/255;
imsize = size(im);
load('encode.mat')
FA=fft2(im);
FAO = double(imread('watermarked image.bmp'))/255;
FA2=fft2(FAO);
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