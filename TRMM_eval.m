
function [tmrr_day_wise_rain_Year,TRMM_des] = TRMM_eval(data)
%% add shape files
% s1=shaperead('India_states.shp');
% s2=shaperead('world_bound.shp');
% r=size(s1);
% s=size(s2);
%% load TRMM data
a=ncinfo(data);
lon1_TRMM=ncread(data,'longitude');
lat1_TRMM=ncread(data,'latitude');
time1=ncread(data,'time');
precip1=ncread(data,'precipitation');

%% find total rain fall in that year
[m n p]=size(precip1);
for i=1:p
A=precip1(:,:,i);
A1(:,:,i)=A;
if i==1
    A2=A;
else
A2=A2+A;
end
end
Rain_trmm=A2';

%% plotting  total rain fall
% figure;
% contourf(lon1_TRMM,lat1_TRMM,A2','LineStyle','none');
% colorbar;
% hold on;
% xlim([75 85]); ylim([10 20]);
% 
% %%adding shape files
%  for j=1:s
%      plot(s2(j,1).X,s2(j,1).Y,'LineWidth',2,'color',[0 0 0]);  
%  end
%  for j=1:r
%      plot(s1(j,1).X,s1(j,1).Y,'LineWidth',2,'color',[0 0 0]);  
%  end
% title('TRMM Rainfall');
% grid on;
% set(gca,'XColor', [0 0 0],'YColor',[0 0 0],'ZColor',[0 0 0]);

%% selecting specific region
% select latitudes in between 6.125 to 39.125 in increments of 0.25
% select longitudes in between 66.125 to 100.125 in increments of 0.25
des_lowlat=10;
des_uplat=12;
des_lowlon=77;
des_uplon=79;
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
% figure,plot(day_wise_rain_Year);
% [max_RainFall day_of_max_rainFall] = max(day_wise_rain_Year);
end