
#Loading of Data sets

function [TrainLabel, TrainData, TestData, TestLable, ValidLable, ValidData] = loadData()
    Data = load('SPECTF.train');
    TrainLabel = Data(:, 1);
    TrainData = Data(:, 2:end);
    Data = load('SPECTF.test');
    TestLable = Data(:,1);
    TestData = Data(:, 2:end);
    Data = load('SPECTS.valid');
    ValidLable = Data(:,1);
    ValidData = Data(:, 2:end);
    #display(size(TestData));
    #display(size(TestLable));
    


  end
 
  