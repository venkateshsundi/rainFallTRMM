function [ imd_day_wise_rain_Year,imd_des] = IMD_eval( data,lat,lon )



%% load IMD data
precip1= data;
lon1_imd=lon;
lat1_imd=lat;
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
% figure;
% 
% contourf(lon1_imd,lat1_imd,A2','LineStyle','none');
% 
% colorbar;
% hold on;
% xlim([65 105]); ylim([0 40]);
% 
% %%adding shape files
%  for j=1:s
%      plot(s2(j,1).X,s2(j,1).Y,'LineWidth',2,'color',[0 0 0]);  
%  end
%  for j=1:r
%      plot(s1(j,1).X,s1(j,1).Y,'LineWidth',2,'color',[0 0 0]);  
%  end
% title('IMD Rainfall');
% 
% grid on;
% set(gca,'XColor', [0 0 0],'YColor',[0 0 0],'ZColor',[0 0 0]);

%% selecting specific region
% select latitudes in between 6.125 to 39.125 in increments of 0.25
% select longitudes in between 66.125 to 100.125 in increments of 0.25
des_lowlat=10;
des_uplat=12;
des_lowlon=77;
des_uplon=79;
ind5_imd=find(lat1_imd>des_lowlat,1,'first');
ind6_imd=find(lat1_imd>des_uplat,1,'first');
latdes_imd=lat1_imd(ind5_imd:ind6_imd,1);

ind7_imd=find(lon1_imd>des_lowlon,1,'first');
ind8_imd=find(lon1_imd>des_uplon,1,'first');
londes_imd=lon1_imd(ind7_imd:ind8_imd,1);

imd_des=A1(ind7_imd:ind8_imd,ind5_imd:ind6_imd,:);
imd_rain_per_day=sum(sum(imd_des))/441;

for k=1:p
    imd_day_wise_rain_Year(k) = imd_rain_per_day(k);
end
% figure,plot(day_wise_rain_Year);
% [max_RainFall day_of_max_rainFall] = max(day_wise_rain_Year)

end

