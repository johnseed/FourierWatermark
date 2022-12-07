clc;clear;close all;
alpha = 1;

im = double(imread('original.jpg'))/255;
FA=fft2(im);
ori=double(imread('attack.jpg'))/255;
FB=fft2(ori);
imsize = size(im);
load('encode.mat');
FAO=ifft2(FB);
RI = FAO-double(im);
xl = 1:imsize(2);
yl = 1:imsize(1);
[xx,yy] = meshgrid(xl,yl);

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
