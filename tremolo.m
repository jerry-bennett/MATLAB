%tremolo.m
clc; clear; close all;
%input (carrier) signal
[x,Fs] = audioread('AcGtr.wav');
N = length(x);
Ts = 1/Fs;

%depth parameter
depth = 0.5;
g = depth/2;
mu = 1 - g;

%modulator (LFO)
f = 3; %frequency in Hz
t = [0:N-1].' * Ts; %make sine wave as long as sample
w = g * 0.5 * sin(2*pi*f*t) + mu ; %sine wave between 0 and 1

%without loop
y = x .* w;

%with loop
for n = 1:N
    
    y(n,1) = x(n,1) * w(n,1);
    
end 

plot(y);