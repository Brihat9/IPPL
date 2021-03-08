function e4q3
    function output = contrast_stretch(f, m, E)
        output = 1 ./ (1 + (m ./ (double(f) + eps)) .^ E);
    end

    function output = log_transform(c, f)
        output = c * log(1 + double(f));
    end

    close all;

    % f = imread('spectrum.tif');
    % f = mat2gray(f,[0 255]);
    % 
    % v = 10;
    % g_1 = log2(1 + v*f)/log2(v+1);
    % 
    % v = 30;
    % g_2 = log2(1 + v*f)/log2(v+1);
    % 
    % v = 200;
    % g_3 = log2(1 + v*f)/log2(v+1);
    %  
    % figure();
    % subplot(1,2,1);
    % imshow(f,[0 1]);
    % xlabel('a).Original Image');
    % subplot(1,2,2);
    % imshow(g_1,[0 1]);
    % xlabel('b).Log Transformations v=10');
    %  
    % figure();
    % subplot(1,2,1);
    % imshow(g_2,[0 1]);
    % xlabel('c).Log Transformations v=100');
    % 
    % subplot(1,2,2);
    % imshow(g_3,[0 1]);
    % xlabel('d).Log Transformations v=200');

    f = imread('spectrum.tif');
    m = mean2(f);
    figure
    subplot(3,5,1);
    imshow(f);
    title('spectrum.tif');

    cf = contrast_stretch(f, m, 0.25);
    subplot(3,5,2);
    imshow(cf);
    title('CS (m=2.08, E=0.25)');
    
    cf = contrast_stretch(f, m, 0.5);
    subplot(3,5,3);
    imshow(cf);
    title('CS (m=2.08, E=0.5)');
    
    cf = contrast_stretch(f, m, 1);
    subplot(3,5,4);
    imshow(cf);
    title('CS (m=2.08, E=1)');
    
    cf = contrast_stretch(f, m, 2);
    subplot(3,5,5);
    imshow(cf);
    title('CS (m=2.08, E=2)');
    
    cf = contrast_stretch(f, 16, 0.5);
    subplot(3,5,6);
    imshow(cf);
    title('CS (m=2.08, E=16)');
    
    cf = contrast_stretch(f, 0.5, 0.5);
    subplot(3,5,7);
    imshow(cf);
    title('CS (m=0.5, E=0.5)');
    
    cf = contrast_stretch(f, 1, 0.5);
    subplot(3,5,8);
    imshow(cf);
    title('CS (m=1, E=0.5)');
    
    cf = contrast_stretch(f, 2, 0.5);
    subplot(3,5,9);
    imshow(cf);
    title('CS (m=2, E=0.5)');
    
    cf = contrast_stretch(f, 4, 0.5);
    subplot(3,5,10);
    imshow(cf);
    title('CS (m=4, E=0.5)');
    
    cf = contrast_stretch(f, 8, 0.5);
    subplot(3,5,11);
    imshow(cf);
    title('CS (m=8, E=0.5)');
    
    c = 0.25;
    g = im2uint8(mat2gray(log_transform(c, f)));
    subplot(3,5,12);
    imshow(g);
    title(['log transform (c=' num2str(c) ')']);
    
    c = 0.5;
    g = im2uint8(mat2gray(log_transform(c, f)));
    subplot(3,5,13);
    imshow(g);
    title(['log transform (c=' num2str(c) ')']);
    
    c = 1;
    g = im2uint8(mat2gray(log_transform(c, f)));
    subplot(3,5,14);
    imshow(g);
    title(['log transform (c=' num2str(c) ')']);
    
    c = 2;
    g = im2uint8(mat2gray(log_transform(c, f)));
    subplot(3,5,15);
    imshow(g);
    title(['log transform (c=' num2str(c) ')']);    
end
