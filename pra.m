clc
close all
clear all
gauge(:,:,1) = [1,2;3,4];
gauge(:,:,2) = [2,2;3,4];
gauge(:,:,3) = [3,2;3,4];


product(:,:,1) = [1,1;10,1];
product(:,:,2) = [2,2;20,2];
product(:,:,3) = [3,3;30,3];

[m,n,o] = size(gauge);
for d=1:o
    p = reshape(product(:,:,d),[1,m*n]);
    g = reshape(gauge(:,:,d),[1,m*n]);
    bias(d) = sum(p-g)/150;
    RMSE(d) = sum((p-g).^2)/150;  
    avg_p(d) = sum(p)/(m*n);
    avg_g(d) = sum(g)/(m*n);    
%     [a,b] = size(g);
%     for i=1:a
%         for j=1:b
%             
%         end
%     end
end
for j=1:o
    p = reshape(product(:,:,j),[1,m*n]);
    g = reshape(gauge(:,:,j),[1,m*n]);
    n1 = p-avg_p(j);
    n2 = g-avg_g(j);
    num = n1.*n2;
    nu =sum(num);
    d1 = sqrt(sum(n1.^2));
    d2 = sqrt(sum(n2.^2));
    den =d1*d2;
    CC(j) = nu/den;


end
avg_RMSE = sum(RMSE)/o;
avg_CC   = sum(CC)/o;
avg_bias = sum(bias)/o;