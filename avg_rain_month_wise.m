function [ june,july,aug,sep,oct,nov,dec ] = avg_rain_month_wise( input )
june = sum(input(152:181))/30;
july = sum(input(182:212))/31;
aug = sum(input(213:243))/31;
sep = sum(input(244:273))/30;
oct = sum(input(274:304))/31;
nov = sum(input(305:334))/30;
dec = sum(input(335:365))/31;

end

