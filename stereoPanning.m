%stereoPanning.m

clc; clear; close all;

[in, Fs] = audioread('AcGtr.wav');

%scale from -100 to +100
pan = -100;

%normalized panning value
x = (1/200) * pan + 0.5;

%LINEAR PANNING

%right side
%aR = x;

%left side
%aL = 1-x;

%scale input signal and copy into 2 column matrix
out = [aL * in, aR * in];

%SQUARE LAW PANNING (more common)
aR = sqrt(x);
aL = sqrt(1-x);