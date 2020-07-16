%troubleshoot
clc; clear; close all;

Fs = 48000;
Ts = (1/Fs);

t = [0:Ts:1].';%hmmm

f1 = 440;
f2 = 880; 

N = length(t);
left = zeros(N,1);
right = zeros(N,1);
for n = 1:N
    left(n,1) = sin(2*pi*f1* t(n,1));
    right(n,1) = sawtooth(2*pi*f2*t(n,1));
end

stereoSignal = [left, right];
plot(stereoSignal);
sound(stereoSignal, Fs);

