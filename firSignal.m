%firSignal
clc; clear;
[x,Fs] = audioread('AcGtr.wav');
Nyq = Fs/2;

n = 30; %filter order

freqHz = 500;
Wn = freqHz/Nyq;

[ h ] = fir1(n,Wn);

%h is the impulse response of the filter

%apply filter to signal
y = conv(x,h);

freqz(y);

sound(y,Fs);
