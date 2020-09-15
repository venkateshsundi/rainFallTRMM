function output = year_avg_rain_fall( input )

a = input(1:364);
b = sum(a);
output = b/365;
end


