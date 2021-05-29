clearall;

% bt = imread('broken-text.tif');
bt = imread('noisy_fingerprint.tif');

figure
subplot(2,4,1);
imshow(bt);
% title('Original broken-text.tif');
title('Original noisy-fingerprint.tif');

% Structuring Elements
se1 = strel('square',3);      % 11-by-11 square
se2 = strel('line',5,45);     % line, length 10, angle 45 degrees
se3 = strel('disk',5);        % disk, radius 15
se4 = strel('rectangle', [2 2]);
se5 = strel('octagon',3); 

% Dilation
B = [0 1 0; 1 1 1; 0 1 0];
bt_dil = imdilate(bt, B);
subplot(2,4,2);
imshow(bt_dil);
title('Dilated by 3x3 matrix');

bt_dil = imdilate(bt, se1);
subplot(2,4,3);
imshow(bt_dil,'InitialMagnification','fit');
title('Dilated by square SE');

bt_dil = imdilate(bt, se2);
subplot(2,4,4);
imshow(bt_dil,'InitialMagnification','fit');
title('Dilated by line SE');

bt_dil = imdilate(bt, se3);
subplot(2,4,5);
imshow(bt_dil,'InitialMagnification','fit');
title('Dilated by disk SE');

bt_dil = imdilate(bt, se4);
subplot(2,4,6);
imshow(bt_dil,'InitialMagnification','fit');
title('Dilated by rectangle SE');

bt_dil = imdilate(bt, se5);
subplot(2,4,7);
imshow(bt_dil,'InitialMagnification','fit');
title('Dilated by octagon SE');

% Erosion
% B = [0 1 0; 1 1 1; 0 1 0];
% bt_ero = imerode(bt, B);
% subplot(2,4,2);
% imshow(bt_ero);
% title('Erosion by 3x3 matrix');
% 
% bt_ero = imerode(bt, se1);
% subplot(2,4,3);
% imshow(bt_ero,'InitialMagnification','fit');
% title('Erosion by square SE');
% 
% bt_ero = imerode(bt, se2);
% subplot(2,4,4);
% imshow(bt_ero,'InitialMagnification','fit');
% title('Erosion by line SE');
% 
% bt_ero = imerode(bt, se3);
% subplot(2,4,5);
% imshow(bt_ero,'InitialMagnification','fit');
% title('Erosion by disk SE');
% 
% bt_ero = imerode(bt, se4);
% subplot(2,4,6);
% imshow(bt_ero,'InitialMagnification','fit');
% title('Erosion by rectangle SE');
% 
% bt_ero = imerode(bt, se5);
% subplot(2,4,7);
% imshow(bt_ero,'InitialMagnification','fit');
% title('Erosion by octagon SE');
