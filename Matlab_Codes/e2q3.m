%------------------------------------------------------------------------------------------------------------------
% Brihat Ratna Bajracharya
% 19/075
% CDCSIT
%------------------------------------------------------------------------------------------------------------------
clearall;
close all;

figure('Name', 'Question 3', 'NumberTitle', 'off');
font_size = 10;

%------------------------------------------------------------------------------------------------------------------
% read image: rice.png
rice = imread('C:\Users\HP\Desktop\IPPLAssignment2\rice.png');

% show actual image: rice.png
subplot(2, 3, 1);
imshow(rice);
title('a. Rice (Actual Image)', 'FontSize', font_size, 'Interpreter', 'None');

% imtool(rice)
% imhist(rice)
%------------------------------------------------------------------------------------------------------------------

%------------------------------------------------------------------------------------------------------------------
% change png image to grayscale and calculate the threshold value,
% then create a new binary image using this calculated threshold value
rice_gray = mat2gray(rice);
T_rice_gray = graythresh(rice_gray);
rice_gray_binary = im2bw(rice_gray, T_rice_gray);

% plot gray image and binary image
subplot(2, 3, 2);
imshow(rice_gray);
title('b. Rice (Grayscale)', 'FontSize', font_size, 'Interpreter', 'None');
% imtool(rice_gray)

subplot(2, 3, 3);
imshow(rice_gray_binary);
title('c. Rice (Binary)', 'FontSize', font_size, 'Interpreter', 'None');
% imtool(rice_gray_binary)
%------------------------------------------------------------------------------------------------------------------

%------------------------------------------------------------------------------------------------------------------
% enumerate all the objects in the figure
[L_rice, num_rice] = bwlabel(rice_gray_binary);

% then display no of object (this gives number of rice grain
disp(['Number of rice grain: ', num2str(num_rice)]);
% num_rice
%------------------------------------------------------------------------------------------------------------------

%------------------------------------------------------------------------------------------------------------------
% regionprops command is used to obtain quantitative information about the objects
% gray_image is needed for 'MeanIntensity' for 'table'
D_rice = regionprops('table', L_rice, rice_gray, 'Area', 'MeanIntensity', 'SubarrayIdx');
% D_rice = regionprops(L_rice, 'area');

% making copy of binary image for two different analysis
rice_gray_binary_good_area = rice_gray_binary;
rice_gray_binary_good_mi = rice_gray_binary;
%------------------------------------------------------------------------------------------------------------------

%------------------------------------------------------------------------------------------------------------------
% sorting Area prop for analysis
area_list_rice = [D_rice.Area];
sort(area_list_rice, 'descend');

% specify threshold value from sorted list
% then remove all those element that do not match threshold value
thres = 120;
D_rice.isGreater = D_rice.Area > thres;
objRemoveIdxA = find(~D_rice.isGreater);
for i = find(~D_rice.isGreater).'
    rice_gray_binary_good_area(D_rice.SubarrayIdx{i,1},D_rice.SubarrayIdx{i,2}) = false;
end
% imtool(rice_gray_binary);

% plot this binary image (gives only good rice grain using Area prop)
subplot(2, 3, 4);
imshow(rice_gray_binary_good_area);
title('d. Rice (Binary, Good Area)', 'FontSize', font_size, 'Interpreter', 'None');

% display number of eliminated rice grains
eliminated_rice_grains = length(objRemoveIdxA);
disp(['Number of eliminated rice grains (prop: Area): ', num2str(eliminated_rice_grains)]);
%------------------------------------------------------------------------------------------------------------------

%------------------------------------------------------------------------------------------------------------------
% sorting MeanIntensity prop for analysis
mi_list_rice = [D_rice.MeanIntensity];
sort(mi_list_rice, 'descend');

% specify threshold value from sorted list
% then remove all those element that do not match threshold value
thres = 0.80;
D_rice.isGreater = D_rice.MeanIntensity > thres;
objRemoveIdxMI = find(~D_rice.isGreater);
for i = find(~D_rice.isGreater).'
    rice_gray_binary_good_mi(D_rice.SubarrayIdx{i,1},D_rice.SubarrayIdx{i,2}) = false;
end

% plot this binary image (gives only good rice grain using MeanIntensity prop)
subplot(2, 3, 5);
imshow(rice_gray_binary_good_area);
title('e. Rice (Binary, Good MI)', 'FontSize', font_size, 'Interpreter', 'None');

% display number of eliminated rice grains
eliminated_rice_grains = length(objRemoveIdxMI);
disp(['Number of eliminated rice grains (prop: MI): ', num2str(eliminated_rice_grains)]);
%------------------------------------------------------------------------------------------------------------------
