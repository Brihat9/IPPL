function out=hbutter(im,d,n)
    % HBUTTER(IM,D,N) creates a high-pass Butterworth filter
    % of the same size as image IM, with cutoff D, and order N
    %
    % Use:
    %   x=imread('cameraman.tif');
    %   l=hbutter(x,25,2);
    %
    % Code from: Notes for SCM2511 Image Processing 1 (Alasdair McAndrew)
    % School of Computer Science and Mathematics (Victoria University of Technology)
    % An Introduction to Digital Image Processing with Matlab
    %
    out = 1 - lbutter(im, d, n);
end
