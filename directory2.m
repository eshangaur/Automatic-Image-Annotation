%%%%%%%%%% download directory


directry = '/Users/batmaneshan/Desktop/Image annotation/101_ObjectCategories.tar.gz';


outputFolder = ('/Users/batmaneshan/Desktop/Image annotation'); 


%{
if ~exist(outputFolder, 'dir') 
    disp('downloading caltech101 data set..');
    untar(directry, outputFolder);
    end
%}



rootFolder = fullfile(outputFolder, 'Caltech');


categories = {'airplanes_side','background','cars','cars_bg','faces','motorbikes_side'};
imds = imageDatastore(fullfile(rootFolder,categories), 'LabelSource', 'foldernames');

tbl = countEachLabel(imds);

minSetCount = min(tbl{:,2});  % min in each category

imds = splitEachLabel(imds, minSetCount, 'randomize');  

countEachLabel(imds);  %  display new set





 
[trainingSet, validationSet] = splitEachLabel(imds, 0.5, 'randomize');  % division of 50-50



%{
cellphone = find(trainingSet.Labels == 'cellphone', 1);
hedgehog = find(trainingSet.Labels == 'hedgehog', 1);
tick = find(trainingSet.Labels == 'tick', 1);
wrench = find(trainingSet.Labels == 'wrench', 1);
accordion = find(trainingSet.Labels == 'accordion', 1);
airplanes = find(trainingSet.Labels == 'airplanes', 1);
anchor = find(trainingSet.Labels == 'anchor', 1);
ant = find(trainingSet.Labels == 'ant', 1);
barrel = find(trainingSet.Labels == 'barrel', 1);
beaver = find(trainingSet.Labels == 'beaver', 1);
binocular = find(trainingSet.Labels == 'binocular', 1);
brain = find(trainingSet.Labels == 'brain', 1);
brontosaurus = find(trainingSet.Labels == 'brontosaurus', 1);
buddha = find(trainingSet.Labels == 'buddha', 1);
butterfly = find(trainingSet.Labels == 'butterfly', 1);
camera = find(trainingSet.Labels == 'camera', 1);
bass = find(trainingSet.Labels == 'bass', 1);
cannon = find(trainingSet.Labels == 'cannon', 1);
car_side = find(trainingSet.Labels == 'car_side', 1);
ceiling_fan = find(trainingSet.Labels == 'ceiling_fan', 1);
chair = find(trainingSet.Labels == 'chair', 1);
chandelier = find(trainingSet.Labels == 'chandelier', 1);
crab = find(trainingSet.Labels == 'crab', 1);
crayfish = find(trainingSet.Labels == 'crayfish', 1);
crocodile = find(trainingSet.Labels == 'crocodile', 1);
cup = find(trainingSet.Labels == 'cup', 1);
dollar_bill = find(trainingSet.Labels == 'dollar_bill', 1);
elephant = find(trainingSet.Labels == 'elephant', 1);

%}




% figure

%{
subplot(3,3,1);
imshow(readimage(trainingSet,cellphone))
subplot(3,3,2);
imshow(readimage(trainingSet,hedgehog))
subplot(3,3,3);
imshow(readimage(trainingSet,tick))
subplot(3,3,4);
imshow(readimage(trainingSet,wrench))
subplot(3,3,5);
imshow(readimage(trainingSet,accordion))
subplot(3,3,6);
imshow(readimage(trainingSet,airplanes))
subplot(3,3,7);
imshow(readimage(trainingSet,anchor))
subplot(3,3,8);
imshow(readimage(trainingSet,ant))
subplot(3,3,9);
imshow(readimage(trainingSet,barrel))

%}


bag = bagOfFeatures (trainingSet);

img = readimage(imds, 1);
featureVector = encode(bag, img);


figure
bar(featureVector)
title('visual featured occurrences')
xlabel('visual feature index')
ylabel('frequency of occurrence')


%%%%SVM Training

categoryClassifier = trainImageCategoryClassifier(trainingSet, bag);



%%%testing 1 

figure;
img = imread(fullfile(rootFolder, 'airplanes_side', '1066.png'));
[labelIdx, scores] = predict(categoryClassifier, img);

fprintf('\n \n \n \n \n')



% Display 1
answer=categoryClassifier.Labels(labelIdx);

fprintf('\nthe input image is airplanes and the output: %s \n',answer{1})


subplot(5,2,1);
imshow(img);
text(700,40,10,answer{1})


%%testing 2
img = imread(fullfile(rootFolder, 'cars', 'image_1153.png'));
[labelIdx, scores] = predict(categoryClassifier, img);

% Display 2 
answer=categoryClassifier.Labels(labelIdx);

fprintf('\nThe input image is cars and the output image is: %s \n',answer{1})
subplot(5,2,3);
imshow(img);
text(1050,50,10,answer{1})



%%testing 3
img = imread(fullfile(rootFolder, 'faces', 'image_0435.png'));
[labelIdx, scores] = predict(categoryClassifier, img);

% Display 3 
answer=categoryClassifier.Labels(labelIdx);

fprintf('\nThe input image is faces and the output image is: %s \n',answer{1})

subplot(5,2,5);
imshow(img);
text(700,60,10,answer{1})


%%testing 4
img = imread(fullfile(rootFolder, 'motorbikes_side', '0803.png'));
[labelIdx, scores] = predict(categoryClassifier, img);


% Display 4
answer=categoryClassifier.Labels(labelIdx);

fprintf('\nThe inout image is motorbike and the output image is: %s \n',answer{1})

subplot(5,2,7);
imshow(img);
text(1050,70,10,answer{1})
fprintf('\n \n \n \n \n')



%%%evaluation

%training set
confMatrix = evaluate(categoryClassifier, trainingSet);

%validation set
confMatrix = evaluate(categoryClassifier, validationSet);
mean(diag(confMatrix));






