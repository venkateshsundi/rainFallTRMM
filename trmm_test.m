clc
clear all
close all

s1=shaperead('India_states.shp');
r=size(s1);

%% load TRMM data
a=ncinfo('TRMM2018.nc');
lon1_TRMM=ncread('TRMM2018.nc','longitude');
lat1_TRMM=ncread('TRMM2018.nc','latitude');
time1=ncread('TRMM2018.nc','time');
precip1=ncread('TRMM2018.nc','precipitation');

%% find total rain fall in that year
[m n p]=size(precip1);
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

Rain_trmm=A2';

%% plotting  total rain fall
figure;
contourf(lon1_TRMM,lat1_TRMM,A2','LineStyle','none');
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
title('TRMM Rainfall');
grid on;
set(gca,'XColor', [0 0 0],'YColor',[0 0 0],'ZColor',[0 0 0]);

%% selecting specific region
% select latitudes in between 6.125 to 39.125 in increments of 0.25
% select longitudes in between 66.125 to 100.125 in increments of 0.25
des_lowlat=17;
des_uplat=20;
des_lowlon=77;
des_uplon=80;
ind5_TRMM=find(lat1_TRMM>des_lowlat,1,'first');
ind6_TRMM=find(lat1_TRMM>des_uplat,1,'first');
latdes_TRMM=lat1_TRMM(ind5_TRMM:ind6_TRMM,1);

ind7_TRMM=find(lon1_TRMM>des_lowlon,1,'first');
ind8_TRMM=find(lon1_TRMM>des_uplon,1,'first');
londes_imd=lon1_TRMM(ind7_TRMM:ind8_TRMM,1);

TRMM_des=A1(ind7_TRMM:ind8_TRMM,ind5_TRMM:ind6_TRMM,:);
tmrr_rain_per_day=sum(sum(TRMM_des))/441;

for k=1:p
    tmrr_day_wise_rain_Year(k) = tmrr_rain_per_day(k);
end
figure,plot(tmrr_day_wise_rain_Year);
[max_RainFall day_of_max_rainFall] = max(tmrr_day_wise_rain_Year);