%signalSynthesis.m

clc; clear; close all;

Fs = 48000;
Ts = 1/Fs;

numOfSec = 3;
numOfSamples = numOfSec * Fs;

f = 100; 
A = 0.5;
phi = pi; % 180 degree offset

% for n = 1:numOfSamples
%     
%     %convert sample number to units of seconds
%     t = (n-1) * Ts;
%     
%     %equation for synthesis
%     out(n,1) = A * sin(2*pi*f*t + phi);
%     
% end

%same thing without a loop (use array for t)

t = [0:numOfSamples-1].' * Ts;
out = A * sin(2 * pi * f * t + phi);


%compare sin and cos
sig1 = A * sin(2*pi*f*t);
sig2 = A * cos(2*pi*f*t);
%plot(t,sig1,t,sig2);

%other functions for synthesis
%SQUARE
sq = A * square(2*pi*f*t, 10);
%plottf(sq,Fs);

%sawtooth
saw = A * sawtooth(2*pi*f*t, 0);
%plottf(saw,Fs);

%triangle
tri = A * sawtooth(2*pi*f*t, 0.5);
%plottf(tri, Fs);

%white noise
noise = randn(numOfSamples,1);
%plottf(noise,Fs);



%instantaneous phase
%sine wave
phi = 0; %start at 0 radians at the beginning of the signal

f = 5;
phaseChangePerSample = f * Ts * 2 * pi;


for n = 1:numOfSamples
    
   out(n,1) = sin(phi); 
   %use current phase and add on a small phase shift
   phi = phi + phaseChangePerSample; 
   
   %wrap phase around a range of 0 - 2pi
   if (phi >= 2*pi)
       phi = phi - 2*pi;
   end
   
   %set up a point wehre we switch frequencies
   if (n > 55632)
       f = 10;
       phaseChangerPerSample = f * Ts * 2 * pi;
           
   end 
   
end

%plot(out);

%square wave using instantaneous phase
phi = 0; %start at 0 radians at the beginning of the signal

f = 5;
phaseChangePerSample = f * Ts * 2 * pi;

duty = 0.5; %duty goes from 0-1
for n = 1:numOfSamples
    
    %use current phase angle to determine amplitude
    if (phi < pi* duty * 2)
        out(n,1) = 1;
    else
        out(n,1) = -1;
    end
    %use current phase and add on a small phase shift
    phi = phi + phaseChangePerSample; 
    
    %wrap phase around a range of 0 - 2pi
    if (phi >= 2*pi)
       phi = phi - 2*pi;
    end
end

%plottf(out, Fs);

%impulse train
Fs = 48000;
f = 5; %frequency in hz (# of cycles per second)
tau = Fs / f; %period in samples

out = zeros(numOfSamples, 1);

out(1:tau:end,1) = 1;

plottf(out, Fs);

%additive synthesis
%add together sine waves to create a square wave

f= 1000;
%number of harmonics below nyquist
M = floor(Fs/(2*f));

out = zeros(numOfSamples,1);
t = [0:numOfSamples-1].' * Ts;
for m = 1:2:M
    
    out = out + (1/m) *sin(2*pi*f*m*t);
    
end 

%at the end scale the output
out = (4/pi) * out;

plottf(out, Fs);