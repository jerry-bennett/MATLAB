function [out] = transistorClipping(in, thresh)

%transistorClipping.m


drive = 2;
in = drive * in;


N = length(in);
out = zeros(N,1);

slope = 0.00001;
thresh = 0.2;
    
thresh2 = thresh;
thresh3 = -thresh;

%test loop
for n = 1:N
    
    if(in(n,1) > thresh2)
        thresh2 = thresh2 - slope;
        out(n,1) = thresh2;
        
    elseif(in(n,1) < thresh3)
        thresh3 = thresh3 + slope;
        out(n,1) = thresh3;
        
    else 
        out(n,1) = in(n,1);
        thresh2 = thresh;
        thresh3 = -thresh;
        
    end
    
end
%here