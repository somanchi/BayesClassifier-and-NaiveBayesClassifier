function [Result] = TestBayes(Data, prior,Mean,Covariance,featset)
   [row,col] = size(Data);
   [numclass,featsize] = size(Mean');
  for i=1:featsize
     FeatureSet(:,i) = Data(:,featset(i));
  endfor
  
  for i=1:row
      instance = FeatureSet(i,:);       # instance is one patient for every patient we are caliculating likelyhood
      for j=1:numclass
        meansub = instance-(Mean(:,j)');
        # display(size(meansub));
        likelihood(j) = (1/((2*pi) ^ (featsize/2) * sqrt(det(Covariance(:,:,j))))) * exp(-(1/2) * meansub * inv(Covariance(:,:,j)) * meansub');
        posterior(j) = prior(j) * likelihood(j);
      endfor
      posterior = posterior/sum(posterior);
      [~,pos] = max(posterior);
      Result(i) = pos-1;
    endfor 
  return
endfunction