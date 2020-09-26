function [POD,FAR,CSI,POND] = contingency_table( satellite, gauge )

[m,n,p] = size(satellite);
hits = 0;
false_alarm = 0;
misses = 0;
correct_neg = 0;

for d=1:p
    for i=1:m
        for j=1:n
            if ((satellite(i,j,d)>0) && (gauge(i,j,d)>0))
                hits = hits +1;    
            elseif((satellite(i,j,d)>0) && (gauge(i,j,d) ==0))
                false_alarm=false_alarm+1;
            elseif((satellite(i,j,d) ==0) && (gauge(i,j,d)>0))
                misses=misses+1;
            elseif((satellite(i,j,d) ==0) && (gauge(i,j,d) == 0))
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

