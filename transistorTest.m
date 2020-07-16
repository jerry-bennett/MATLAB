%transistorTest
clc; clear; close all;
[in,Fs] = audioread('BassDI.wav');

y = transistorClipping(in, 0.5);

plot(in); hold on;
plot(y);
sound(y,Fs);