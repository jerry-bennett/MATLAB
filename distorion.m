%distortion.m
clc; clear; close all;
%input sine wave
Fs = 48000;
Ts = 1/Fs;
f = 2;
t = [0:Ts:1].';
x = sin(2*pi*f*t);
%[x,Fs] = audioread('AcGtr.wav');

%distortion effect
N = length(x);
%infinite clipping
for n = 1:N
    
    if(x(n,1) >= 0)
        y(n,1) =1;
    else
        y(n,1) = -1;
    end
    
end

%full wave rectification
for n = 1:N
    
    if(x(n,1) >= 0)
        q(n,1) = x(n,1);
    else
        q(n,1) = -1*x(n,1);
    end
    
end

%half-wave recification
for n = 1:N
    
    if(x(n,1) >= 0)
        z(n,1) = x(n,1);
    else
        z(n,1) = 0;
    end
    
end

%analyze output
plot(q);
%sound(q, Fs);
%thd(q,Fs);