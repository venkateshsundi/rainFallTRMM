function [ avg_bias, avg_RMSE, avg_CC ] = metrics( satellite,gauge )

   
[m,n,pa] = size(satellite);
    for d=1:pa
        p = reshape(satellite(:,:,d),[1,m*n]);
        g = reshape(gauge(:,:,d),[1,m*n]);
        bias(d) = sum(p-g)/(m*n);
        RMSE(d) = sqrt(sum((p-g).^2)/(m*n));  
        avg_p(d) = sum(p)/(m*n);
        avg_g(d) = sum(g)/(m*n);    
    end
    for j=1:pa
        p = reshape(satellite(:,:,j),[1,m*n]);
        g = reshape(gauge(:,:,j),[1,m*n]);
        p = sum(p);
        g = sum(g);
        sp = sum(p.^2);
        sg = sum(g.^2);
        spg = sum(p.*g);
        if (((81*sp-p^2)*(81*sg-g^2)) == 0)
            CC(j) = 0;
        else
            CC(j) = (81*spg-p*g)/sqrt((81*sp-p^2)*(81*sg-g^2));
        end
    end
    
    avg_RMSE = sum(RMSE)/pa;
    avg_CC   = sum(CC)/pa;   
    avg_bias = sum(bias)/pa;
end

