**Brief Description of the project**

Manual annotation has been in the works for quite a time as of now but with modern advancements in AI has led to opening of new avenues that can utilise AI and reduce or eliminate manual image annotation. The automatic image annotation approach suggested here uses Speeded Up Robust Features (SURF) features to detect and extract points of interest through the imagein the database. From multiple feature detectors, SURF was chosen as it is the most reliable and computationally fastest algorithm in the given situations related to this project. After the detection and extraction is done, K- Means clustering algorithm is used to cluster the features so as to help the Support Vector Machine (SVM) differentiate between various categories of images used as an input. Furthermore, the database consists of 4000+ images. The database is divided into two parts. The first half is used as the training set and the second set is used as the validation set. Through thorough testing of both the testing and the validation set, accuracy, precision, recall and Fmeasure of the approach is calculated.

**Requirements**
1. Matlab 2017a

**Instructions to execute this project**
1. Pull this repository
2. Open "directory2.m" Copy the image database onto the home directory and insert the downloaded folder path into the “directory” variable in the program.
3. Run using Matlab.
