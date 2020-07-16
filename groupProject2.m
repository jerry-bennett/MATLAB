% Project1 Christian Augello Jerry Bennett
clear; clc;

Fs = 48000;

% importing audio files
[vox] = audioread('Vocal.wav');
[OneBandEQ,Fs] = audioread('1-Band EQ.wav');
[SevenBandEQ,Fs] = audioread('7-Band EQ.wav');
[MedDelay,Fs] = audioread('Medium Delay.wav');
[DVerb,Fs] = audioread('D-Verb.wav');

% convolving test signals 
OneBandVox = conv2(vox,OneBandEQ);
SevenBandVox = conv2(vox,SevenBandEQ);
MedDelayVox = conv2(vox,MedDelay);
DVerbVox = conv2(vox,DVerb);

% listen to results
%{
sound(OneBandVox,Fs);
sound(SevenBandVox,Fs);
sound(MedDelayVox,Fs);
sound(DVerbVox,Fs);
%}

% Plotting for screenshots
%freqz();
%title('');
%plot();
%title('');

% write new files
audiowrite('OneBandEQVocals.wav',OneBandVox,Fs);
audiowrite('SevenBandEQVocals.wav',SevenBandVox,Fs);
audiowrite('MediumDelayVocals.wav',MedDelayVox,Fs);
audiowrite('D-VerbVocals.wav',DVerbVox,Fs);
