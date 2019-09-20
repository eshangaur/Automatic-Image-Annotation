clc 

I = imread('opencv_screenshot.jpg');
K = imread('fruits.png');
L = imread('airplane.png');
M = imread('kitchen.jpeg');
N = imread('lena.png');



I_gray = rgb2gray(I);
L_gray = rgb2gray(L);
M_gray = rgb2gray(M);
N_gray = rgb2gray(N);
K_gray = rgb2gray(K);


points1 = detectSURFFeatures(L_gray); % speeeded up robust features(SURF)
regions = detectMSERFeatures(L_gray); % Maximally Stable extreme regions(MSER)
points2 = detectFASTFeatures(L_gray); % features from accerated segment test(FAST)
points3 = detectHarrisFeatures(L_gray); % Harris

%{
points2 = detectSURFFeatures(K);
points3 = detectSURFFeatures(L_gray);
points4 = detectSURFFeatures(M_gray);
points5 = detectSURFFeatures(N_gray);
%}

number_points1=points1.length;
number_points2=regions.length;
number_points3=points2.length;
number_points4=points3.length;

total= [number_points1,number_points2,number_points3,number_points4];

x = [1,2,3,4];

figure ;
str1={'SURF','points'};
str2={'MSER','points'};
str3={'FAST','points'};
str4={'Harris','points'};

stem(x,total)
title('Features Detector Point Plot For Image 1')
text(1,690,str1);
text(2,600,str2);
text(3,665,str3);
text(4,830,str4);
ylabel('Number of points')
xlabel('Various Detectors')

fprintf('For Image 1\n');
fprintf('Total Points for SURF:%i\n', number_points1)
fprintf('Total Points for MSER:%i\n', number_points2)
fprintf('Total Points for FAST:%i\n', number_points3)
fprintf('Total Points for Harris:%i\n', number_points4)



figure ;
subplot(4,3,1);
imshow(L);
title('Original Image 1');

subplot(4,3,2);
imshow(L);
hold on;
plot(points1);
title('SURF Features') 

subplot(4,3,3);
imshow(L);
hold on;
plot(regions);
title('MSER Features') 

subplot(4,3,4);
imshow(L);
hold on;
plot(points2);
title('FAST Features') 

subplot(4,3,5);
imshow(L);
hold on;
plot(points3);
title('Harris Features') 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

points1 = detectSURFFeatures(K_gray); % speeeded up robust features(SURF)
regions = detectMSERFeatures(K_gray); % MSER
points2 = detectFASTFeatures(K_gray); % FAST
points3 = detectHarrisFeatures(K_gray); % Harris


number_points1=points1.length;
number_points2=regions.length;
number_points3=points2.length;
number_points4=points3.length;



fprintf('\n');
fprintf('For Image 2\n');
fprintf('Total Points for SURF:%i\n', number_points1)
fprintf('Total Points for MSER:%i\n', number_points2)
fprintf('Total Points for FAST:%i\n', number_points3)
fprintf('Total Points for Harris:%i\n', number_points4)


subplot(4,3,7);
imshow(K);
title('Original Image 2');

subplot(4,3,8);
imshow(K);
hold on;
plot(points1);
title('SURF Features') 

subplot(4,3,9);
imshow(K);
hold on;
plot(regions);
title('MSER Features') 

subplot(4,3,10);
imshow(K);
hold on;
plot(points2);
title('FAST Features') 

subplot(4,3,11);
imshow(K);
hold on;
plot(points3);
title('Harris Features')


total= [number_points1,number_points2,number_points3,number_points4];

x = [1,2,3,4];

figure;
str1={'SURF','points'};
str2={'MSER','points'};
str3={'FAST','points'};
str4={'Harris','points'};

stem(x,total)
title('Feature Detector Point Plot For Image 2');
text(1,300,str1);
text(2,500,str2);
text(3,215,str3);
text(4,155,str4);
ylabel('Number of points')
xlabel('Various Detectors')
