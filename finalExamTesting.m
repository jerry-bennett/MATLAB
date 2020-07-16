%finalExamTesting

clc; clear; close all;

Fs = 48000;
Ts = 1/Fs;

numOfSec = 3;
numOfSamples = numOfSec * Fs;

f = 100; 
A = 0.5;
phi = pi; % 180 degree offset

t = [0:numOfSamples-1].' * Ts;
x = A * sin(2 * pi * f * t + phi);

N = length(x);

for n = 1:N
    
    y(n,1) = (0.6625) * x(n,1) + (-0.6625) * (x(n,1)-2)