imageFolder = 'images/'; % Folder containing all pose images
imageFiles = dir(fullfile(imageFolder, '*.jpg')); % or *.png
numImages = length(imageFiles);
inputSize = [384, 384];

poseData = [];

for i = 1:numImages
    img = imread(fullfile(imageFolder, imageFiles(i).name));
    img = imresize(img, inputSize);
    img = double(img) / 255;  % Normalize
    poseData(:, :, :, i) = img;  % Store in 4D array
end

save('poseData.mat', 'poseData');
