% Script to Run Bayes Classifier
load('data.mat');
Train_F1 = F1(1:100,:);
Test_F1 = F1(101:1000,:);

Train = round(Train_F1);
Test = round(Test_F1);

acc_F1 = bayes_classifier(Train, Test);
acc_F1 %52.20 percent accuracy

Train_F2 = F2(1:100,:);
Test_F2 = F2(101:1000,:);

Train = round(Train_F2);
Test = round(Test_F2);

acc_F2 = bayes_classifier(Train, Test);
acc_F2 %53.42 percent accuracy


