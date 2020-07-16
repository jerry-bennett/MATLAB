%fir2Examples

%parameters
n = 30;
frq = [0, 0.2, 0.5 0.8, 1];
amps = [2, 4, 0.25, 2, 1];

h = fir2(n,frq,amps);

freqz(h);