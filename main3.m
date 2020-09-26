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
data1=load('CMORPH2010.mat');
CMORPH2010=data1.CMORPH2010;
imdd = IMD2010;
trmm = 'TRMM2010.nc';
% per=ncread('CDR_2020-09-04084752AM_2011.nc','precip');

%%region1

[ r1_imd_des,r1_imd_day_wise_rain_Year,r1_cmorph_des,r1_cmorph_day_wise_rain_Year,r1_TRMM_des,r1_tmrr_day_wise_rain_Year ] = evaluation( imdd,imd_lon1,imd_lat1,CMORPH2010,trmm,26,28,72,74);
[ june(1),july(1),aug(1),sep(1),oct(1),nov(1),dec(1) ] = avg_rain_month_wise( r1_imd_day_wise_rain_Year );
[ june(2),july(2),aug(2),sep(2),oct(2),nov(2),dec(2) ] = avg_rain_month_wise( r1_cmorph_day_wise_rain_Year );
[ june(3),july(3),aug(3),sep(3),oct(3),nov(3),dec(3) ] = avg_rain_month_wise( r1_tmrr_day_wise_rain_Year);
% [ june(4),july(4),aug(4),sep(4),oct(4),nov(4),dec(4) ] = avg_rain_month_wise( r1_per_day_wise_rain_Year);
y1 = [june;july;aug;sep;oct;nov;dec];
x = 6:1:12;
figure,subplot(2,3,1),b=bar(x,y1),title('region 1 month wise'),legend('IMD','CMORPH','TRMM');
xlabel('month');
ylabel('precipitation');
hold on;
%%region2

[ r2_imd_des,r2_imd_day_wise_rain_Year,r2_cmorph_des,r2_cmorph_day_wise_rain_Year,r2_TRMM_des,r2_tmrr_day_wise_rain_Year ] = evaluation( imdd,imd_lon1,imd_lat1,CMORPH2010,trmm,24,26,84,86);
[june(1),july(1),aug(1),sep(1),oct(1),nov(1),dec(1)] = avg_rain_month_wise( r2_imd_day_wise_rain_Year );
[ june(2),july(2),aug(2),sep(2),oct(2),nov(2),dec(2) ] = avg_rain_month_wise( r2_cmorph_day_wise_rain_Year );
[ june(3),july(3),aug(3),sep(3),oct(3),nov(3),dec(3) ] = avg_rain_month_wise( r2_tmrr_day_wise_rain_Year);
y2 = [june;july;aug;sep;oct;nov;dec];
subplot(2,3,2),b=bar(x,y2),title('region 2 month wise'),legend('IMD','CMORPH','TRMM');
xlabel('month');
ylabel('precipitation');
%%region3

[ r3_imd_des,r3_imd_day_wise_rain_Year,r3_cmorph_des,r3_cmorph_day_wise_rain_Year,r3_TRMM_des,r3_tmrr_day_wise_rain_Year ] = evaluation( imdd,imd_lon1,imd_lat1,CMORPH2010,trmm,16,18,74,76);
[ june(1),july(1),aug(1),sep(1),oct(1),nov(1),dec(1) ] = avg_rain_month_wise( r3_imd_day_wise_rain_Year );
[ june(2),july(2),aug(2),sep(2),oct(2),nov(2),dec(2) ] = avg_rain_month_wise( r3_cmorph_day_wise_rain_Year );
[ june(3),july(3),aug(3),sep(3),oct(3),nov(3),dec(3) ] = avg_rain_month_wise( r3_tmrr_day_wise_rain_Year);
y3 = [june;july;aug;sep;oct;nov;dec];
subplot(2,3,3),b=bar(x,y3),title('region 3 month wise'),legend('IMD','CMORPH','TRMM');
xlabel('month');
ylabel('precipitation');
%%region4

[ r4_imd_des,r4_imd_day_wise_rain_Year,r4_cmorph_des,r4_cmorph_day_wise_rain_Year,r4_TRMM_des,r4_tmrr_day_wise_rain_Year ] = evaluation( imdd,imd_lon1,imd_lat1,CMORPH2010,trmm,10,12,77,79);
[ june(1),july(1),aug(1),sep(1),oct(1),nov(1),dec(1) ] = avg_rain_month_wise( r4_imd_day_wise_rain_Year );
[ june(2),july(2),aug(2),sep(2),oct(2),nov(2),dec(2) ] = avg_rain_month_wise( r4_cmorph_day_wise_rain_Year );
[  june(3),july(3),aug(3),sep(3),oct(3),nov(3),dec(3) ] = avg_rain_month_wise( r4_tmrr_day_wise_rain_Year);
y4 = [june;july;aug;sep;oct;nov;dec];
subplot(2,3,4),b=bar(x,y4),title('region 4 month wise'),legend('IMD','CMORPH','TRMM');
xlabel('month');
ylabel('precipitation');
%%region5

[ r5_imd_des,r5_imd_day_wise_rain_Year,r5_cmorph_des,r5_cmorph_day_wise_rain_Year,r5_TRMM_des,r5_tmrr_day_wise_rain_Year ] = evaluation( imdd,imd_lon1,imd_lat1,CMORPH2010,trmm,22,24,76,78);
[ june(1),july(1),aug(1),sep(1),oct(1),nov(1),dec(1)  ] = avg_rain_month_wise( r5_imd_day_wise_rain_Year );
[june(2),july(2),aug(2),sep(2),oct(2),nov(2),dec(2) ] = avg_rain_month_wise( r5_cmorph_day_wise_rain_Year );
[ june(3),july(3),aug(3),sep(3),oct(3),nov(3),dec(3) ] = avg_rain_month_wise( r5_tmrr_day_wise_rain_Year);
y5 = [june;july;aug;sep;oct;nov;dec];
subplot(2,3,5),b=bar(x,y5),title('region 5 month wise'),legend('IMD','CMORPH','TRMM');
xlabel('month');
ylabel('precipitation');
%%region6

[ r6_imd_des,r6_imd_day_wise_rain_Year,r6_cmorph_des,r6_cmorph_day_wise_rain_Year,r6_TRMM_des,r6_tmrr_day_wise_rain_Year ] = evaluation( imdd,imd_lon1,imd_lat1,CMORPH2010,trmm,33,35,76,78);
[ june(1),july(1),aug(1),sep(1),oct(1),nov(1),dec(1) ] = avg_rain_month_wise( r6_imd_day_wise_rain_Year );
[june(2),july(2),aug(2),sep(2),oct(2),nov(2),dec(2) ] = avg_rain_month_wise( r6_cmorph_day_wise_rain_Year );
[ june(3),july(3),aug(3),sep(3),oct(3),nov(3),dec(3) ] = avg_rain_month_wise( r6_tmrr_day_wise_rain_Year);
y6 = [june;july;aug;sep;oct;nov;dec];
subplot(2,3,6),b=bar(x,y6),title('region 6 month wise'),legend('IMD','CMORPH','TRMM');
xlabel('month');
ylabel('precipitation');


%REGION WISE
m6 = [y1(1,1:3);y2(1,1:3);y3(1,1:3);y4(1,1:3);y5(1,1:3);y6(1,1:3)];
figure,subplot(3,3,1),b=bar(m6),title('june month');
xlabel('region');
ylabel('precipitation');legend('IMD','CMORPH','TRMM');
hold on

m7 = [y1(2,1:3);y2(2,1:3);y3(2,1:3);y4(2,1:3);y5(2,1:3);y6(2,1:3)];
subplot(3,3,2),b=bar(m7),title('july month');
xlabel('region');
ylabel('precipitation');legend('IMD','CMORPH','TRMM');


m8 = [y1(3,1:3);y2(3,1:3);y3(3,1:3);y4(3,1:3);y5(3,1:3);y6(3,1:3)];
subplot(3,3,3),b=bar(m8),title('aug month');
xlabel('region');
ylabel('precipitation');legend('IMD','CMORPH','TRMM');


m9 = [y1(4,1:3);y2(4,1:3);y3(4,1:3);y4(4,1:3);y5(4,1:3);y6(4,1:3)];
subplot(3,3,4),b=bar(m9),title('sep month');
xlabel('region');
ylabel('precipitation');legend('IMD','CMORPH','TRMM');


m10 = [y1(5,1:3);y2(5,1:3);y3(5,1:3);y4(5,1:3);y5(5,1:3);y6(5,1:3)];
subplot(3,3,5),b=bar(m10),title('oct month');
xlabel('region');
ylabel('precipitation');legend('IMD','CMORPH','TRMM');

m11 = [y1(6,1:3);y2(6,1:3);y3(6,1:3);y4(6,1:3);y5(6,1:3);y6(6,1:3)];
subplot(3,3,6),b=bar(m11),title('nov month');
xlabel('region');
ylabel('precipitation');legend('IMD','CMORPH','TRMM');


m12 = [y1(7,1:3);y2(7,1:3);y3(7,1:3);y4(7,1:3);y5(7,1:3);y6(7,1:3)];
subplot(3,3,7),b=bar(m12),title('dec month');
xlabel('region');
ylabel('precipitation');legend('IMD','CMORPH','TRMM');


%% METRICS TAKE INPUT AS 9X9X365
figure,
subplot(6,1,1),plot(r1_imd_day_wise_rain_Year),title('imd region 1');
subplot(6,1,2),plot(r2_imd_day_wise_rain_Year),title('region 2');
subplot(6,1,3),plot(r3_imd_day_wise_rain_Year),title('region 3');
subplot(6,1,4),plot(r4_imd_day_wise_rain_Year),title('region 4');
subplot(6,1,5),plot(r5_imd_day_wise_rain_Year),title('region 5');
subplot(6,1,6),plot(r6_imd_day_wise_rain_Year),title('region 6');


figure,
subplot(6,1,1),plot(r1_cmorph_day_wise_rain_Year),title('cmorpg region 1');
subplot(6,1,2),plot(r2_cmorph_day_wise_rain_Year),title('region 2');
subplot(6,1,3),plot(r3_cmorph_day_wise_rain_Year),title('region 3');
subplot(6,1,4),plot(r4_cmorph_day_wise_rain_Year),title('region 4');
subplot(6,1,5),plot(r5_cmorph_day_wise_rain_Year),title('region 5');
subplot(6,1,6),plot(r6_cmorph_day_wise_rain_Year),title('region 6');

figure,
subplot(6,1,1),plot(r1_tmrr_day_wise_rain_Year),title('trmm region 1');
subplot(6,1,2),plot(r2_tmrr_day_wise_rain_Year),title('region 2');
subplot(6,1,3),plot(r3_tmrr_day_wise_rain_Year),title('region 3');
subplot(6,1,4),plot(r4_tmrr_day_wise_rain_Year),title('region 4');
subplot(6,1,5),plot(r5_tmrr_day_wise_rain_Year),title('region 5');
subplot(6,1,6),plot(r6_tmrr_day_wise_rain_Year),title('region 6');
 
 T_Bias=[] ;
 T_RMSE=[]  ;
 T_CC=[] ;
 C_Bias=[] ; 
 C_RMSE=[] ; 
 C_CC=[] ;
 %2010
[ T_Bias(1), T_RMSE(1), T_CC(1) ] = metrics( r1_TRMM_des,r1_imd_des );
[ C_Bias(1), C_RMSE(1), C_CC(1) ] = metrics( r1_cmorph_des,r1_imd_des );
[ T_Bias(2), T_RMSE(2), T_CC(2) ] = metrics( r2_TRMM_des,r2_imd_des );
[ C_Bias(2), C_RMSE(2), C_CC(2) ] = metrics( r2_cmorph_des,r2_imd_des);
[ T_Bias(3), T_RMSE(3), T_CC(3) ] = metrics( r3_TRMM_des,r3_imd_des );
[ C_Bias(3), C_RMSE(3), C_CC(3) ] = metrics( r3_cmorph_des,r3_imd_des);
[ T_Bias(4), T_RMSE(4), T_CC(4) ] = metrics( r4_TRMM_des,r4_imd_des);
[ C_Bias(4), C_RMSE(4), C_CC(4) ] = metrics( r4_cmorph_des,r4_imd_des );
[ T_Bias(5), T_RMSE(5), T_CC(5) ] = metrics( r5_TRMM_des,r5_imd_des);
[ C_Bias(5), C_RMSE(5), C_CC(5) ] = metrics( r5_cmorph_des,r5_imd_des );
[ T_Bias(6), T_RMSE(6), T_CC(6) ] = metrics( r6_TRMM_des,r6_imd_des);
[ C_Bias(6), C_RMSE(6), C_CC(6) ] = metrics( r6_cmorph_des,r6_imd_des);

r1a = [C_Bias;T_Bias];
b=['CMORPH';' TRMM '];
figure,subplot(3,1,1),bar(r1a'),title('bias');hold on;
r1a = [C_RMSE;T_RMSE];
b=['CMORPH';' TRMM '];
subplot(3,1,2),bar(r1a'),title('RMSE');
r1a = [C_CC;T_CC];
b=['CMORPH';' TRMM '];
subplot(3,1,3),bar(r1a'),title('CC');

%%
T_POD=[];
T_FAR=[];
T_CSI=[];
T_POND=[];
C_POD=[];
C_FAR=[];
C_CSI=[];
C_POND=[];
%2010
[T_POD(1),T_FAR(1),T_CSI(1),T_POND(1)] = contingency_table( r1_TRMM_des,r1_imd_des);
[C_POD(1),C_FAR(1),C_CSI(1),C_POND(1)] = contingency_table(  r1_cmorph_des,r1_imd_des );
[T_POD(2),T_FAR(2),T_CSI(2),T_POND(2)] = contingency_table( r2_TRMM_des,r2_imd_des );
[C_POD(2),C_FAR(2),C_CSI(2),C_POND(2)] = contingency_table(  r2_cmorph_des,r2_imd_des  );
[T_POD(3),T_FAR(3),T_CSI(3),T_POND(3)] = contingency_table( r3_TRMM_des,r3_imd_des );
[C_POD(3),C_FAR(3),C_CSI(3),C_POND(3)] = contingency_table(  r3_cmorph_des,r3_imd_des  );
[T_POD(4),T_FAR(4),T_CSI(4),T_POND(4)] = contingency_table( r4_TRMM_des,r4_imd_des );
[C_POD(4),C_FAR(4),C_CSI(4),C_POND(4)] = contingency_table(  r4_cmorph_des,r4_imd_des  );
[T_POD(5),T_FAR(5),T_CSI(5),T_POND(5)] = contingency_table( r5_TRMM_des,r5_imd_des );
[C_POD(5),C_FAR(5),C_CSI(5),C_POND(5)] = contingency_table(  r5_cmorph_des,r5_imd_des  );
[T_POD(6),T_FAR(6),T_CSI(6),T_POND(6)] = contingency_table( r6_TRMM_des,r6_imd_des );
[C_POD(6),C_FAR(6),C_CSI(6),C_POND(6)] = contingency_table( r6_cmorph_des,r6_imd_des  );
a1  = [C_POD;T_POD];
b=['CMORPH';' TRMM '];
% figure,boxplot(a',b),title('POD');
figure,subplot(4,1,1),bar(a1'),title('POD');hold on;grid on
a2 = [C_FAR;T_FAR];
b=['CMORPH';' TRMM '];
% figure,boxplot(a',b),title('FAR');
subplot(4,1,2),bar(a2'),title('FAR');grid on
a3 = [C_CSI;T_CSI];
b=['CMORPH';' TRMM '];
% figure,boxplot(a',b),title('CSI');
subplot(4,1,3),bar(a3'),title('CSI');grid on
a4 = [C_POND;T_POND];
b=['CMORPH';' TRMM '];
% figure,boxplot(a',b),title('POND');
subplot(4,1,4),bar(a4'),title('POND');grid on
