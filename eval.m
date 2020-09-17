function [ imd_des,imd_day_wise_rain_Year,perssian_des,per_day_wise_rain_Year,TRMM_des,tmrr_day_wise_rain_Year ] = eval( IMD,imd_lon1,imd_lat1,per,trmm,des_lowlat,des_uplat,des_lowlon,des_uplon)


%% IMD RAIN FALL FROM YEAR 2010-2019




imd_precip1= IMD;
% lon1_imd=lon;
% lat1_imd=lat;
[m n p]=size(imd_precip1);
 
for i=1:p
i_A=imd_precip1(:,:,i);
i_A(i_A ==-999) = nan ;
i_A1(:,:,i)=i_A;
if i==1
    i_A2=i_A;
else
i_A2=i_A2+i_A;
end
end
i_A2(i_A2<0)=nan;
 
Rain_imd=i_A2';
 

ind5_imd=find(imd_lat1>des_lowlat,1,'first');
ind6_imd=find(imd_lat1>des_uplat,1,'first');
latdes_imd=imd_lat1(ind5_imd:ind6_imd,1)
 
ind7_imd=find(imd_lon1>des_lowlon,1,'first');
ind8_imd=find(imd_lon1>des_uplon,1,'first');
londes_imd=imd_lon1(ind7_imd:ind8_imd,1)
 
imd_des=i_A1(ind7_imd:ind8_imd,ind5_imd:ind6_imd,:);
imd_rain_per_day=sum(sum(imd_des))/81;
 
for k=1:p
    imd_day_wise_rain_Year(k) = imd_rain_per_day(k);
end





lon1_perssian=ncread(per,'lon');
lat1_perssian=ncread(per,'lat');
lat1_perssian = sortrows( lat1_perssian );
per_precip1=ncread(per,'precip');
per_precip1=flipud(per_precip1);
 [m n p]=size(per_precip1);
for i=1:p
p_A=per_precip1(:,:,i);
p_A(p_A ==-99) = nan ;
p_A1(:,:,i)=p_A;
if i==1
    p_A2=p_A;
else
    p_A2=p_A2+p_A;
end
end
 
 
Rain_perssian=p_A2';

ind5_perssian=find(lat1_perssian>des_lowlat,1,'first');
ind6_perssian=find(lat1_perssian>des_uplat,1,'first');
latdes_perssian=lat1_perssian(ind5_perssian:ind6_perssian,1)
 
ind7_perssian=find(lon1_perssian>des_lowlon,1,'first');
ind8_perssian=find(lon1_perssian>des_uplon,1,'first');
londes_perssian=lon1_perssian(ind7_perssian:ind8_perssian,1)
 
perssian_des=p_A1(ind7_perssian:ind8_perssian,ind5_perssian:ind6_perssian,:);
per_rain_per_day=sum(sum(perssian_des))/81;
 
for k=1:p
    per_day_wise_rain_Year(k) = per_rain_per_day(k);
end

d_trmm=ncinfo(trmm);
lon1_TRMM=ncread(trmm,'longitude');
lat1_TRMM=ncread(trmm,'latitude');
imd_precip1=ncread(trmm,'precipitation');
%2018
% precip1(:,:,181) =precip1(:,:,182) ;
 
%% find total rain fall in that year
[m n p]=size(imd_precip1);
for i=1:p
t_A=imd_precip1(:,:,i);

t_A1(:,:,i)=t_A;
if i==1
    t_A2=t_A;
else
   
    t_A2=t_A2+t_A;
end
end
t_A2(t_A2<0)=nan;
 
Rain_trmm=t_A2';
 
ind5_TRMM=find(lat1_TRMM>des_lowlat,1,'first');
ind6_TRMM=find(lat1_TRMM>des_uplat,1,'first');
latdes_TRMM=lat1_TRMM(ind5_TRMM:ind6_TRMM,1)
 
ind7_TRMM=find(lon1_TRMM>des_lowlon,1,'first');
ind8_TRMM=find(lon1_TRMM>des_uplon,1,'first');
londes_imd=lon1_TRMM(ind7_TRMM:ind8_TRMM,1)
 
TRMM_des=t_A1(ind7_TRMM:ind8_TRMM,ind5_TRMM:ind6_TRMM,:);
tmrr_rain_per_day=sum(sum(TRMM_des))/81;
 
for k=1:p
    tmrr_day_wise_rain_Year(k) = tmrr_rain_per_day(k);
end


end

