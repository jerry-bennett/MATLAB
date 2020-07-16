%midSideProcessing.m
clc; clear; close all;

[x, Fs] = audioread('stereoDrums.wav');

L = x(:,1); %all the rows in the 1st column
R = x(:,2); %all the rows in the 2nd column

%mid-side encoding
S = (L-R) * 0.5;
M = (L+R) * 0.5;

%processing
w = 1; %range betqween 0 and 2
newS = w * S;
newM = (2-w) * M;

%decoding
newL = newM + newS;
newR = newM - newS;

y = [newL, newR]; %combine

plottf(y,Fs);
sound(y,Fs);