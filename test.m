I = imread('test.png');
imshow(I);
%{
title('Original Image');
BW = imbinarize(I,'adaptive','ForegroundPolarity','dark','Sensitivity',0.1);
figure;
imshow(BW);
title('Binary Version of Image');
%}