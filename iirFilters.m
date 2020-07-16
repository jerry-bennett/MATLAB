%iirFilters.m

%basic examples
b = [1]; %dry path, no feedforward

a1 = 0;
a2 = -0.8;
a = [1, -a1, -a2];

%apply iir filter to noise

Fs = 48000;
x = 0.2*randn(Fs,1);

y = filter(b,a,x);

plot(y);

%built in matlab funtions
n = 4;
Wn = 0.25;
[b,a] = butter(n,Wn,'high');

%{
%using the biquad filter
x = [1; zeros(47999,1)];
y = biquadFilter(x,Fs,5000,0.7071,4,0,'lpf');

freqz(y);
%}