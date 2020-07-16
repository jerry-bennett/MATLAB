%sineWaveSignal.m

clc; clear; close all;

%create an array going through a cycle every 0.01, going from 0-10
%the .' is to make it vertical
n = [0:0.01:10].';

%frequency
f = 5;

%one cycle every 2pi radians
x = sin(n);

%one cycle every 1 unit of time
y = sin(2*pi*n);

%5 cycles per 1 unit of time
z = (sin(2*pi*f*n));

plot(n, z);