%basicFilters.m

%impulse
h_lpf = [1 1];
h_hpf = [1 -1];
h_notch = [1 0 1];
h_bpf = [1 0 -1];

[x,Fs] = audioread('AcGtr.wav');

%changing relative amp of delay path
%freqz([1 0 1]); figure;

%moving average filter
h_1st = [1 1] / 2;
h_2nd = [1 1 1] / 3;
h_3rd = [1 1 1 1] / 4;

% n is filter order (max num of delay samples)
%Wn is normalized frequency (f/Nyq)
n = 200;
f = 1000;
Wn = f/24000;
h = fir1(n,Wn);
freqz(h);