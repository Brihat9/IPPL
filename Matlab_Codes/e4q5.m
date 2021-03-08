clearall;

% FOR E4Q5 1.
% f = imread('ckt-board-orig.tif');
% FOR E4Q5 2.
% f = imread('pollen.tif');
% FOR E4Q5 3.
f = rgb2gray(imread('brihat.png'));

figure
subplot(2,3,1);
imshow(f)
title('original image');

fn1 = imnoise(f, 'gaussian', 0.5, 0.02);
subplot(2,3,2);
imshow(fn1)
title('gaussian (\mu = 0.5, \sigma^2 = 0.02)');

fn2 = imnoise(f, 'localvar', 0.04 * rand(size(f)));
subplot(2,3,3);
imshow(fn2)
title('localvar');

fn3 = imnoise(f, 'poisson');
subplot(2,3,4);
imshow(fn3)
title('poisson');

fn4 = imnoise(f, 'salt & pepper', 0.2);
subplot(2,3,5);
imshow(fn4)
title('salt & pepper (density = 0.2)');

fn5 = imnoise(f, 'speckle', 0.05);
subplot(2,3,6);
imshow(fn5)
title('speckle (\sigma^2 = 0.05)');

% % filters part
% fn1 -> median
% fn2 -> gaussian
% fn3 -> median
% fn4 -> median
% fn5 -> median

% For E4Q5 1.
% noisy_image = fn1;
% 
% figure
% subplot(3,3,1);
% imshow(noisy_image);
% title('noisy image');
% 
% fil1 = fspecial('average', 6);
% fil2 = fspecial('disk', 5);
% fil3 = fspecial('gaussian', 15, 2);
% fil4 = fspecial('laplacian', 0);
% fil5 = fspecial('log', 3, 0.6);
% fil6 = fspecial('prewitt');
% fil7 = fspecial('sobel');
% 
% fil_img1 = imfilter(noisy_image, fil1);
% subplot(3,3,2);
% imshow(fil_img1);
% title('average (size = 6)');
% 
% fil_img2 = imfilter(noisy_image, fil2);
% subplot(3,3,3);
% imshow(fil_img2);
% title('disk (radius = 5)');
% 
% fil_img3 = imfilter(noisy_image, fil3);
% subplot(3,3,4);
% imshow(fil_img3);
% title('gaussian (size = 15, \sigma = 2)');
% 
% fil_img4 = imfilter(noisy_image, fil4, 'circular');
% subplot(3,3,5);
% imshow(fil_img4);
% title('laplacian (\alpha = 0)');
% 
% fil_img5 = imfilter(noisy_image, fil5);
% subplot(3,3,6);
% imshow(fil_img5);
% title('log (size = 3, \sigma = 0.6)');
% 
% fil_img6 = imfilter(noisy_image, fil6);
% subplot(3,3,7);
% imshow(fil_img6);
% title('prewitt');
% 
% fil_img7 = imfilter(noisy_image, fil7);
% subplot(3,3,8);
% imshow(fil_img7);
% title('sobel');
% 
% fil_img_sp = medfilt2(noisy_image);
% subplot(3,3,9);
% imshow(fil_img_sp);
% title('median');

% FOR E4Q5 2. and 3.
figure
subplot(2,3,1);
imshow(f);
title('original image');

% fil1 = fspecial('average', 6);
% fil2 = fspecial('disk', 5);
fil3 = fspecial('gaussian', 15, 2);
% fil4 = fspecial('laplacian', 0);
% fil5 = fspecial('log', 3, 0.6);
% fil6 = fspecial('prewitt');
% fil7 = fspecial('sobel');

fil_img_sp = medfilt2(fn1);
subplot(2,3,2);
imshow(fil_img_sp);
title('gaussian - median');

fil_img = imfilter(fn2, fil3);
subplot(2,3,3);
imshow(fil_img);
title('localvar - gaussian');

fil_img_sp = medfilt2(fn3);
subplot(2,3,4);
imshow(fil_img_sp);
title('poisson - median');

fil_img_sp = medfilt2(fn4);
subplot(2,3,5);
imshow(fil_img_sp);
title('salt & pepper - median');

fil_img_sp = medfilt2(fn5);
subplot(2,3,6);
imshow(fil_img_sp);
title('speckle - median');



