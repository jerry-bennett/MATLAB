%ringModulation.m
clc; clear; close all;
%[x,Fs] = audioread('AcGtr.wav');
Fs = 48000;
Ts = 1/Fs;
%N = length(x);

%carrier
f1 = 1000;
t = [0:Ts:1].';
x = sin(2*pi*f1*t);

%modulator 1
f2 = 100; 
w = sin(2*pi*f2*t);

%modulator 2
f3 = 300;
w2 = sin(2*pi*f3*t);

y = (x .* w) .* w2 ;

plottf(y,Fs);