% measuresOfAmplitude.m

% This script demonstrates three
% different ways to measure the amplitude
% of a signal.
clc;clear; close all;

% Input signal
[x,Fs] = audioread('sw20Hz.wav');
%plot(abs(x));

% Peak amplitude
peak = max(abs(x));

% Peak-to-peak amplitude
peakToPeak = max(x) - min(x);


% Signal Energy
E = sum(x.^2);

% Without these functions
N = length(x);

s = 0;
for n = 1:N
    
    s = s + x(n,1)^2;

end

% Average Power
P = E/N;

% RMS
Arms = sqrt(P);




