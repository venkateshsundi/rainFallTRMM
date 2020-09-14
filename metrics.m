function [ Bias, RMSE, CC ] = metrics( product,gauge )
[m,n,p] = size(gauge);
for d=150:300
    d(1,d) = reshape(,[1,m*n])
    d(1,d) = reshape(,[1,m*n])
    for i=1:m
        for j=1:n
            
        end
    end
end
avg_p = sum(product)/n;
avg_g = sum(gauge)/n;
Bias = sum(product-gauge)/n;
RMSE = sqrt(sum((product-gauge).^2)/n);
CC   =sum((product-avg_p).*(gauge-avg_p))/sqrt((sum((product-avg_p).^2))*(sqrt(sum(((gauge-avg_g).^2)))));
end

