function loss = beat_aligned_loss(predicted, groundTruth, musicBeats)
    pose_loss = mean((predicted - groundTruth).^2);
    motion_loss = mean(abs(diff(predicted, 1, 1)));
    sync_loss = mean(abs(predicted(musicBeats) - groundTruth(musicBeats)));
    L1 = 0.4; L2 = 0.3; L3 = 0.3;
    loss = L1 * pose_loss + L2 * motion_loss + L3 * sync_loss;
end
