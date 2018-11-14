function [Percentage] =  Finaloutput(TestLable,Result)
  sum=0;
  R = Result';
   [row,col] = size(TestLable);
   for i = 1:row
      if(TestLable(i,1) == R(i,1))
         sum = sum+1;
      endif
   endfor
   res = sum/row*100;
   Percentage = res;
endfunction