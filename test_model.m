clc
close all
clear all
c = webcam;                                  % starting web cam
load myNet1;                                 % loading the trained network to testing code
faceDetector = vision.CascadeObjectDetector; % To detect the face when the camera starts
while true
    e= c.snapshot;                           % Taking the snap shot and storing 
    bboxes = step(faceDetector,e);           % detecting the face in the box
    if(sum(sum(bboxes))~=0)                  % checking whether the face is detected or not in the bboxes variable
     es = imcrop(e,bboxes(1,:));             % croping the face if the face is detected in the box
    es = imresize(es,[227 227]);             % Resizing the image to 227 , 227 
    label = classify(myNet1,es);
    image(e);                                % displays the image from array
    title(char(label));                      % this will give the title of the picture detected
    drawnow;
    else
        image(e);                            % to display the image
        title('No Face Detected');           % if no face detected then this will get printed
    end
end
