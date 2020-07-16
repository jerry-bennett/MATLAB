% gainChange.m
clc; clear; close all;
% This script demonstrates how to change the
% gain of an audio signal


% Import audio signal

filename = 'sw20Hz.wav';
%filename = 'sw440Hz.wav';

[in,Fs] = audioread(filename);

Ts = 1/Fs; % sampling period, units seconds/1sample

%plot(in);
%sound(in,Fs);

% Total number of samples in the signal
N = length(in);

% Change the amplitude of the input signal
for n = 1:N
    
    % "n" is a counting variable
    
    % go through each sample of input signal, one-by-one
    out(n,1) = in(n,1) * 0.5;
    
    
end

% Equivalent command
%out = in * 0.5;

% Time vector for horizontal axis
t = [0:N-1].'*Ts;


plot(t,in); 
hold on;
plot(t,out);
hold off;
legend('Input','Output');
xlabel('Time (sec)');
ylabel('Amplitude');
title('Waveform');


%sound([in;out],Fs)


