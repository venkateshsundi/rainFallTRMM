function [ imd_des,imd_day_wise_rain_Year,cmorph_des,cmorph_day_wise_rain_Year,TRMM_des,tmrr_day_wise_rain_Year ] = evaluation( IMD,imd_lon1,imd_lat1,cmorph,trmm,des_lowlat,des_uplat,des_lowlon,des_uplon)


%% IMD RAIN FALL 
imd_precip1= IMD;
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


%% CMORPH RAINFALL
data1=load('CMORPH_LAT.mat');
lat1_cmorph=data1.lati;
data1=load('CMORPH_LON.mat');
lon1_cmorph=data1.long;
cmorph_precip1=cmorph;
[m n p]=size(cmorph_precip1);
for i=1:p
c_A=cmorph_precip1(:,:,i);
c_A(c_A ==-99.9000) = nan ;
c_A1(:,:,i)=c_A;
if i==1
    c_A2=c_A;
else
    c_A2=c_A2+c_A;
end
end
 
c_A2(c_A2<0)=nan; 
Rain_cmorph=c_A2';

ind5_cmorph=find(lat1_cmorph>des_lowlat,1,'first');
ind6_cmorph=find(lat1_cmorph>des_uplat,1,'first');
latdes_comorph=lat1_cmorph(ind5_cmorph:ind6_cmorph,1)
 
ind7_cmorph=find(lon1_cmorph>des_lowlon,1,'first');
ind8_cmorph=find(lon1_cmorph>des_uplon,1,'first');
londes_cmorph=lon1_cmorph(ind7_cmorph:ind8_cmorph,1)
 
cmorph_des=c_A1(ind7_cmorph:ind8_cmorph,ind5_cmorph:ind6_cmorph,:);
cmorph_rain_per_day=sum(sum(cmorph_des))/81;
 
for k=1:p
    cmorph_day_wise_rain_Year(k) = cmorph_rain_per_day(k);
end

%% TRMM RAINFALL

d_trmm=ncinfo(trmm);
lon1_TRMM=ncread(trmm,'longitude');
lat1_TRMM=ncread(trmm,'latitude');
trmm_precip1=ncread(trmm,'precipitation');
%2018
trmm_precip1(:,:,181) =trmm_precip1(:,:,182) ;
 
%% find total rain fall in that year
[m n p]=size(trmm_precip1);
for i=1:p
t_A=trmm_precip1(:,:,i);

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
londes_trmm=lon1_TRMM(ind7_TRMM:ind8_TRMM,1)
 
TRMM_des=t_A1(ind7_TRMM:ind8_TRMM,ind5_TRMM:ind6_TRMM,:);
tmrr_rain_per_day=sum(sum(TRMM_des))/81;
 
for k=1:p
    tmrr_day_wise_rain_Year(k) = tmrr_rain_per_day(k);
end

% %% perssian
% lon1_perssian=ncread('CDR_2020-09-04084752AM_2011.nc','lon');
% lat1_perssian=ncread('CDR_2020-09-04084752AM_2011.nc','lat');
% lat1_perssian = sortrows( lat1_perssian );
% per = flipud(per);
% %% find total rain fall in that year
% [m n p]=size(per);
% for i=1:p
% A=per(:,:,i);
% A(A ==-99) = nan ;
% A1(:,:,i)=A;
% if i==1
%     A2=A;
% else
% A2=A2+A;
% end
% end
% A2(A2<0)=nan;
% 
% 
% Rain_perssian=A2';
% 
% ind5_perssian=find(lat1_perssian>des_lowlat,1,'first');
% ind6_perssian=find(lat1_perssian>des_uplat,1,'first');
% latdes_perssian=lat1_perssian(ind5_perssian:ind6_perssian,1);
%  
% ind7_perssian=find(lon1_perssian>des_lowlon,1,'first');
% ind8_perssian=find(lon1_perssian>des_uplon,1,'first');
% londes_perssian=lon1_perssian(ind7_perssian:ind8_perssian,1);
%  
% perssian_des=A1(ind7_perssian:ind8_perssian,ind5_perssian:ind6_perssian,:);
% per_rain_per_day=sum(sum(perssian_des))/441;
%  
% for k=1:p
%     per_day_wise_rain_Year(k) = per_rain_per_day(k);
% end


end

