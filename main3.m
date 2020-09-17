clc
close all
clear all

%% add shape files
s1=shaperead('India_states.shp');
% s2=shaperead('world_bound.shp');
r=size(s1);
% s=size(s2);
%% IMD RAIN FALL FROM YEAR 2010-2019

IMD_data = ncinfo('rf_imd_25km_1901-2019.nc');
imd_lon1=ncread('rf_imd_25km_1901-2019.nc','lon');
imd_lat1=ncread('rf_imd_25km_1901-2019.nc','lat');
imd_precip=ncread('rf_imd_25km_1901-2019.nc','rf',[1,1,39811],[135,129,3652]);
IMD2010 = imd_precip(:,:,1:365);

%%region1

[ imd_des,imd_day_wise_rain_Year,perssian_des,per_day_wise_rain_Year,TRMM_des,tmrr_day_wise_rain_Year ] = eval( IMD2010,imd_lon1,imd_lat1,'CDR_2020-09-04084752AM_2010.nc','TRMM2010.nc',26,28,72,74);

%%region2

[ imd_des,imd_day_wise_rain_Year,perssian_des,per_day_wise_rain_Year,TRMM_des,tmrr_day_wise_rain_Year ] = eval( IMD2010,imd_lon1,imd_lat1,'CDR_2020-09-04084752AM_2010.nc','TRMM2010.nc',24,26,84,86);

%%region3

[ imd_des,imd_day_wise_rain_Year,perssian_des,per_day_wise_rain_Year,TRMM_des,tmrr_day_wise_rain_Year ] = eval( IMD2010,imd_lon1,imd_lat1,'CDR_2020-09-04084752AM_2010.nc','TRMM2010.nc',16,18,74,76);

%%region4

[ imd_des,imd_day_wise_rain_Year,perssian_des,per_day_wise_rain_Year,TRMM_des,tmrr_day_wise_rain_Year ] = eval( IMD2010,imd_lon1,imd_lat1,'CDR_2020-09-04084752AM_2010.nc','TRMM2010.nc',10,12,77,79);

%%region5

[ imd_des,imd_day_wise_rain_Year,perssian_des,per_day_wise_rain_Year,TRMM_des,tmrr_day_wise_rain_Year ] = eval( IMD2010,imd_lon1,imd_lat1,'CDR_2020-09-04084752AM_2010.nc','TRMM2010.nc',22,24,76,78);

%%region6

[ imd_des,imd_day_wise_rain_Year,perssian_des,per_day_wise_rain_Year,TRMM_des,tmrr_day_wise_rain_Year ] = eval( IMD2010,imd_lon1,imd_lat1,'CDR_2020-09-04084752AM_2010.nc','TRMM2010.nc',33,35,76,78);
