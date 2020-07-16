%basicCompressor.m
clc; clear; close all;

[x,Fs] = audioread('AcGtr.wav');

N = length(x);

%parameters
T = -36;
R = 4;

attackTime = 0.5;
alphaA = exp(-log(9)/(Fs*attackTime));

releaseTime = 0.01;
alphaR = exp(-log(9)/(Fs*releaseTime));

gainSmoothPrev = 0;
y = zeros(N,1);


for n = 1:N
    
    in = x(n,1);
    
    %detection path
    
    %need to get envelope, but on the dB scale
    %convert signal to dB scale
    in_dB = 20*log10(abs(in));
    if(in_dB < -144)
        in_dB = -144;
    end
    
    %static characteristics (not time dependent)
    if (in_dB < T)
        scGain = in_dB;
    else
        scGain = T + (in_dB - T)/R;
    end
    
    gainChange_dB = scGain - in_dB;
    
    %smoothing filter
    if gainChange_dB < gainSmoothPrev % attack
        gainSmooth = (1 - alphaA) * gainChange_dB + alphaA * gainSmoothPrev;
    else
        gainSmooth = (1-alphaR) * gainChange_dB + alphaR * gainSmoothPrev;
    end
    %convert back to linear scale
    gr = 10^(gainSmooth/20);
    
    y(n,1) = gr * in;
    grTrace(n,1) = gr;
    gainSmoothPrev = gainSmooth;
end

subplot(2,1,1);
plot(x); hold on;
plot(grTrace); hold off;

subplot(2,1,2);
plot(y);