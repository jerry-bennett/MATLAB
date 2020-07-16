%finalExam.m
close all; clear sound;
clear; clc;


% Test signal used for coding problem
[x,Fs] = audioread('Vocal.wav');

reverbLength = 2 ; % seconds


[y] = noiseVerb(x,Fs,reverbLength);

% Playback sound of processed output signal
sound(y, Fs);