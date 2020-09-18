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
IMD2011 = imd_precip(:,:,366:730);
IMD2012 = imd_precip(:,:,731:1096);
IMD2013 = imd_precip(:,:,1097:1461);
IMD2014 = imd_precip(:,:,1462:1826);
IMD2015 = imd_precip(:,:,1827:2191);
IMD2016 = imd_precip(:,:,2192:2557);
IMD2017 = imd_precip(:,:,2558:2922);
IMD2018 = imd_precip(:,:,2923:3287);
IMD2019 = imd_precip(:,:,3288:3652);
%%region1

[ r1_imd_des,r1_imd_day_wise_rain_Year,r1_perssian_des,r1_per_day_wise_rain_Year,r1_TRMM_des,r1_tmrr_day_wise_rain_Year ] = evaluation( IMD2013,imd_lon1,imd_lat1,'CDR_2020-09-04084752AM_2013.nc','TRMM2013.nc',26,28,72,74);
[ june(1),july(1),aug(1),sep(1),oct(1),nov(1),dec(1) ] = avg_rain_month_wise( r1_imd_day_wise_rain_Year );
[ june(2),july(2),aug(2),sep(2),oct(2),nov(2),dec(2) ] = avg_rain_month_wise( r1_per_day_wise_rain_Year );
[ june(3),july(3),aug(3),sep(3),oct(3),nov(3),dec(3) ] = avg_rain_month_wise( r1_tmrr_day_wise_rain_Year);
y1 = [june;july;aug;sep;oct;nov;dec];
x= [];
figure,subplot(2,3,1),b=bar(y1),title('region 1 month wise'),legend('IMD','PERSIAN','TRMM');
hold on;
%%region2

[ r2_imd_des,r2_imd_day_wise_rain_Year,r2_perssian_des,r2_per_day_wise_rain_Year,r2_TRMM_des,r2_tmrr_day_wise_rain_Year ] = evaluation( IMD2013,imd_lon1,imd_lat1,'CDR_2020-09-04084752AM_2013.nc','TRMM2013.nc',24,26,84,86);
[june(1),july(1),aug(1),sep(1),oct(1),nov(1),dec(1)] = avg_rain_month_wise( r2_imd_day_wise_rain_Year );
[ june(2),july(2),aug(2),sep(2),oct(2),nov(2),dec(2) ] = avg_rain_month_wise( r2_per_day_wise_rain_Year );
[ june(3),july(3),aug(3),sep(3),oct(3),nov(3),dec(3) ] = avg_rain_month_wise( r2_tmrr_day_wise_rain_Year);
y2 = [june;july;aug;sep;oct;nov;dec];
x= [];
subplot(2,3,2),b=bar(y2),title('region 2 month wise'),legend('IMD','PERSIAN','TRMM');
%%region3

[ r3_imd_des,r3_imd_day_wise_rain_Year,r3_perssian_des,r3_per_day_wise_rain_Year,r3_TRMM_des,r3_tmrr_day_wise_rain_Year ] = evaluation( IMD2013,imd_lon1,imd_lat1,'CDR_2020-09-04084752AM_2013.nc','TRMM2013.nc',16,18,74,76);
[ june(1),july(1),aug(1),sep(1),oct(1),nov(1),dec(1) ] = avg_rain_month_wise( r3_imd_day_wise_rain_Year );
[ june(2),july(2),aug(2),sep(2),oct(2),nov(2),dec(2) ] = avg_rain_month_wise( r3_per_day_wise_rain_Year );
[ june(3),july(3),aug(3),sep(3),oct(3),nov(3),dec(3) ] = avg_rain_month_wise( r3_tmrr_day_wise_rain_Year);
y3 = [june;july;aug;sep;oct;nov;dec];
x= [];
subplot(2,3,3),b=bar(y3),title('region 3 month wise'),legend('IMD','PERSIAN','TRMM');
%%region4

[ r4_imd_des,r4_imd_day_wise_rain_Year,r4_perssian_des,r4_per_day_wise_rain_Year,r4_TRMM_des,r4_tmrr_day_wise_rain_Year ] = evaluation( IMD2013,imd_lon1,imd_lat1,'CDR_2020-09-04084752AM_2013.nc','TRMM2013.nc',10,12,77,79);
[ june(1),july(1),aug(1),sep(1),oct(1),nov(1),dec(1) ] = avg_rain_month_wise( r4_imd_day_wise_rain_Year );
[ june(2),july(2),aug(2),sep(2),oct(2),nov(2),dec(2) ] = avg_rain_month_wise( r4_per_day_wise_rain_Year );
[  june(3),july(3),aug(3),sep(3),oct(3),nov(3),dec(3) ] = avg_rain_month_wise( r4_tmrr_day_wise_rain_Year);
y4 = [june;july;aug;sep;oct;nov;dec];
x= [];
subplot(2,3,4),b=bar(y4),title('region 4 month wise'),legend('IMD','PERSIAN','TRMM');
%%region5

[ r5_imd_des,r5_imd_day_wise_rain_Year,r5_perssian_des,r5_per_day_wise_rain_Year,r5_TRMM_des,r5_tmrr_day_wise_rain_Year ] = evaluation( IMD2013,imd_lon1,imd_lat1,'CDR_2020-09-04084752AM_2013.nc','TRMM2013.nc',22,24,76,78);
[ june(1),july(1),aug(1),sep(1),oct(1),nov(1),dec(1)  ] = avg_rain_month_wise( r5_imd_day_wise_rain_Year );
[june(2),july(2),aug(2),sep(2),oct(2),nov(2),dec(2) ] = avg_rain_month_wise( r5_per_day_wise_rain_Year );
[ june(3),july(3),aug(3),sep(3),oct(3),nov(3),dec(3) ] = avg_rain_month_wise( r5_tmrr_day_wise_rain_Year);
y5 = [june;july;aug;sep;oct;nov;dec];
x= [];
subplot(2,3,5),b=bar(y5),title('region 5 month wise'),legend('IMD','PERSIAN','TRMM');

%%region6

[ r6_imd_des,r6_imd_day_wise_rain_Year,r6_perssian_des,r6_per_day_wise_rain_Year,r6_TRMM_des,r6_tmrr_day_wise_rain_Year ] = evaluation( IMD2013,imd_lon1,imd_lat1,'CDR_2020-09-04084752AM_2013.nc','TRMM2013.nc',33,35,76,78);
[ june(1),july(1),aug(1),sep(1),oct(1),nov(1),dec(1) ] = avg_rain_month_wise( r6_imd_day_wise_rain_Year );
[june(2),july(2),aug(2),sep(2),oct(2),nov(2),dec(2) ] = avg_rain_month_wise( r6_per_day_wise_rain_Year );
[ june(3),july(3),aug(3),sep(3),oct(3),nov(3),dec(3) ] = avg_rain_month_wise( r6_tmrr_day_wise_rain_Year);
y6 = [june;july;aug;sep;oct;nov;dec];
x= [];
subplot(2,3,6),b=bar(y6),title('region 6 month wise'),legend('IMD','PERSIAN','TRMM');



%REGION WISE
m6 = [y1(1),y2(1),y3(1),y4(1),y5(1),y6(1)];
figure,subplot(3,3,1),b=bar(m6),title('june month');
hold on

m7 = [y1(2),y2(2),y3(2),y4(2),y5(2),y6(2)];
subplot(3,3,2),b=bar(m7),title('july month');


m8 = [y1(3),y2(3),y3(3),y4(3),y5(3),y6(3)];
subplot(3,3,3),b=bar(m8),title('aug month');


m9 = [y1(4),y2(4),y3(4),y4(4),y5(4),y6(4)];
subplot(3,3,4),b=bar(m9),title('sep month');


m10 = [y1(5),y2(5),y3(5),y4(5),y5(5),y6(5)];
subplot(3,3,5),b=bar(m10),title('oct month');

m11 = [y1(6),y2(6),y3(6),y4(6),y5(6),y6(6)];
subplot(3,3,6),b=bar(m11),title('nov month');


m12 = [y1(7),y2(7),y3(7),y4(7),y5(7),y6(7)];
subplot(3,3,7),b=bar(m12),title('dec month'),legend('a','b','a','b','a','b');
