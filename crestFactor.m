%Jerry Bennett

%crestFactor
clc; clear; close all;
sig = audioread('quiz2.wav');

N = length(sig);

%calculate peak amp
maxAmp = 0;
for n = 1:N
    %go through the signal one sample at a time
    %find absolute value of each signal
    temp = abs(sig(n,1));
    
    %compare
    if (temp > maxAmp)
        
        maxAmp = temp;
        
    end 
    
end

%calculate rms
%find signal energy with loop
E = 0;
for n = 1:N
    E = E + (abs(sig(n,1))^2);
end 
%calculate power
power = E/N;

%calculate rms
Arms = sqrt(power);

%calculate crest factor
crest = maxAmp/Arms;

%convert to dB
crestdB = 20*log(maxAmp) - 20*log10(Arms/0.707)