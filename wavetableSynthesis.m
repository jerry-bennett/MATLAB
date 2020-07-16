%wavetableSynthesis.m
clc; clear; close all;
%import
[x, Fs] = audioread('wavetable.wav');
Ts = 1/Fs;
%sample signal with itself 100 times
z = 0;
out = 0;
while z < 100
    
    out =+ [out;x];
    
    z = z+1;
end

%audiowrite('wavetable100Hz.wav',out,Fs);

%index every other sample for 1 second
out2 = out(1:2:end);
out3 = [out2; out2];

%audiowrite('wavetable200Hz.wav',out3,Fs);