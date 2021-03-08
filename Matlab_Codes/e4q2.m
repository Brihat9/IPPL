clearall;

t = imread('text.tif');
c = imread('cameraman.tif');

figure
subplot(2,2,1);
imshow(t,'InitialMagnification','fit');
title('(1) text.tif');

subplot(2,2,2);
imshow(c,'InitialMagnification','fit');
title('(2) cameraman.tif');

m = uint8(double(c) + 255 * double(t));

subplot(2,2,3);
imshow(m,'InitialMagnification','fit');
title('(3) Superimposed result');

% m_new = uint8(double(c) .* double(~t));

m_text_isolate = m>=255;
subplot(2,2,4);
imshow(m_text_isolate,'InitialMagnification','fit');
title('(4) Text isloated from (3)');
