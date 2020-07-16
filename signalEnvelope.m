%signalEnvelope.m

%input signal
[x,Fs] = audioread('AcGtr.wav');

% envelope is strictly positive
xAbs = abs(x);

%LPFIIR
alpha = 0.99;
b = (1-alpha);
a = [1, -alpha];
freqz(b,a);