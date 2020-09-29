% IPPL - Exercise 1

% Q1. Using vectorization and the colon operator, use a single command each to generate:
%     Q1.1. the first 15 cubes,
first_fifteen_cubes = [1:15] .^ 3

%     Q1.2. the values sin(n?/16) for n from 1 to 16
sine_function_ans = sin([1:16] .* pi / 16)


% Q2. Enter the following matrices:
A = [1 2 3; 2 3 4; 3 4 5]
B = [-1 2 -1; -3 -4 5; 2 3 -4]
C = [0 -2 1; -3 5 2; 1 1 -7]

% Calculate
%     Q2.1. 2A - 3B
calc_21_ans = 2 * A - 3 * B

%     Q2.2. transpose(A)
calc_22_ans = A'

%     Q2.3. AB - BA
calc_23_ans = A * B - B * A

%     Q2.4. BC^(-1)
calc_24_ans = B * C^(-1)

%     Q2.5. transpose(AB)
calc_25_ans = (A * B)'

%     Q2.6. transpose(B)transpose(A)
calc_26_ans = B' * A'

%     Q2.7. A^2 + B^3
calc_27_ans = A^2 + B^3


% Q3. Type following commands in MATLAB and see what it gives
w = imread('tire.tif');
figure, imshow(w), impixelinfo

% RGB Image
a = imread('autumn.tif');
figure, imshow(a), impixelinfo
size(a)

% Information about your image
imfinfo('autumn.tif')


% Q4. Pick a grayscale image, say cameraman.tif or wombats.tif.
% Using the imwrite function,
% Write it to files of type JPEG, PNG and BMP.
% What are the sizes of those files?

cameraman = imread('cameraman.tif');

imwrite(cameraman,'cameramanpng.png','png');
imwrite(cameraman,'cameramanbmp.jpg','jpg');
imwrite(cameraman,'cameramanbmp.bmp','bmp');









