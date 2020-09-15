clc
clear all
close all

%% add shape files
s1=shaperead('India_states.shp');
% s2=shaperead('world_bound.shp');
r=size(s1);
% s=size(s2);

%% IMD TIME SERIES RAIN FALL FROM YEAR 2010-2019
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
%% IMD_GAUGE TIME SERIES RAIN FALL FROM YEAR 2010-20192426
[IMD_precip_2010,IMD_des_2010] = IMD_eval(IMD2010,imd_lat1,imd_lon1);
[IMD_precip_2011,IMD_des_2011] = IMD_eval(IMD2011,imd_lat1,imd_lon1);
[IMD_precip_2012,IMD_des_2012] = IMD_eval(IMD2012,imd_lat1,imd_lon1);
[IMD_precip_2013,IMD_des_2013] = IMD_eval(IMD2013,imd_lat1,imd_lon1);
[IMD_precip_2014,IMD_des_2014] = IMD_eval(IMD2014,imd_lat1,imd_lon1);
[IMD_precip_2015,IMD_des_2015] = IMD_eval(IMD2015,imd_lat1,imd_lon1);
[IMD_precip_2016,IMD_des_2016] = IMD_eval(IMD2016,imd_lat1,imd_lon1);
[IMD_precip_2017,IMD_des_2017] = IMD_eval(IMD2017,imd_lat1,imd_lon1);
[IMD_precip_2018,IMD_des_2018] = IMD_eval(IMD2018,imd_lat1,imd_lon1);
[IMD_precip_2019,IMD_des_2019] = IMD_eval(IMD2019,imd_lat1,imd_lon1);


%% PERSIAN TIME SERIES RAIN FALL FROM YEAR 2010-2019
[TRMM_precip_2010,TRMM_des_2010] = TRMM_eval('TRMM2010.nc');
[TRMM_precip_2011,TRMM_des_2011] = TRMM_eval('TRMM2011.nc');
[TRMM_precip_2012,TRMM_des_2012] = TRMM_eval('TRMM2012.nc');
[TRMM_precip_2013,TRMM_des_2013] = TRMM_eval('TRMM2013.nc');
[TRMM_precip_2014,TRMM_des_2014] = TRMM_eval('TRMM2014.nc');
[TRMM_precip_2015,TRMM_des_2015] = TRMM_eval('TRMM2015.nc');
[TRMM_precip_2016,TRMM_des_2016] = TRMM_eval('TRMM2016.nc');
[TRMM_precip_2017,TRMM_des_2017] = TRMM_eval('TRMM2017.nc');
[TRMM_precip_2018,TRMM_des_2018] = TRMM_eval('TRMM2018.nc');%ERROR_NO_GRAPH
[TRMM_precip_2019,TRMM_des_2019] = TRMM_eval('TRMM2019.nc');

%% TRMM TIME SERIES RAIN FALL FROM YEAR 2010-2019
[PER_precip_2010,perssian_des_2010] = perssian_eval('CDR_2020-09-04084752AM_2010.nc');
[PER_precip_2011,perssian_des_2011] = perssian_eval('CDR_2020-09-04084752AM_2011.nc');%ERROR_NO_GRAPH
[PER_precip_2012,perssian_des_2012] = perssian_eval('CDR_2020-09-04084752AM_2012.nc');%ERROR_NO_GRAPH
[PER_precip_2013,perssian_des_2013] = perssian_eval('CDR_2020-09-04084752AM_2013.nc');
[PER_precip_2014,perssian_des_2014] = perssian_eval('CDR_2020-09-04084752AM_2014.nc');
[PER_precip_2015,perssian_des_2015] = perssian_eval('CDR_2020-09-04084752AM_2015.nc');
[PER_precip_2016,perssian_des_2016] = perssian_eval('CDR_2020-09-04084752AM_2016.nc');
[PER_precip_2017,perssian_des_2017] = perssian_eval('CDR_2020-09-04084752AM_2017.nc');
[PER_precip_2018,perssian_des_2018] = perssian_eval('CDR_2020-09-04084752AM_2018.nc');
[PER_precip_2019,perssian_des_2019] = perssian_eval('CDR_2020-09-04084752AM_2019.nc');








%% CONTENGENCY MATRIX EVALUATION
%product,observed :: taken for all days in year like 21x21x365  
T_POD=[];
T_FAR=[];
T_CSI=[];
T_POND=[];
P_POD=[];
P_FAR=[];
P_CSI=[];
P_POND=[];
%2010
[T_POD(1),T_FAR(1),T_CSI(1),T_POND(1)] = contingency_table( TRMM_des_2010, IMD_des_2010 );
[P_POD(1),P_FAR(1),P_CSI(1),P_POND(1)] = contingency_table( perssian_des_2010, IMD_des_2010 );
 
%2011
[T_POD(2),T_FAR(2),T_CSI(2),T_POND(2)] = contingency_table( TRMM_des_2011, IMD_des_2011 );
[P_POD(2),P_FAR(2),P_CSI(2),P_POND(2)] = contingency_table( perssian_des_2011, IMD_des_2011 );
 
%2012
[T_POD(3),T_FAR(3),T_CSI(3),T_POND(3)] = contingency_table( TRMM_des_2012, IMD_des_2012 );
[P_POD(3),P_FAR(3),P_CSI(3),P_POND(3)] = contingency_table( perssian_des_2012, IMD_des_2012 );
 
%2013
[T_POD(4),T_FAR(4),T_CSI(4),T_POND(4)] = contingency_table( TRMM_des_2013, IMD_des_2013 );
[P_POD(4),P_FAR(4),P_CSI(4),P_POND(4)] = contingency_table( perssian_des_2013, IMD_des_2013 );
 
%2014
[T_POD(5),T_FAR(5),T_CSI(5),T_POND(5)] = contingency_table( TRMM_des_2014, IMD_des_2014 );
[P_POD(5),P_FAR(5),P_CSI(5),P_POND(5)] = contingency_table( perssian_des_2014, IMD_des_2014 );
 
%2015
[T_POD(6),T_FAR(6),T_CSI(6),T_POND(6)] = contingency_table( TRMM_des_2015, IMD_des_2015 );
[P_POD(6),P_FAR(6),P_CSI(6),P_POND(6)] = contingency_table( perssian_des_2015, IMD_des_2015 );
 
%2016
[T_POD(7),T_FAR(7),T_CSI(7),T_POND(7)] = contingency_table( TRMM_des_2016, IMD_des_2016 );
[P_POD(7),P_FAR(7),P_CSI(7),P_POND(7)] = contingency_table( perssian_des_2016, IMD_des_2016 );
 
%2017
[T_POD(8),T_FAR(8),T_CSI(8),T_POND(8)] = contingency_table( TRMM_des_2017, IMD_des_2017 );
[P_POD(8),P_FAR(8),P_CSI(8),P_POND(8)] = contingency_table( perssian_des_2017, IMD_des_2017 );
 
%2018
[T_POD(9),T_FAR(9),T_CSI(9),T_POND(9)] = contingency_table( TRMM_des_2018, IMD_des_2018 );
[P_POD(9),P_FAR(9),P_CSI(9),P_POND(9)] = contingency_table( perssian_des_2018, IMD_des_2018 );
 
%2019
[T_POD(10),T_FAR(10),T_CSI(10),T_POND(10)] = contingency_table( TRMM_des_2019, IMD_des_2019 );
[P_POD(10),P_FAR(10),P_CSI(10),P_POND(10)] = contingency_table( perssian_des_2019, IMD_des_2019 );




%%ADDITIONAL METRICS EVALUATION
%product,gauge :: time series data taken for all days in year 21x21x365  
 T_Bias=[] ;
 T_RMSE=[]  ;
 T_CC=[] ;
 P_Bias=[] ; 
 P_RMSE=[] ; 
 P_CC=[] ;
 %2010
%2011
[ T_Bias(2), T_RMSE(2), T_CC(2) ] = metrics( TRMM_des_2011,IMD_des_2011 );
[ P_Bias(2), P_RMSE(2), P_CC(2) ] = metrics( perssian_des_2011,IMD_des_2011 );
 
%2012
[ T_Bias(3), T_RMSE(3), T_CC(3) ] = metrics( TRMM_des_2012,IMD_des_2012 );
[ P_Bias(3), P_RMSE(3), P_CC(3) ] = metrics( perssian_des_2012,IMD_des_2012 );
%2013
[ T_Bias(4), T_RMSE(4), T_CC(4) ] = metrics( TRMM_des_2013,IMD_des_2013 );
[ P_Bias(4), P_RMSE(4), P_CC(4) ] = metrics( perssian_des_2013,IMD_des_2013 );
%2014
[ T_Bias(5), T_RMSE(5), T_CC(5) ] = metrics( TRMM_des_2014,IMD_des_2014 );
[ P_Bias(5), P_RMSE(5), P_CC(5) ] = metrics( perssian_des_2014,IMD_des_2014 );
%2015
[ T_Bias(6), T_RMSE(6), T_CC(6) ] = metrics( TRMM_des_2015,IMD_des_2015 );
[ P_Bias(6), P_RMSE(6), P_CC(6) ] = metrics( perssian_des_2015,IMD_des_2015 );
%2016
[ T_Bias(7), T_RMSE(7), T_CC(7) ] = metrics( TRMM_des_2016,IMD_des_2016 );
[ P_Bias(7), P_RMSE(7), P_CC(7) ] = metrics( perssian_des_2016,IMD_des_2016 );
%2017
[ T_Bias(8), T_RMSE(8), T_CC(8) ] = metrics( TRMM_des_2017,IMD_des_2017 );
[ P_Bias(8), P_RMSE(8), P_CC(8) ] = metrics( perssian_des_2017,IMD_des_2017 );
%2018
[ T_Bias(9), T_RMSE(9), T_CC(9) ] = metrics( TRMM_des_2018,IMD_des_2018 );
[ P_Bias(9), P_RMSE(9), P_CC(9) ] = metrics( perssian_des_2018,IMD_des_2018 );
%2019
[ T_Bias(10), T_RMSE(10), T_CC(10) ] = metrics( TRMM_des_2019,IMD_des_2019 );
[ P_Bias(10), P_RMSE(10), P_CC(10) ] = metrics( perssian_des_2019,IMD_des_2019 );




figure,subplot(3,1,1),plot(IMD_precip_2010),title('imd2010');
       subplot(3,1,2),plot(TRMM_precip_2010),title('trmm2010');
       subplot(3,1,3),plot(PER_precip_2010),title('pers2010');
       
figure,subplot(3,1,1),plot(IMD_precip_2011),title('imd2011');
       subplot(3,1,2),plot(TRMM_precip_2011),title('trmm2011');
       subplot(3,1,3),plot(PER_precip_2011),title('pers2011');
figure,subplot(3,1,1),plot(IMD_precip_2012),title('imd2012');
       subplot(3,1,2),plot(TRMM_precip_2012),title('trmm2012');
       subplot(3,1,3),plot(PER_precip_2012),title('pers2012');
figure,subplot(3,1,1),plot(IMD_precip_2013),title('imd2013');
       subplot(3,1,2),plot(TRMM_precip_2013),title('trmm2013');
       subplot(3,1,3),plot(PER_precip_2013),title('pers2013');
       
figure,subplot(3,1,1),plot(IMD_precip_2014),title('imd2014');
       subplot(3,1,2),plot(TRMM_precip_2014),title('trmm2014');
       subplot(3,1,3),plot(PER_precip_2014),title('pers2014');
figure,subplot(3,1,1),plot(IMD_precip_2015),title('imd2015');
       subplot(3,1,2),plot(TRMM_precip_2015),title('trmm2015');
       subplot(3,1,3),plot(PER_precip_2015),title('pers2015');

figure,subplot(3,1,1),plot(IMD_precip_2016),title('imd2016');
       subplot(3,1,2),plot(TRMM_precip_2016),title('trmm2016');
       subplot(3,1,3),plot(PER_precip_2016),title('pers2016');
figure,subplot(3,1,1),plot(IMD_precip_2017),title('imd2017');
       subplot(3,1,2),plot(TRMM_precip_2017),title('trmm2017');
       subplot(3,1,3),plot(PER_precip_2017),title('pers2017');
       
figure,subplot(3,1,1),plot(IMD_precip_2018),title('imd2018');
       subplot(3,1,2),plot(TRMM_precip_2018),title('trmm2018');
       subplot(3,1,3),plot(PER_precip_2018),title('pers2018');
figure,subplot(3,1,1),plot(IMD_precip_2019),title('imd2019');
       subplot(3,1,2),plot(TRMM_precip_2019),title('trmm2019');
       subplot(3,1,3),plot(PER_precip_2019),title('pers2019');
       
       
       
%% sw avg
sw_avg1(1) = sw_avg_rain_fall( IMD_precip_2010 );
sw_avg1(2) = sw_avg_rain_fall( IMD_precip_2011 );
sw_avg1(3) = sw_avg_rain_fall( IMD_precip_2012 );
sw_avg1(4) = sw_avg_rain_fall( IMD_precip_2013 );
sw_avg1(5) = sw_avg_rain_fall( IMD_precip_2014 );
sw_avg1(6) = sw_avg_rain_fall( IMD_precip_2015 );
sw_avg1(7) = sw_avg_rain_fall( IMD_precip_2016 );
sw_avg1(8) = sw_avg_rain_fall( IMD_precip_2017 );
sw_avg1(9) = sw_avg_rain_fall( IMD_precip_2018 );
sw_avg1(10)= sw_avg_rain_fall( IMD_precip_2019 );
 

sw_avg2(1) = sw_avg_rain_fall( PER_precip_2010 );
sw_avg2(2) = sw_avg_rain_fall( PER_precip_2011 );
sw_avg2(3) = sw_avg_rain_fall( PER_precip_2012 );
sw_avg2(4) = sw_avg_rain_fall( PER_precip_2013 );
sw_avg2(5) = sw_avg_rain_fall( PER_precip_2014 );
sw_avg2(6) = sw_avg_rain_fall( PER_precip_2015 );
sw_avg2(7) = sw_avg_rain_fall( PER_precip_2016 );
sw_avg2(8) = sw_avg_rain_fall( PER_precip_2017 );
sw_avg2(9) = sw_avg_rain_fall( PER_precip_2018 );
sw_avg2(10) =sw_avg_rain_fall( PER_precip_2019 );
 
 
sw_avg3(1) = sw_avg_rain_fall( TRMM_precip_2010 );
sw_avg3(2) = sw_avg_rain_fall( TRMM_precip_2011 );
sw_avg3(3) = sw_avg_rain_fall( TRMM_precip_2012 );
sw_avg3(4) = sw_avg_rain_fall( TRMM_precip_2013 );
sw_avg3(5) = sw_avg_rain_fall( TRMM_precip_2014 );
sw_avg3(6) = sw_avg_rain_fall( TRMM_precip_2015 );
sw_avg3(7) = sw_avg_rain_fall( TRMM_precip_2016 );
sw_avg3(8) = sw_avg_rain_fall( TRMM_precip_2017 );
sw_avg3(9) = sw_avg_rain_fall( TRMM_precip_2018 );
sw_avg3(10) =sw_avg_rain_fall( TRMM_precip_2019 );




%% ne avg
ne_avg1(1) = ne_avg_rain_fall( IMD_precip_2010 );
ne_avg1(2) = ne_avg_rain_fall( IMD_precip_2011 );
ne_avg1(3) = ne_avg_rain_fall( IMD_precip_2012 );
ne_avg1(4) = ne_avg_rain_fall( IMD_precip_2013 );
ne_avg1(5) = ne_avg_rain_fall( IMD_precip_2014 );
ne_avg1(6) = ne_avg_rain_fall( IMD_precip_2015 );
ne_avg1(7) = ne_avg_rain_fall( IMD_precip_2016 );
ne_avg1(8) = ne_avg_rain_fall( IMD_precip_2017 );
ne_avg1(9) = ne_avg_rain_fall( IMD_precip_2018 );
ne_avg1(10) = ne_avg_rain_fall( IMD_precip_2019 );
 
 
ne_avg2(1) = ne_avg_rain_fall( PER_precip_2010 );
ne_avg2(2) = ne_avg_rain_fall( PER_precip_2011 );
ne_avg2(3) = ne_avg_rain_fall( PER_precip_2012 );
ne_avg2(4) = ne_avg_rain_fall( PER_precip_2013 );
ne_avg2(5) = ne_avg_rain_fall( PER_precip_2014 );
ne_avg2(6) = ne_avg_rain_fall( PER_precip_2015 );
ne_avg2(7) = ne_avg_rain_fall( PER_precip_2016 );
ne_avg2(8) = ne_avg_rain_fall( PER_precip_2017 );
ne_avg2(9) = ne_avg_rain_fall( PER_precip_2018 );
ne_avg2(10) = ne_avg_rain_fall( PER_precip_2019 );
 
 
ne_avg3(1) = ne_avg_rain_fall( TRMM_precip_2010 );
ne_avg3(2) = ne_avg_rain_fall( TRMM_precip_2011 );
ne_avg3(3) = ne_avg_rain_fall( TRMM_precip_2012 );
ne_avg3(4) = ne_avg_rain_fall( TRMM_precip_2013 );
ne_avg3(5) = ne_avg_rain_fall( TRMM_precip_2014 );
ne_avg3(6) = ne_avg_rain_fall( TRMM_precip_2015 );
ne_avg3(7) = ne_avg_rain_fall( TRMM_precip_2016 );
ne_avg3(8) = ne_avg_rain_fall( TRMM_precip_2017 );
ne_avg3(9) = ne_avg_rain_fall( TRMM_precip_2018 );
ne_avg3(10) = ne_avg_rain_fall( TRMM_precip_2019 );

 

%% annual average
avg1(1) = year_avg_rain_fall( IMD_precip_2010 );
avg1(2) = year_avg_rain_fall( IMD_precip_2011 );
avg1(3) = year_avg_rain_fall( IMD_precip_2012 );
avg1(4) = year_avg_rain_fall( IMD_precip_2013 );
avg1(5) = year_avg_rain_fall( IMD_precip_2014 );
avg1(6) = year_avg_rain_fall( IMD_precip_2015 );
avg1(7) = year_avg_rain_fall( IMD_precip_2016 );
avg1(8) = year_avg_rain_fall( IMD_precip_2017 );
avg1(9) = year_avg_rain_fall( IMD_precip_2018 );
avg1(10) = year_avg_rain_fall( IMD_precip_2019 );
 
 
avg2(1) = year_avg_rain_fall( PER_precip_2010 );
avg2(2) = year_avg_rain_fall( PER_precip_2011 );
avg2(3) = year_avg_rain_fall( PER_precip_2012 );
avg2(4) = year_avg_rain_fall( PER_precip_2013 );
avg2(5) = year_avg_rain_fall( PER_precip_2014 );
avg2(6) = year_avg_rain_fall( PER_precip_2015 );
avg2(7) = year_avg_rain_fall( PER_precip_2016 );
avg2(8) = year_avg_rain_fall( PER_precip_2017 );
avg2(9) = year_avg_rain_fall( PER_precip_2018 );
avg2(10) = year_avg_rain_fall( PER_precip_2019 );
 
 
avg3(1) = year_avg_rain_fall( TRMM_precip_2010 );
avg3(2) = year_avg_rain_fall( TRMM_precip_2011 );
avg3(3) = year_avg_rain_fall( TRMM_precip_2012 );
avg3(4) = year_avg_rain_fall( TRMM_precip_2013 );
avg3(5) = year_avg_rain_fall( TRMM_precip_2014 );
avg3(6) = year_avg_rain_fall( TRMM_precip_2015 );
avg3(7) = year_avg_rain_fall( TRMM_precip_2016 );
avg3(8) = year_avg_rain_fall( TRMM_precip_2017 );
avg3(9) = year_avg_rain_fall( TRMM_precip_2018 );
avg3(10) = year_avg_rain_fall( TRMM_precip_2019 );



%% plot
x = [2010,2010,2010;2011,2011,2011;2012,2012,2012;2013,2013,2013;2014,2014,2014;2015,2015,2015;2016,2016,2016;2017,2017,2017;2018,2018,2018;2019,2019,2019];
figure
y = [sw_avg1;sw_avg2;sw_avg3];
b=bar(x,y'),title('south west monsoon time'),legend('IMD','PERSIAN','TRMM');
figure
y = [ne_avg1;ne_avg2;ne_avg3];
b=bar(x,y'),title('north monsoon time'),legend('IMD','PERSIAN','TRMM');
figure
y = [avg1;avg2;avg3];
b=bar(x,y'),title('total year wise avg rain fall'),legend('IMD','PERSIAN','TRMM');
