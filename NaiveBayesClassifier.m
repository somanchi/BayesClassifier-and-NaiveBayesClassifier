function [nResult] = NaiveBayesClassifier(Data, Label, prior, Mean, Variance)
  [row,col] = size(Data);
  [numclass,featsize] = size(Mean);
  for i = 1:row              # Caliculating Posterior for each row
    for j = 1:col             # for each coloum
      for k = 1:numclass      # for each class 
        meansub = Data(i,j) - Mean(k,j);  
        liklihood(k,j) = (1/sqrt(2*pi*Variance(k,j))*exp(-(1/2)*meansub*meansub/Variance(k,j)));
        posterior(k,j) = prior(k)*liklihood(k,j);
      endfor
      #posterior(:,j) = posterior(:,j)/sum(posterior(:,j));
    endfor
    for k = 1:numclass
      Pro(k,1) = sum(log(posterior(k,:)));    # as values are less we use log values
    endfor
    [~,pos] = max(Pro);       # position of the max prob values
    nResult(i) = pos-1;  
  endfor
endfunction 