%nullTest
clc; clear close all;

%pro tools audio files
Fs = 48000;
[OneBand] = audioread('1-Band EQ_Vocals.wav');
[SevenBand] = audioread('7-Band EQ_Vocals.wav');
[MedDelay] = audioread('MediumDelay_Vocals.wav');
[DVerb] = audioread('DVerb_Vocals.wav');

%matlab created audio files
[oneBand] = audioread('OneBandEQVocals.wav');
[sevenBand] = audioread('SevenBandEQVocals.wav');
[medDelay] = audioread('MediumDelayVocals.wav');
[dVerb] = audioread('D-VerbVocals.wav');

%make same length
% Find out the length of the shorter matrix
minLength = min(length(DVerb), length(dVerb));

% Removes any extra elements from the longer matrix
A = DVerb(1:minLength).';
B = dVerb(1:minLength);

null = A - B;
%screenshots
plot(null);
title('D-Verb');
plot(DVerb);