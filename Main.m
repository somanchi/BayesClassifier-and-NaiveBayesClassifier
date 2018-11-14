function Main()
  [TrainLabel, TrainData, TestData, TestLable, ValidLable, ValidData] = loadData();                        # Loading the Data sets
  #TrainingBayes(TrainData);                                                        # Ploting of Graph for TrainData
  featset = [7,40,22,21,34,38,1];                                                          # Caliculation of Feature Set which are more likely as Gaussian Distribution
  [Cov, Mean ,Prior] = CalicutationOfRequirements(TrainData,TrainLabel,featset);    # Calicutation Of Requirements (Mean,Prior,Cov)
  
  [Result] = TestBayes(ValidData, Prior,Mean,Cov,featset);    # Testing of Bayes Therom by using TestData.
  [percentage] = Finaloutput(ValidLable,Result);
  display("-----------------------******!!!SOLUTION STARTS!!!**************------------------------------------------------------");
  display("*****FOR VALIDATE DATA *** by Bayes therom");
  display(percentage);
  [Accuracy,Precision,Recall,Specificity,Fscore,MCC,ConfusionMatrix] = Accuracy_Prediction(Result,ValidLable); #Caliculation of Accuracy and other
  display(Accuracy);
  display(Precision);
  display(Precision);
  display(Recall);    
  display(Specificity);
  display(Fscore);
  display(MCC);
  display(ConfusionMatrix);
  
  
  
  display("-------------------------------!!!!!!!!!!!!!!!-----------------------------------------------------------");
  display("FOR TEST DATA ------!!------ By the Bayes therom");
  [Result] = TestBayes(TestData, Prior,Mean,Cov,featset);    # Testing of Bayes Therom by using TestData.
  [percentage] = Finaloutput(TestLable,Result);
  display(percentage);
  [Accuracy,Precision,Recall,Specificity,Fscore,MCC,ConfusionMatrix] = Accuracy_Prediction(Result,TestLable);
  display(Accuracy);
  display(Precision);
  display(Precision);
  display(Recall);
  display(Specificity);
  display(Fscore);
  display(MCC);
  display(ConfusionMatrix);

  display("---------------------------------!!!!!!!!!!!!----------------------------------------------------------------------");
  display("----------****!!!Using naive Bayes approach!!!****------------");
  [nPrior,nMean,nVariance] = getNaiveBayesClassifier (TrainData, TrainLabel);
  [nResult] = NaiveBayesClassifier(TestData, TestLable, nPrior, nMean, nVariance);
  [percentage] = Finaloutput(TestLable,nResult);
  display(percentage);
  [Accuracy,Precision,Recall,Specificity,Fscore,MCC,ConfusionMatrix] = Accuracy_Prediction(nResult,TestLable);
  display(Accuracy);
  display(Precision);
  display(Precision);
  display(Recall);
  display(Specificity);
  display(Fscore);
  display(MCC);
  display(ConfusionMatrix);
  display("------------------------------------------------------------------------------------------------------------------");
  display("**********************!!!End Of Solution!!!******************************");

  endfunction
  
  