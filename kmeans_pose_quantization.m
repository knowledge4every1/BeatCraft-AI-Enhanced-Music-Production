load('poseData.mat');
numClusters = 35;

% Flatten each image (384x384x3 → vector)
[nx, ny, nc, nSamples] = size(poseData);
features = reshape(poseData, [], nSamples)';
[idx, centroids] = kmeans(features, numClusters);

% Save quantized states
quantizedPoses = centroids(idx, :);
save('quantizedPoses.mat', 'quantizedPoses', 'idx', 'centroids');
