function output = sw_avg_rain_fall( input )
a = input(152:273);
b = sum(a);
output = b/121;
end

