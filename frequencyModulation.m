%frequencyModulation.m
clc; clear; close all;

Fs = 48000;
Ts = 1/Fs;

numOfSec = 6;
numOfSamples = numOfSec * Fs;

f1 = 440; 
f2 = 110;
A = 0.5;
phi = pi; % 180 degree offset

t = [0:numOfSamples-1].' * Ts;


%transition linearly for the first 2 seconds
%sawtooth
t1 = 2 * Fs;
t2 = [0:t1].' * Ts;
f3 = linspace(f1, f2, length(t2));
phase_in = cumsum(f3/Fs);
y = A * sawtooth(2*pi*phase_in, 0);

%depth
depth = 1;
g = depth/2;
mu = 1 - g;

%lfo for 3rd second

f = 2; %frequency in Hz
t3 = [0:48000-1].' * Ts; %time period for 3rd second
w = g * 0.5 * sin(2*pi*f*t) + mu ; %sine wave between 0 and 1
f4 = 90;
[f5] = cumsum(f4 * [w].'); % this was the best I could do.
%z = A * sawtooth(2*pi*f5*t3, 0); 
% i think this is right but it's too large to render

while f4 < 130
    f4 = f4+1;
    
    % i tried to modulate frequency with lfo in while loop but i couldn't
    % get it to work.
    
end

sound(y, Fs);
% i was only able to get the first two seconds of linear transition
% really don't understand how to modulate frequency with LFO