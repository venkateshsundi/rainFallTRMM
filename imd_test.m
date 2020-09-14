clc
clear all
close all
IMD_data = ncinfo('rf_imd_25km_1901-2019.nc');
imd_lon1=ncread('rf_imd_25km_1901-2019.nc','lon');
imd_lat1=ncread('rf_imd_25km_1901-2019.nc','lat');
imd_precip=ncread('rf_imd_25km_1901-2019.nc','rf',[1,1,39811],[135,129,3652]);
IMD2010 = imd_precip(:,:,1:365);
s1=shaperead('India_states.shp');
r=size(s1);
precip1= IMD2010;

[m n p]=size(precip1);

%% find total rain fall in that year
for i=1:p
A=precip1(:,:,i);
A(A ==-999) = nan ;
A1(:,:,i)=A;
if i==1
    A2=A;
else
A2=A2+A;
end
end
A2(A2<0)=nan;

Rain_imd=A2';

%% plotting  total rain fall
figure;

contourf(imd_lon1,imd_lat1,A2','LineStyle','none');

colorbar;
hold on;
xlim([65 105]); ylim([0 40]);

%%adding shape files
%  for j=1:s
%      plot(s2(j,1).X,s2(j,1).Y,'LineWidth',2,'color',[0 0 0]);  
%  end
 for j=1:r
     plot(s1(j,1).X,s1(j,1).Y,'LineWidth',2,'color',[0 0 0]);  
 end
title('IMD Rainfall');

grid on;
set(gca,'XColor', [0 0 0],'YColor',[0 0 0],'ZColor',[0 0 0]);

%% selecting specific region
% select latitudes in between 6.125 to 39.125 in increments of 0.25
% select longitudes in between 66.125 to 100.125 in increments of 0.25
des_lowlat=17;
des_uplat=20;
des_lowlon=77;
des_uplon=80;
ind5_imd=find(imd_lat1>des_lowlat,1,'first');
ind6_imd=find(imd_lat1>des_uplat,1,'first');
latdes_imd=imd_lat1(ind5_imd:ind6_imd,1);

ind7_imd=find(imd_lon1>des_lowlon,1,'first');
ind8_imd=find(imd_lon1>des_uplon,1,'first');
londes_imd=imd_lon1(ind7_imd:ind8_imd,1);

imd_des=A1(ind7_imd:ind8_imd,ind5_imd:ind6_imd,:);
imd_rain_per_day=sum(sum(imd_des))/441;

for k=1:p
    imd_day_wise_rain_Year(k) = imd_rain_per_day(k);
end
figure,plot(imd_day_wise_rain_Year);
[max_RainFall day_of_max_rainFall] = max(imd_day_wise_rain_Year)
