
# Plot of Graph Using the Training Data by passing TrainData as an argument

function TrainingBayes(Data)
    
    [numPatients, numFeat] = size(Data);
    for i = 1:numFeat
        subplot(6, 10, i); hist(Data(:, i));
    end