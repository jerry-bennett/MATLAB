function [out] = halfwaveRectify(in)

%in - mono signal, unprocessed
%out - mono signal, processed version

N = length(in);
out = zeros(N,1);

for n = 1:N
    
    if(in(n,1) >= 0)
        out(n,1) = in(n,1);
    else
        out(n,1) = 0;
    end
end