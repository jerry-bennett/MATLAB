%firFilters.m
Fs = 48000;
Nyq = Fs/2;


%first function
n = 200; %order = max # of delay samples

%FIR2 - arbitrary frequency response
N = 20;
F = [0 0.1 0.3 0.5 0.65 0.75 1];
A = [2 2 1 1 0.5 1 1];
h = fir2(N,F,A);

f = [500 1500];
Wn = f./Nyq;%normalized cutoff frequency
%ratio of frequency related to nyquist
%depends on sampling rate

%h = fir1(n,Wn); %returns IR

[H,W] = freqz(h,1,2048,Fs); %visualize frequency response

%same syntax as plot, but makes x axis logrithmic
semilogx(W,20*log10(abs(H)));
xlabel('Freq(Hz)'); ylabel('Amp(dB)');
axis([20 20000 -60 10]);

