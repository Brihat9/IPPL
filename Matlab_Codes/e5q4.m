clearall;

I = imread('rice.png');
figure
subplot(2,2,1);
imshow(I);
title('Original');

% se = [0 1 0; 1 1 1; 0 1 0];
SE = strel('square',13  );
elim_rice = imopen(I, SE);
subplot(2,2,2);
imshow(elim_rice);
title('No Rice Grain');


J = filter2(fspecial('sobel'),I);
min_matrix = min(J(:));
max_matrix = max(J(:));

subplot(2,2,3);
imshow(J);
title('Converting to num matrix');

K = mat2gray(J);
min_image = min(K(:));
max_image = max(K(:));

subplot(2,2,4);
imshow(K);
title('Range [0,1]');

figure
mesh(K);
legend