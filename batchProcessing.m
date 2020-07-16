%batchProcessing.m
clc; clear; close all;
[x, Fs] = audioread('originalAudio.wav');

%time elements
Ts = (1/Fs);
t = [0:Ts:1].';

%use loop go remove noise
N = length(x);
y = 0;
wave = 0;
noise = 0;
temp = 0;
    
for n = 1:N
    temp = Fs*1.5;
    
    %go through 1.5 seconds and store that in noise
    noise = x(n:(1.5/temp));
    
    %go through one more second and store that in wave
    wave = wave + x(1.5/temp: temp);
    
    

end 

%combine wave values
sound(wave, Fs);

%save
audiowrite(batchAudio);

%couldn't get it to work, don't know why.