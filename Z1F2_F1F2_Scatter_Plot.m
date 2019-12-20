load('data.mat');
% taking the first 100 observations for training
Train_F1 = F1(1:100,:);
sd1=std(Train_F1(:,1)); % 2.07
sd2=std(Train_F1(:,2)); %2.30
sd3=std(Train_F1(:,3)); %2.26
sd4=std(Train_F1(:,4)); %1.94
sd5=std(Train_F1(:,5)); %2.01
mean1=mean(Train_F1(:,1)); %7.09
mean2=mean(Train_F1(:,2)); %9.14
mean3=mean(Train_F1(:,3)); %4,28
mean4=mean(Train_F1(:,4));% 13.33
mean5=mean(Train_F1(:,5)); %11.24


F2_1=[F2(:,1)];
F2_2=[F2(:,2)];
F2_3=[F2(:,3)];
F2_4=[F2(:,4)];
F2_5=[F2(:,5)];

F1_1=[F1(:,1)];
F1_2=[F1(:,2)];
F1_3=[F1(:,3)];
F1_4=[F1(:,4)];
F1_5=[F1(:,5)];

F1_master=[F1_1;F1_2;F1_3;F1_4;F1_5];
F2_master=[F2_1;F2_2;F2_3;F2_4;F2_5];

Z1_1=[(F1(:,1)-mean1)/sd1];
Z1_2=[(F1(:,2)-mean2)/sd2];
Z1_3=[(F1(:,3)-mean3)/sd3];
Z1_4=[(F1(:,4)-mean4)/sd4];
Z1_5=[(F1(:,5)-mean5)/sd5];

Z1_master=[Z1_1;Z1_2;Z1_3;Z1_4;Z1_5];

% Plot of F2 and Z1
plot_master=[Z1_master F2_master];

scatter(plot_master(1:1000,1),plot_master(1:1000,2),10,'r')
hold on
scatter(plot_master(1001:2000,1),plot_master(1001:2000,2),10,'k')
hold on
scatter(plot_master(2001:3000,1),plot_master(2001:3000,2),10,'g')
hold on
scatter(plot_master(3001:4000,1),plot_master(3001:4000,2),10,'b')
hold on
scatter(plot_master(4001:5000,1),plot_master(4001:5000,2),10,'m')
legend('C1', 'C2', 'C3','C4','C5')
xlabel('1st Feature(Z1)')
ylabel('2nd Feature(F2)')

% Plot of F1 and F2
plot_master=[F1_master F2_master];

scatter(plot_master(1:1000,1),plot_master(1:1000,2),10,'r')
hold on
scatter(plot_master(1001:2000,1),plot_master(1001:2000,2),10,'k')
hold on
scatter(plot_master(2001:3000,1),plot_master(2001:3000,2),10,'g')
hold on
scatter(plot_master(3001:4000,1),plot_master(3001:4000,2),10,'b')
hold on
scatter(plot_master(4001:5000,1),plot_master(4001:5000,2),10,'m')
legend('C1', 'C2', 'C3','C4','C5')
xlabel('1st Feature(F1)')
ylabel('2nd Feature(F2)')

