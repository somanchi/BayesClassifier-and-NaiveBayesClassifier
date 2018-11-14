function [nPrior,nMean,nVariance] = getNaiveBayesClassifier (TrainData, TrainLabel)
  
  class1Data = TrainData(TrainLabel==0,:);
  class2Data = TrainData(TrainLabel==1,:);
  
  nMean(1,:) = mean(class1Data);
  nMean(2,:) = mean(class2Data);
  
  [tot,col] = size(TrainData);
  [row,col] = size(class1Data);
  
  nPrior(1) = row/tot;
  
  for i = 1:col
    nVariance(1,i) = (std(class1Data(:,i))*std(class1Data(:,i)))/(row-1);
  endfor  
  [row,col] = size(class2Data);
  
  nPrior(2) = row/tot;
  for i = 1:col
    nVariance(2,i) = (std(class2Data(:,i))*std(class2Data(:,i)))/(row-1);
  endfor
    
endfunction