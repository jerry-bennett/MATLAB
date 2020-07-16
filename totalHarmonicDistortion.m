% totalHarmonicDistortion.m

% signal to simulate distortion
% "infinite" clipping - maximum level it can be
Fs = 48000;
Ts = 1/Fs;
f = 2500;
t = [0:Ts:1].';

x = square(2*pi*f*t);

thd(x,Fs);