function [y] = cubicDistortion(x, drive)

%soft clipping
N = length(x);

for n = 1:N
    
    y(n,1) = x(n,1) - (drive/3) * x(n,1)^3;
    
end 
