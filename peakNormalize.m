%peakNormalize.m
clc; clear; close all;
[x,Fs] = audioread('AcGtr.wav');

%determine audio peak

%Ap = max(abs(x));

N = length(x);

%initialize max amp
maxAmp = 0;

%search through all samples for the max amp
for n = 1:N
    %go through the signal one sample at a time
    %find absolute value of each signal
    temp = abs(x(n,1));
    
    %compare
    if (temp > maxAmp)
        
        maxAmp = temp;
        
    end 
    
end

%desired level in dB
dBAmp = -6;
linAmp = 10 ^ (dBAmp/20);

%find scaler to normalize
g = linAmp/maxAmp;

%scale
y = g * x;

%equvialent
y = x/max(abs(x));

%test
plot(y);
max(abs(y));