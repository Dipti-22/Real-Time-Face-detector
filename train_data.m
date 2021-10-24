clc
clear all
close all
warning off
g = alexnet;            % calling a pre-trained network which is capable of 1000 images but i only used two images
layers = g.Layers;      % extracting the layers
layers(23) = fullyConnectedLayer(2);   % here since i have taken two classes therefore i have taken 2 in fullyconnectedlayer
layers(25)=classificationLayer;        % And i am keeping 25th layer as classification layer to differenciate between two photos
allImages = imageDatastore('datasets','IncludeSubfolders',true, 'LabelSource','foldernames'); % image data storage
opts = trainingOptions('sgdm','InitialLearnRate',0.001,'MaxEpochs',20,'MiniBatchSize',64); % training the machine with leaning rate 0.001. minimum 
myNet1 = trainNetwork(allImages,layers,opts);    % training the network with all the images and layers and training options
save myNet1;            % saving the network so that we dont need to train again and again

