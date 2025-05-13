function encoded = add_positional_encoding(patches)
    f = 0.1;
    [numPatches, patchSize] = size(patches);
    pos = (0:numPatches-1)';
    encoded = patches + sin(2*pi*f*pos) + cos(2*pi*f*pos);
end


function se_output = squeeze_excitation(featureMap)
    gp = mean(featureMap, 2); % global pooling
    W1 = randn(size(gp, 2), 64);
    W2 = randn(64, size(gp, 2));
    excitation = sigmoid(gp * W1) * W2;
    se_output = featureMap .* excitation;
end