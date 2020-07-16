%firExamples
clc; clear; close all;
%initial parameters
n = 12;
f = 6000;
Fs = 48000;
nyq = Fs/2;
Wn = f/nyq;

%lowpass
h_lpf = fir1(n,Wn);

%highpass
h_hpf = fir1(n,Wn,'high');

%declare new variables for BP and BS
f2 = 18000;
Wn2 = f2/nyq;

%bandpass
h_bpf = fir1(n,[Wn Wn2]);

%band-stop (like notch)
h_bsf = fir1(n,[Wn Wn2],'stop');

freqz(h_bsf);