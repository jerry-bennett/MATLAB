%echo effect

[x,Fs] = audioread('AcGtr.wav');

delaySamples = floor(Fs * 0.25); %250 ms of delay

%zero-pad ebd if "x" for "dry" signal
dry = [x; zeros(delaySamples,1)];
wet = [zeros(delaySamples,1); x];
plot(dry); hold on;
plot(wet); hold off;
y = dry+wet;
