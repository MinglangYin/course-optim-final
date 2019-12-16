% Author: Minglang Yin, minglang_yin@brown.edu
% Implementation of a de-noise optimization algorithm

clear all
close all
clc

% Main
x = double(imread('ima-noisy.pgm'))/255;
% figure(1); imshow(x); title('Original Image');

tt = 1;
yy_norm = [];
for t = 5:5:40
    [y, y_norm] = ADMM(x, t);
    yy_norm{tt} = y_norm;
    tt = tt+1;
end

y_show = ADMM(x, 20);
figure(); imshow(y_show); title('filtered image with t = 20');
imwrite(uint8(y_show*255), 'denoised.pgm')





















