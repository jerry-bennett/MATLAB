%vocalTest
clc; clear;
%import audio signal
[x,Fs] = audioread('Vocal.wav');

%parameters
Fs = 48000;
f = 500; %due the the slope of the filter, this cuts around 80
T = -70;
R = 4;
outGain = 50;
reverbLength = 1;

vocalChain(x,Fs,f,T,R,outGain,reverbLength);