%vocoder.m

%import audio files
[vocal,Fs] = audioread('Voice.wav');
[synth] = audioread('Synth.wav');

numOfBands = 8;

%logrithmically spaced array

freq = 2*logspace(1,4,numOfBands+1);

N = length(vocal);
voxBands = zeros(N,numOfBands);
envBands = zeros(N,numOfBands);
synthBands = zeros(N,numOfBands);
outBands = zeros(N,numOfBands);

Nyq = Fs / 2;
alpha = 0.99;
for band = 1:numOfBands
    
    order = 2;
    Wn = [freq(band) , freq(band+1)]/Nyq; %normalized frequency
    [b,a] = butter(order,Wn);
    
    voxBands(:,band) = filter(b,a,vocal);
    synthBands(:,band) = filter(b,a,synth);
    
    %get envelope form voxBands
    b1 = (1-alpha);
    a1 = [1, -alpha];
    envBands (:,band) = filter(b1,a1,abs(voxBands(:,band)));
    
    %amplitude modulation
    outBands(:,band) = envBands(:,band) .* synthBands(:,band);
    
end

out = sum(outBands,2);
out = out/max(abs(out));
sound(out,Fs);