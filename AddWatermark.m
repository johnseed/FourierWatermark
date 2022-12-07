clc;clear;close all;
alpha = 1;

%% read data
im = double(imread('gl1.jpg'))/255;
mark = double(imread('watermark.jfif'))/255;
% figure, imshow(im),title('original image');
% figure, imshow(mark),title('watermark');

%% encode mark
imsize = size(im);
%random
TH=zeros(imsize(1)*0.5,imsize(2),imsize(3));
TH1 = TH;
TH1(1:size(mark,1),1:size(mark,2),:) = mark;
M=randperm(0.5*imsize(1));
N=randperm(imsize(2));
save('encode.mat','M','N');
for i=1:imsize(1)*0.5
    for j=1:imsize(2)
        TH(i,j,:)=TH1(M(i),N(j),:);
    end
end
% symmetric
mark_ = zeros(imsize(1),imsize(2),imsize(3));
mark_(1:imsize(1)*0.5,1:imsize(2),:)=TH;
for i=1:imsize(1)*0.5
    for j=1:imsize(2)
        mark_(imsize(1)+1-i,imsize(2)+1-j,:)=TH(i,j,:);
    end
end
% figure,imshow(mark_),title('encoded watermark');
%imwrite(mark_,'encoded watermark.jpg');

%% add watermark
FA=fft2(im);
% figure,imshow(FA);title('spectrum of original image');
FB=FA+alpha*double(mark_);
% figure,imshow(FB); title('spectrum of watermarked image');
FAO=ifft2(FB);
% figure,imshow(FAO); title('watermarked image');
imwrite(FAO,'watermarked image.bmp');
% imsave