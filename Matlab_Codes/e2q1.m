clearall;
close all;
imtool close all;

pollen = imread('C:\Users\HP\Desktop\IPPLAssignment2\pollen.tif');
imtool(pollen)
% imshow(pollen)

pollen_double = double(pollen);
imtool(pollen_double)
% imshow(pollen_double)

bone = imread('C:\Users\HP\Desktop\IPPLAssignment2\bone-scan-GE.tif');
imtool(bone)

bone_double = double(bone);
imtool(bone_double)
