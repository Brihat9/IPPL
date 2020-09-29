clearall;
radius = 29;

% cm = imread('cameraman.tif');
cm = rgb2gray(imread('engineer.tiff'));
% cm = rgb2gray(imread('cat1.png'));
% cm = rgb2gray(imread('brihat_photo_nitc.jpg'));
% cm = rgb2gray(imread('brihat.png'));

% IDEAL LOW PASS FILTERS
cf = fftshift(fft2(cm));
figure, fftshow(cf, 'log');
title('Image after DFT');

low = lowpass(cm, radius);
cfl = cf .* low;
figure, fftshow(cfl, 'log');
title(['Low Pass Ideal Filtering, radius=' num2str(radius)]);

cfli = ifft2(cfl);
figure, fftshow(cfli, 'abs');
title('Ideal Low Pass Resulting Image');

radius = 30;

low = lowpass(cm, radius);
cfl = cf .* low;
figure, fftshow(cfl, 'log');
title(['Low Pass Ideal Filtering, radius=' num2str(radius)]);

cfli = ifft2(cfl);
figure, fftshow(cfli, 'abs');
title('Ideal Low Pass Resulting Image');

radius = 31;

low = lowpass(cm, radius);
cfl = cf .* low;
figure, fftshow(cfl, 'log');
title(['Low Pass Ideal Filtering, radius=' num2str(radius)]);

cfli = ifft2(cfl);
figure, fftshow(cfli, 'abs');
title('Ideal Low Pass Resulting Image');

radius = 32;

low = lowpass(cm, radius);
cfl = cf .* low;
figure, fftshow(cfl, 'log');
title(['Low Pass Ideal Filtering, radius=' num2str(radius)]);

cfli = ifft2(cfl);
figure, fftshow(cfli, 'abs');
title('Ideal Low Pass Resulting Image');

% 30 for engineer,tif