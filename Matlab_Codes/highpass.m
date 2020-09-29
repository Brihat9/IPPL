function out = highpass(im, d)
    % HIGHPASS(IM,D) creates a high-pass ideal filter
    % of the same size as image IM, with cutoff D
    %
    % Use:
    %   x = imread('cameraman.tif');
    %   l = highpass(x, 25);
    %
    % Code from: Notes for SCM2511 Image Processing 1 (Alasdair McAndrew)
    % School of Computer Science and Mathematics (Victoria University of Technology)
    % An Introduction to Digital Image Processing with Matlab
    %
    
    height = size(im, 1);
    width = size(im, 2);
    [x, y] = meshgrid(-floor(width / 2) : floor((width - 1) / 2), -floor(height / 2): floor((height - 1) / 2));
    z = sqrt(x .^ 2 + y .^ 2);
    out = (z > d);
end
