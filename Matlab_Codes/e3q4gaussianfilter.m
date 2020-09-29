clc;
clear;
close all;
imtool close all;

% cm = imread('cameraman.tif');
cm = rgb2gray(imread('engineer.tiff'));
% cm = rgb2gray(imread('brihat_photo_nitc.jpg'));
% cm = rgb2gray(imread('cat1.png'));
% cm = rgb2gray(imread('brihat.png'));

cf = fftshift(fft2(cm));
figure, fftshow(cf, 'log')
title('Image after DFT');

% [row column] = size(cm);
cm_size = size(cm);
sigma = 40;

% GAUSSIAN LOW PASS FILTER USING fspecial
gl = mat2gray(fspecial('gaussian', cm_size, sigma));
cfgl = cf .* gl;
figure, fftshow(cfgl, 'log')
title(['Low Pass Gaussian Filtering, \sigma=' num2str(sigma)]);

cfgli = ifft2(cfgl);
figure, fftshow(cfgli, 'abs')
title('Gaussian Low Pass Resulting Image');

% GAUSSIAN HIGH PASS FILTER USING fspecial
gh = 1 - gl;
cfgh = cf .* gh;
figure, fftshow(cfgh, 'log')
title(['High Pass Gaussian Filtering, \sigma=' num2str(sigma)]);

cfghi = ifft2(cfgh);
figure, fftshow(cfghi, 'abs')
title('Gaussian High Pass Resulting Image');
