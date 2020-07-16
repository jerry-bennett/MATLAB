%envelopeModulation.m
clc; clear; close all;

[vocal,Fs] = audioread('Voice.wav');
[synth] = audioread('Synth.wav');

%vocal and synth must be same number of samples

%extract envelope from vocals
vAbs = abs(vocal);
plot(vAbs);

%low pass to extract envelope
alpha = 0.999;
b = [1-alpha];
a = [1, -alpha];

freqz(b,a);

env = filter(b,a,vAbs);

%bring up amplitude
env = env * 2;

%modulate the sunth with the env
y = synth .* env;
sound(y,Fs);