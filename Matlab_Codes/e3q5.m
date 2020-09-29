% Same as Q4 for my image

b_original = imread('brihat.png');
brihat = rgb2gray(b_original);

figure
subplot(3, 3, 1);
imshow(b_original);
title('Original');

subplot(3, 3, 4);
imshow(brihat);
title('Original (Grayscale)');

% -------------
% IDEAL FILTERS
% -------------
radius = 25;

cf = fftshift(fft2(brihat));
% fftshow(cf, 'log');
% title('Image after DFT');

%  IDEAL LOW PASS
low = lowpass(brihat, radius);
cfl = cf .* low;
% fftshow(cfl, 'log');
% title(['Low Pass Ideal Filtering, radius=' num2str(radius)]);

cfli = ifft2(cfl);
subplot(3, 3, 2);
fftshow(cfli, 'abs');
title('Ideal Low Pass');

%  IDEAL HIGH PASS
cf = fftshift(fft2(brihat));
% fftshow(cf, 'log');
% title('Image after DFT');

high = highpass(brihat, radius);
cfh = cf .* high;
% fftshow(cfh, 'log');
% title(['High Pass Ideal Filtering, radius=' num2str(radius)]);

cfhi = ifft2(cfh);
subplot(3, 3, 3);
fftshow(cfhi, 'abs');
title('Ideal High Pass');

% -------------------
% BUTTERWORTH FILTERS
% -------------------

cutoff = 15;
order = 1;

% BUTTERWORTH LOW PASS
bl = lbutter(brihat, cutoff, order);
cfbl = cf .* bl;
% fftshow(cfbl, 'log')
% title(['Low Pass ButterWorth Filtering, cutoff=' num2str(cutoff) ', order=' num2str(order)]);

cfbli = ifft2(cfbl);
subplot(3, 3, 5);
fftshow(cfbli, 'abs');
title('ButterWorth Low Pass');

% BUTTERWORTH HIGH PASS
bh = hbutter(brihat, cutoff, order);
cfbh = cf .* bh;
% fftshow(cfbh, 'log')
% title(['High Pass ButterWorth Filtering, cutoff=' num2str(cutoff) ', order=' num2str(order)]);

cfbhi = ifft2(cfbh);
subplot(3, 3, 6);
fftshow(cfbhi, 'abs')
title('ButterWorth High Pass');

% ----------------
% GAUSSIAN FILTERS
% ----------------
cm_size = size(brihat);
sigma = 20;

% GAUSSIAN LOW PASS
gl = mat2gray(fspecial('gaussian', cm_size, sigma));
cfgl = cf .* gl;
% fftshow(cfgl, 'log')
% title(['Low Pass Gaussian Filtering, \sigma=' num2str(sigma)]);

cfgli = ifft2(cfgl);
subplot(3, 3, 8);
fftshow(cfgli, 'abs')
title('Gaussian Low Pass');

% GAUSSIAN HIGH PASS
gh = 1 - gl;
cfgh = cf .* gh;
% fftshow(cfgh, 'log')
% title(['High Pass Gaussian Filtering, \sigma=' num2str(sigma)]);

cfghi = ifft2(cfgh);
subplot(3, 3, 9);
fftshow(cfghi, 'abs')
title('Gaussian High Pass');
