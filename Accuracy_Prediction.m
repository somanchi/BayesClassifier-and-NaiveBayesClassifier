function [Accuracy,Precision,Recall,Specificity,Fscore,MCC,ConfusionMatrix] = Accuracy_Prediction(Result,TestLable)
    TP = 0;
    TN = 0;
    FP = 0;
    FN = 0;
    R = Result';
    [row,col] = size(R);
    for i=1:row 
       if(R(i,1) == 1)
        if(TestLable(i,1) == 1)
          TP = TP + 1;
        else 
          FN = FN + 1;
        endif
       else 
           if(TestLable(i,1) == 1)
              FP = FP+1;
            else 
              TN = TN + 1;
            endif
       endif     
    endfor 
    ConfusionMatrix = [TP,TN,FP,FN];
    Accuracy = (TP+TN)/row*100;
    Precision = TP/(TP+FP);
    Recall = TP/(TP+FN);
    Specificity = TN/(TN+FP);
    Fscore = 2*Precision*Recall/(Precision+Recall);
    MCC = (TP*TN - FP*FN)/sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN));
    return
 endfunction


