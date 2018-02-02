function run_ex11()

% load image
img = imread('cow.jpg');
% img = imread('zebra_b.jpg');
% for faster debugging you might want to decrease the size of your image
% (especially for the mean-shift part)
% img = imresize(img, 0.5);

figure, imshow(img), title('original image')

% smooth image (11.1a)
H = fspecial('gaussian', 5, 5);
imgSmoothed = imfilter(img, H);
figure, imshow(imgSmoothed), title('smoothed image')

% convert to L*a*b* image (11.1b)
cform = makecform('srgb2lab');
imglab = applycform(imgSmoothed,cform); 
figure, imshow(imglab), title('l*a*b* image')

% (6.2)
% [mapMS, peak] = meanshiftSeg(imglab);
% visualizeSegmentationResults (mapMS,peak);

% % (6.3)
[mapEM,cluster,alpha,mu,cov] = EM(imglab);
visualizeSegmentationResults (mapEM,cluster);
alpha, mu, cov
end