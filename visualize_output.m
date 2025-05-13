load('quantizedPoses.mat');
for i = 1:size(quantizedPoses, 1)
    imgVec = quantizedPoses(i, :);
    img = reshape(imgVec, [384, 384, 3]);
    imshow(img);
    pause(0.1); % simulate animation
end
