function [POD,FAR,CSI,POND] = contingency_table( product, observed )

[m,n,p] = size(product);
hits = 0;
false_alarm = 0;
misses = 0;
correct_neg = 0;
for d=150:300
    for i=1:m
        for j=1:n
            if ((product(i,j,d)>0) && (observed(i,j,d)>0))
                hits = hits +1;    
            elseif((product(i,j,d)>0) && (observed(i,j,d) ==0))
                false_alarm=false_alarm+1;
            elseif((product(i,j,d) ==0) && (observed(i,j,d)>0))
                misses=misses+1;
            elseif((product(i,j,d) ==0) && (observed(i,j,d) == 0))
                correct_neg=correct_neg+1;
            end
        end
    end
end
POD = hits/(hits+misses);%probabiliy of detection
FAR = false_alarm/(hits+false_alarm);%false alarm ratio
CSI  = hits/(hits+false_alarm+misses);%threat score
POND=correct_neg/(correct_neg+false_alarm);
            

end

