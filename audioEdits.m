% audioEdits.m Jerry Bennett
clc; clear; close all;
%edit the signal from audio1.wav

%import signal, assign to array and get sample rate
[x, Fs] = audioread('soundFile1.wav');
plot(x);
%sound(x, Fs);

%index first part of signal
N = length(x);

%individual words
one = x(1:42690);
two = x(42690:82780);
three = x(82780:130100);
four = x(130100:171000);
five = x(171000:N);

%reversal
oneRev = one(end:-1:1);
twoRev = two(end:-1:1);
threeRev = three(end:-1:1);
fourRev = four(end:-1:1);
fiveRev = five(end:-1:1);

%combine
total = [oneRev; twoRev; threeRev; fourRev; fiveRev];

%save file
audiowrite('audioEdits.wav', total, Fs);