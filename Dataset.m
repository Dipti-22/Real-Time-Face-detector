clc
clear all
close all
warning off;                      % this in order to remove the warning everytime
cam = webcam;                     % initialising the camera to take snapshots
faceDetector = vision.CascadeObjectDetector; % To detect the face i used cascadeobjectdetector
c = 150;                          % setting the limit of taking the snapshot here 150 snapshots will be taken
temp = 0;                         % creating a empty variable
while true
    e = cam.snapshot;              % this is to take the snapshots
    bboxes = step(faceDetector,e); % detecting the face and storing the value in bboxes variable
    if(sum(sum(bboxes))~=0)        % if the face is detected or not
    if(temp>=c)                    % setting the snapshot limit to 150 and cheking the value in temp variable 
        break;                     % if the temp variable will have value greater than c the loop breaks and taking the snapshots process ends
    else
    es = imcrop(e,bboxes(1,:));    % croping the image form the snapshot 
    es = imresize(es,[227 227]);   % resizing the image captured
    filename = strcat(num2str(temp),'.bmp');  % storing images captured in a file
    imwrite(es,filename);                     % writting the image name in the file
    temp=temp+1;                              % adding 1 to temp variable after each itteration
    imshow(es);                               % to show the image of the face from the snapshot
    drawnow;                                  % updates the image after every itteration
    end
    else
        imshow(e);
        drawnow;
    end
end