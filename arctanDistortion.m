function [y] = arctanDistortion(x,drive)

N = length(x);
for n = 1:N

    y(n,1) = (2/pi) * atan(x(n,1) * drive);

end