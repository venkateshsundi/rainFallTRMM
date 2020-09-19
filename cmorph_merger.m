clc
close all
clear all

info = ncinfo('C:\Users\venkatesh\Desktop\CMORPH\2012\CMORPH_V1.0_ADJ_0.25deg-DLY_00Z_20120102.nc');
lat = ncread('C:\Users\venkatesh\Desktop\CMORPH\2012\CMORPH_V1.0_ADJ_0.25deg-DLY_00Z_20120102.nc','lat');
lon = ncread('C:\Users\venkatesh\Desktop\CMORPH\2012\CMORPH_V1.0_ADJ_0.25deg-DLY_00Z_20120102.nc','lon');
% ore = ncread('C:\Users\venkatesh\Desktop\CMORPH\2010\CMORPH_V1.0_ADJ_0.25deg-DLY_00Z_20100102.nc','cmorph');
p = 1;
for m=1:12
        if m == 1 | m == 3 | m == 5 | m == 7 | m == 8 | m == 10 | m == 12
            mon = num2str(m.','%02d')
            for d = 1:1:31
                da = num2str(d.','%02d');
               a=strcat('C:\Users\venkatesh\Desktop\CMORPH\2012\CMORPH_V1.0_ADJ_0.25deg-DLY_00Z_2012',mon,da,'.nc');   
               data(:,:,p) = ncread(a,'cmorph');
               p = p+1;
            end
        elseif m == 4 | m== 6 | m == 9 | m == 11
            mon = num2str(m.','%02d')
            for d = 1:1:30
                da = num2str(d.','%02d');
                a=strcat('C:\Users\venkatesh\Desktop\CMORPH\2012\CMORPH_V1.0_ADJ_0.25deg-DLY_00Z_2012',mon,da,'.nc');
                data(:,:,p) = ncread(a,'cmorph');
                p= p+1;
            end
        else
            mon = num2str(m.','%02d')
            for d = 1:1:29
                da =num2str(d.','%02d');
                a=strcat('C:\Users\venkatesh\Desktop\CMORPH\2012\CMORPH_V1.0_ADJ_0.25deg-DLY_00Z_2012',mon,da,'.nc');
                data(:,:,p) = ncread(a,'cmorph');
                p= p+1;
            
            end
        end
end

CMORPH2010 = data(265:401,80:208,:);
long = lon(265:401,1);
lati = lon(80:208,1);














