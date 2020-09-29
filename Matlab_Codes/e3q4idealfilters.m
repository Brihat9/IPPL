clearall;

radius = 35;

% cm = imread('cameraman.tif');
cm = rgb2gray(imread('engineer.tiff'));
% cm = rgb2gray(imread('cat1.png'));
% cm = rgb2gray(imread('brihat_photo_nitc.jpg'));

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


% IDEAL HIGH PASS FILTERS
cf = fftshift(fft2(cm));
figure, fftshow(cf, 'log');
title('Image after DFT');

high = highpass(cm, radius);
cfh = cf .* high;
figure, fftshow(cfh, 'log');
title(['High Pass Ideal Filtering, radius=' num2str(radius)]);

cfhi = ifft2(cfh);
figure, fftshow(cfhi, 'abs');
title('Ideal High Pass Resulting Image');
