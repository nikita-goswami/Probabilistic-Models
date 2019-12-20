load('data.mat');
Train_F1 = F1(1:100,:);
Test_F1 = F1(101:1000,:);

meanF1C1 = mean(Train_F1(:,1));
meanF1C2 = mean(Train_F1(:,2));
meanF1C3 = mean(Train_F1(:,3));
meanF1C4 = mean(Train_F1(:,4));
meanF1C5 = mean(Train_F1(:,5));

stdF1C1 = std(Train_F1(:,1));
stdF1C2 = std(Train_F1(:,2));
stdF1C3 = std(Train_F1(:,3));
stdF1C4 = std(Train_F1(:,4));
stdF1C5 = std(Train_F1(:,5));


C1_F1=normpdf(Test_F1,meanF1C1,stdF1C1);
C2_F1=normpdf(Test_F1,meanF1C2,stdF1C2);
C3_F1=normpdf(Test_F1,meanF1C3,stdF1C3);
C4_F1=normpdf(Test_F1,meanF1C4,stdF1C4);
C5_F1=normpdf(Test_F1,meanF1C5,stdF1C5);

max_z = zeros(0,0);

for i=1:900
    for j=1:5
        max_z(i,j) = max([C1_F1(i,j),C2_F1(i,j),C3_F1(i,j),C4_F1(i,j),C5_F1(i,j)]);
    end
end

pred = zeros(0,0);

for m=1:900
    for n=1:5
        if(max_z(m,n)==C1_F1(m,n))
            pred(m,n)=1;
        elseif(max_z(m,n)==C2_F1(m,n))
            pred(m,n)=2;
        elseif(max_z(m,n)==C3_F1(m,n))
            pred(m,n)=3;
        elseif(max_z(m,n)==C4_F1(m,n))
            pred(m,n)=4;
        else(max_z(m,n)==C5_F1(m,n))
            pred(m,n)=5;
       end
    end
end
   

accuracy = (sum(pred(:,1)==1)+ sum(pred(:,2)==2)+ sum(pred(:,3)==3)+ sum(pred(:,4)==4)+ sum(pred(:,5)==5))/4500;


%% Accuracy : 53%