clearall;

f = imread('chest-xray.tif');

g1 = imadjust(f);
g2 = imadjust(f, [0 1], [1 0]);
g3 = imadjust(f, [0 1], [1 0], 0.5);
g4 = imadjust(f, [0 1], [1 0], 1);
g5 = imadjust(f, [0 1], [1 0], 2);
g6 = imadjust(f, [0 1], [1 0], 4);
g7 = imadjust(f, [0 1], [1 0], 8);

figure
subplot(3,3,1);
imshow(f);
title('chest-xray.tif');

subplot(3,3,2);
imshow(g1);
title('imadjust result');

subplot(3,3,3);
imshow(g2);
title('imadjust inverted result');

subplot(3,3,4);
imshow(g3);
title('\gamma = 0.5');

subplot(3,3,5);
imshow(g4);
title('\gamma = 1');

subplot(3,3,6);
imshow(g5);
title('\gamma = 2');

subplot(3,3,7);
imshow(g6);
title('\gamma = 4');

subplot(3,3,8);
imshow(g7);
title('\gamma = 8');