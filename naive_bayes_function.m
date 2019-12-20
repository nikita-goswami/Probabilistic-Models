% Bayes Theorm Approach

function [accuracy] = bayes_classifier(Train, Test)

freq = zeros(20,20);


val = unique(Train(:,1));
cnt = histc(Train(:,1),val);
values_C1 = [val cnt];
val = unique(Train(:,2));
cnt = histc(Train(:,2),val);
values_C2 = [val cnt];
val = unique(Train(:,3));
cnt = histc(Train(:,3),val);
values_C3 = [val cnt];
val = unique(Train(:,4));
cnt = histc(Train(:,4),val);
values_C4 = [val cnt];
val = unique(Train(:,5));
cnt = histc(Train(:,5),val);
values_C5 = [val cnt];



C1_prob = zeros(900,5);
C2_prob = zeros(900,5);
C3_prob = zeros(900,5);
C4_prob = zeros(900,5);
C5_prob = zeros(900,5);

for i=1:900
    for j=1:5
        for k=1:length(values_C1)
            if(values_C1(k,1)==Test(i,j))
                C1_prob(i,j) = values_C1(k,2);
            end
        end
        for k=1:length(values_C2)
            if(values_C2(k,1)==Test(i,j))
                C2_prob(i,j) = values_C2(k,2);
            end
        end
        for k=1:length(values_C3)
            if(values_C3(k,1)==Test(i,j))
                C3_prob(i,j) = values_C3(k,2);
            end
        end
        for k=1:length(values_C4)
            if(values_C4(k,1)==Test(i,j))
                C4_prob(i,j) = values_C4(k,2);
            end
        end
        for k=1:length(values_C5)
            if(values_C5(k,1)==Test(i,j))
                C5_prob(i,j) = values_C5(k,2);
            end
        end
    end
end

max_prob = zeros(0,0);

for i=1:900
    for j=1:5
         max_prob(i,j) = max([C1_prob(i,j),C2_prob(i,j),C3_prob(i,j),C4_prob(i,j),C5_prob(i,j)]);
    end
end


pred = zeros(0,0);

for m=1:900
    for n=1:5
        if(max_prob(m,n)==C1_prob(m,n))
            pred(m,n)=1;
        elseif(max_prob(m,n)==C2_prob(m,n))
            pred(m,n)=2;
        elseif(max_prob(m,n)==C3_prob(m,n))
            pred(m,n)=3;
        elseif(max_prob(m,n)==C4_prob(m,n))
            pred(m,n)=4;
        else(max_prob(m,n)==C5_prob(m,n))
            pred(m,n)=5;
       end
    end
end
   

accuracy = (sum(pred(:,1)==1)+ sum(pred(:,2)==2)+ sum(pred(:,3)==3)+ sum(pred(:,4)==4)+ sum(pred(:,5)==5))/4500;

end
%Accuracy = 52.20