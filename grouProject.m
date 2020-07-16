%groupProject
clc; clear; close all;
Fs = 48000;
[IR] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0,0,0,0,0,0,0,0,0,0].';
audiowrite('IR.wav',IR,Fs);