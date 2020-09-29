clearall;

cutoff = 25;
order = 1;

% cm = imread('cameraman.tif');
cm = rgb2gray(imread('engineer.tiff'));
% cm = rgb2gray(imread('cat1.png'));
% cm = rgb2gray(imread('brihat.png'));
% cm = rgb2gray(imread('brihat_photo_nitc.jpg'));

cf = fftshift(fft2(cm));
figure, fftshow(cf, 'log')
title('Image after DFT');

% BUTTERWORTH LOW PASS FILTER
bl = lbutter(cm, cutoff, order);
cfbl = cf .* bl;
figure, fftshow(cfbl, 'log')
title(['Low Pass ButterWorth Filtering, cutoff=' num2str(cutoff) ', order=' num2str(order)]);

cfbli = ifft2(cfbl);
figure, fftshow(cfbli, 'abs')
title('ButterWorth Low Pass Resulting Image');

% BUTTERWORTH HIGH PASS FILTER
bh = hbutter(cm, cutoff, order);
cfbh = cf .* bh;
figure, fftshow(cfbh, 'log')
title(['High Pass ButterWorth Filtering, cutoff=' num2str(cutoff) ', order=' num2str(order)]);

cfbhi = ifft2(cfbh);
figure, fftshow(cfbhi, 'abs')
title('ButterWorth High Pass Resulting Image');
