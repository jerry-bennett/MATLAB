function [out] = hardClipping(in,drive)

in = drive * in;

N = length(in);
out = zeros(N,1);
thresh = 0.4;

for n = 1:N
    
    if(in(n,1) > thresh)
        out(n,1) = thresh;
    elseif (in(n,1) < -thresh)
        out(n,1) = -thresh;
    else
        out(n,1) = in(n,1);
    end
    
end