clearall;

% f = imread('broken-text.tif');
f = imread('noisy_fingerprint.tif');
figure
subplot(2,2,1);
imshow(f);
title('Original');

se = [0 1 0; 1 1 1; 0 1 0];
% se = strel('square',20);
fo = imopen(f, se);
subplot(2,2,2);
imshow(fo);
title('Opening');

fc = imclose(f, se);
subplot(2,2,3);
imshow(fc);
title('Closing');

foc = imclose(fo, se);
subplot(2,2,4);
imshow(foc);
title('Opening and Closing');
