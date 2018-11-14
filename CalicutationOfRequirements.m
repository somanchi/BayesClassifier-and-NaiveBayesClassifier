function [Cov, Mean,Prior] = CalicutationOfRequirements(TrainData,TrainLabel,featset)
    
    # Creating the row and cloums of the feature set
    [row,col] = size(featset);
    
    for i = 1:col   # Creating a new FeatureSet which contains the values of the graphs with gaussian distribution
    FeatureSet(:,i) = TrainData(:,featset(i));
    endfor;
    
    
    class1Samp = FeatureSet(TrainLabel==0,:);   # Class of samples with TrainData = 0
    class2Samp = FeatureSet(TrainLabel==1,:);   # Class of samples with TrainData = 1
    #display(size(class1Samp));
    #display(size(class2Samp));

    
    [numSamp1,col1] = size(class1Samp);     # Size of Class1Samples   
    [numSamp2,col2] = size(class2Samp);     # size of Class2Samples
    [total,coloum] = size(TrainData);

    # Prior Calicutation 
    prior1 = numSamp1/total;
    prior2 = numSamp2/total;
    
    # Mean Calicutation
    mean1 = mean(class1Samp);
    mean2 = mean(class2Samp);

    
    cov1 = zeros(7,7);        # intialization of Covariance 1 Matrix
    for i=1:numSamp1
      meansub = class1Samp(i,:) - mean1;
      cov1 = cov1 + (meansub')*meansub;
    endfor
    cov1 = cov1/(numSamp1 - 1);         # Covariance matrix with max values
    
    cov2 = zeros(7,7);  # Calicutation of Covariance2 Matrix  
    for i=1:numSamp2
    meansub =  class2Samp(i,:) - mean2;
    cov2 = cov2 + (meansub')*meansub;
    endfor
    cov2 = cov2/(numSamp2 - 1);
    
    #display(cov1);      #Display
    #display(cov2);
    #display(mean1);
    #display(mean2);
    #display(prior1);
    #display(prior2);
    
    # return of values to the main Function
    
    Cov(:, :, 1) = cov1;
    Cov(:, :, 2) = cov2;
    Mean(:, 1) = mean1;
    Mean(:, 2) = mean2;
    Prior(1) = prior1;
    Prior(2) =  prior2;
    
end