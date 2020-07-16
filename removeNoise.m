%removeNoise.m Jerry Bennett
clc; clear; close all;

%import
[sig1, Fs] = audioread('audio1.wav');
[sig2, Fs] = audioread('audio2.wav');
[sig3, Fs] = audioread('audio3.wav');

[noise1, Fs] = audioread('noise1.wav');
[noise2, Fs] = audioread('noise2.wav');
[noise3, Fs] = audioread('noise3.wav');

%combine
sig1Comb = [sig1; sig2];
sig2Comb = [sig2; sig3];

noise1Comb = [noise1; noise2];
noise2Comb = [noise2; noise3];

%subtract arrays
remove1 = sig1Comb - noise1Comb;
remove2 = sig2Comb - noise2Comb;

%store subtracted arrays to new array
newAudio = [remove1; remove2];

%save file
audiowrite('newAudio.wav', newAudio, Fs);