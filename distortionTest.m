%distortionTest.m
clc; clear; close all;
%test distortion functions

%input signal
Fs = 48000;
Ts = 1/Fs;
f = 2;
t = [0:Ts:1].';
x = sin(2*pi*f*t);

%distortion function

%hard clipping variables
drive = 10; %between 0.1 and 1
%y = hardClipping(x, drive);

%soft clipping
%y = cubicDistortion(x, drive);

%arctan distortion
y = arctanDistortion(x,drive);

%bit crushing for dither

numBits = 8;
%add noise ahead of time
n = 0.004 * randn(length(x),1); %noise for dither
%y = bitCrushing(x+n,numBits);

%testing
thd(y,Fs);
%figure;
%plot(t,x,t,y);
%characteristic curve
%figure;
%plot(x,x,x,y);
plot(y);
