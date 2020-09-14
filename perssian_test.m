clc
clear all
close all

s1=shaperead('India_states.shp');
r=size(s1);
rdata=ncinfo('CDR_2020-09-04084752AM_2011.nc');
lon1_perssian=ncread('CDR_2020-09-04084752AM_2011.nc','lon');
lat1_perssian=ncread('CDR_2020-09-04084752AM_2011.nc','lat');
lat1_perssian = sortrows( lat1_perssian );
time1=ncread('CDR_2020-09-04084752AM_2011.nc','datetime');
precip1=ncread('CDR_2020-09-04084752AM_2011.nc','precip');

%% find total rain fall in that year
[m n p]=size(precip1);
for i=1:p
A=precip1(:,:,i);
A(A ==-99) = nan ;

A1(:,:,i)=A;
if i==1
    A2=A;
else
A2=A2+A;
end
end
A2(A2<0)=nan;


Rain_perssian=A2';

% %% plotting  total rain fall
figure;

contourf(lon1_perssian,lat1_perssian,A2','LineStyle','none');

colorbar;
hold on;
%%
xlim([65 105]); ylim([0 40]);

%%adding shape files
%  for j=1:s
%      plot(s2(j,1).X,s2(j,1).Y,'LineWidth',2,'color',[0 0 0]);  
%  end
 for j=1:r
     plot(s1(j,1).X,s1(j,1).Y,'LineWidth',2,'color',[0 0 0]);  
 end
title('PERSSIAN Rainfall');

grid on;
set(gca,'XColor', [0 0 0],'YColor',[0 0 0],'ZColor',[0 0 0]);
 
%% selecting specific region
% select latitudes in between 6.125 to 39.125 in increments of 0.25
% select longitudes in between 66.125 to 100.125 in increments of 0.25
des_lowlat=17;
des_uplat=20;
des_lowlon=77;
des_uplon=80;
ind5_perssian=find(lat1_perssian>des_lowlat,1,'first');
ind6_perssian=find(lat1_perssian>des_uplat,1,'first');
latdes_perssian=lat1_perssian(ind5_perssian:ind6_perssian,1);
 
ind7_perssian=find(lon1_perssian>des_lowlon,1,'first');
ind8_perssian=find(lon1_perssian>des_uplon,1,'first');
londes_perssian=lon1_perssian(ind7_perssian:ind8_perssian,1);
 
perssian_des=A1(ind7_perssian:ind8_perssian,ind5_perssian:ind6_perssian,:);
per_rain_per_day=sum(sum(perssian_des))/441;
 
for k=1:p
    per_day_wise_rain_Year(k) = per_rain_per_day(k);
end
figure,plot(per_day_wise_rain_Year);
[max_RainFall day_of_max_rainFall] = max(per_day_wise_rain_Year);
