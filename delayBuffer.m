%delayBuffer.m

clear; clc; close all;

%example signal
x = [1; .9; .8; .7; .6; .5; .4];

delay = [0; 0; 0; 0];

N = length(x);
for n = 1:N
    
    %series
    y(n,1) = delay(end,1);
    delay(4,1) = delay(3,1);
    delay(3,1) = delay(2,1);
    delay(2,1) = delay(1,1);
    delay(1,1) = x(n,1);
end

%example with audio
[x, Fs] = audioread('AcGtr.wav');

delay = zeros(0.5*Fs,1);
N = length(x);

%series delay
%{
for n = 1:N
    
    y(n,1) = delay(end,1);
    
    %shift entire buffer down
    delay = [ x(n,1) ; delay(1:end-1,1) ];
    
end
%}

%feed-forward
g = 0.7071;

%{
for n = 1:N
    
    y(n,1) = x(n,1) + g * delay(end,1);
    
    %shift entire buffer down
    delay = [ x(n,1) ; delay(1:end-1,1) ];
    
end
%}

%feedback

for n = 1:N
    
   y(n,1) = x(n,1) + g * delay(end,1); 
    
   delay = [y(n,1) ; delay(1:end-1,1)]; 
    
    
end
plot(x); hold on;
plot(y);