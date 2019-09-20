

input_image = imread('kitchen.jpeg');
figure;
subplot(2,3,1);
imshow(input_image); 
title('Kitchen image');

cform = makecform('srgb2lab');
lab_he = applycform(input_image,cform);

ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 3;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, ~] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);
                                  
pixel_labels = reshape(cluster_idx,nrows,ncols);

subplot(2,3,2);
imshow(pixel_labels,[]), title('image labeled by cluster index');

segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = input_image;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end

subplot(2,3,3);
Seg1=rgb2gray(segmented_images{1});
points1 = detectSURFFeatures(Seg1);
imshow(segmented_images{1}), title('Objects in cluster 1');
hold on;
plot(points1.selectStrongest(200));


subplot(2,3,4);
Seg2=rgb2gray(segmented_images{2});
points2 = detectSURFFeatures(Seg2);
imshow(segmented_images{2});
hold on;
plot(points2.selectStrongest(200));
title('objects in cluster 2');



subplot(2,3,5);
Seg3=rgb2gray(segmented_images{3});
points3 = detectSURFFeatures(Seg3);
imshow(segmented_images{3}); 
title('objects in cluster 3');
hold on;
plot(points3.selectStrongest(200));
%subplot(2,3,6);


%{
imshow(segmented_images{4});
Seg4=rgb2gray(segmented_images{4});
points4 = detectSURFFeatures(Seg4);
title('objects in cluster 4');
hold on;
plot(points4.selectStrongest(100));
%}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

input_image = imread('lena.png');
figure;
subplot(2,3,1);
imshow(input_image); 
title('Kitchen image');

cform = makecform('srgb2lab');
lab_he = applycform(input_image,cform);

ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 3;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, ~] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);
                                  
pixel_labels = reshape(cluster_idx,nrows,ncols);

subplot(2,3,2);
imshow(pixel_labels,[]), title('image labeled by cluster index');

segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = input_image;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end

subplot(2,3,3);
Seg1=rgb2gray(segmented_images{1});
points1 = detectSURFFeatures(Seg1);
imshow(segmented_images{1}), title('Objects in cluster 1');
hold on;
plot(points1.selectStrongest(200));


subplot(2,3,4);
Seg2=rgb2gray(segmented_images{2});
points2 = detectSURFFeatures(Seg2);
imshow(segmented_images{2});
hold on;
plot(points2.selectStrongest(200));
title('objects in cluster 2');



subplot(2,3,5);
Seg3=rgb2gray(segmented_images{3});
points3 = detectSURFFeatures(Seg3);
imshow(segmented_images{3}); 
title('objects in cluster 3');
hold on;
plot(points3.selectStrongest(200));
%subplot(2,3,6);


%{
imshow(segmented_images{4});
Seg4=rgb2gray(segmented_images{4});
points4 = detectSURFFeatures(Seg4);
title('objects in cluster 4');
hold on;
plot(points4.selectStrongest(100));
%}


