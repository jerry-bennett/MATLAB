%parallelDist.m

clc; clear; close all;

%sig1nal to distort
Fs = 48000;
Ts = 1/Fs;

numOfSec = 3;
numOfSamples = numOfSec * Fs;

f = 100; 
A = 0.5;
phi = pi; % 180 degree offset

t = [0:numOfSamples-1].' * Ts;
sig = A * sin(2 * pi * f * t);

%create file
%audiowrite('sig1nal.wav', sig1, Fs);

%read file
[sig1,Fs] = audioread('signal.wav');

%gain variables
g1 = 0.5;
g2 = 0.7;
g3 = 1;

%parallel distortion using arctan distortion
N = length(sig1);
for n = 1:N

    y(n,1) = (2/pi) * atan(sig1(n,1) * 10);

end

%full wave rectification
for n = 1:N
    
    if(sig1(n,1) >= 0)
        q(n,1) = sig1(n,1);
    else
        q(n,1) = -1*sig1(n,1);
    end
    
end


%dry sig1nal
z = sig1 * g3;

%scale gain
y1 = y * g1;
q1 = q * g2;

final = z+q1+y1;

plot(final); hold on;
sound(final, Fs);

%plot(sig1); hold on;
%plot(q); hold on;
%plot(y);
%combine sig1nals