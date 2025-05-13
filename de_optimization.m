% Assume objFun wraps SE-ViT model + loss
F_type = 'logsig'; % or 'rand' or 0.5
CR = 0.9;
maxIter = 2000;
popSize = 100;
D = size(quantizedPoses, 2); % Dimensionality

% Random init
pop = rand(popSize, D);
fitness = arrayfun(@(i) objFun(pop(i, :)), 1:popSize);

for gen = 1:maxIter
    for i = 1:popSize
        idx = randperm(popSize, 3);
        while any(idx == i), idx = randperm(popSize, 3); end
        x1 = pop(idx(1), :);
        x2 = pop(idx(2), :);
        x3 = pop(idx(3), :);

        switch F_type
            case 'rand', F = rand();
            case 'logsig', F = logsig(x2 - x3);
            otherwise, F = 0.5;
        end

        V = x1 + F .* (x2 - x3);
        jrand = randi(D);
        U = arrayfun(@(j) V(j) if rand <= CR || j == jrand else pop(i, j), 1:D);

        if objFun(U) < fitness(i)
            pop(i, :) = U;
            fitness(i) = objFun(U);
        end
    end
end

[~, bestIdx] = min(fitness);
bestSolution = pop(bestIdx, :);
