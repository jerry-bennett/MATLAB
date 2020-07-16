%msDistortion.m
clc; clear; close all;

[x, Fs] = audioread('stereoDrums.wav');

%seperate left and right
L = x(:,1); %all the rows in the 1st column
R = x(:,2); %all the rows in the 2nd column

%mid-side encoding
S = (L-R) * 0.5;
M = (L+R) * 0.5;

%hard clipping on mid channel
M2 = hardClipping(x, 5);

%decoding
newL = M2 + S;
newR = M2 - S;

%combine signals to stereo signal
y = [newL, newR];

audiowrite('distDrums.wav', y, Fs);
