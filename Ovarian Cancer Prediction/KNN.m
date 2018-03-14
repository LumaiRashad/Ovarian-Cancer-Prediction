load ovariancancer
Label_Vector = grp;
%IMPORT FEACTURE EXTRACTED FROM PCA
Feature_Matrix = dlmread('PCA_Data.txt');
%Get # of Training data from user 
N_of_Training = 'Enter Number of Training Samples :';
Training_Samples = input(N_of_Training);
if Training_Samples < 2 && Training_Samples > 95
    disp('# of Training Samples Should be <= 95 !!')
    N_of_Training = 'Enter Number of Training Samples :';
    Training_Samples = input(N_of_Training);
end
%Assign Values of Test set to Test_Set Matrix
Testing_Set = Feature_Matrix(Training_Samples + 1: 121, :);
Testing_Set = [Testing_Set;Feature_Matrix(122 + Training_Samples: 216, :)];
[Test_Number , N_of_Features_Test] = size(Testing_Set);
%GET TESTSET ACTUAL LABELS
Actual_Labels = grp(Training_Samples + 1: 121, :);
Actual_Labels = [Actual_Labels ; grp(122 + Training_Samples: 216, :)];
%Assign Values of Training Set to Training Set Matrix
Training_Set_Cancer = Feature_Matrix(1: Training_Samples, :);
Training_Set_Normal = Feature_Matrix(122: Training_Samples+121, :);
for i = 1 : Test_Number
    for k = 1 : Training_Samples
       Distance_Ca(i,k) = Dist(Training_Set_Cancer(k),Testing_Set(i));
       Distance_No(i,k) = Dist(Training_Set_Normal(k),Testing_Set(i));
    end 
end
%Sort Matrices to start classification 
%Distance_Ca_Sorted = sort(Distance_Ca(:));
%Distance_No_Sorted = sort(Distance_No(:));
%Predicted_Labels = zeros(Test_Number,1);