function [y] = bitCrushing(x,numBits)

numLevels = 2^numBits;

tempSig = 0.5 * x + 0.5; % input signal between 0 - 1
%plot(tempSig);

scaledSig = numLevels * tempSig; %scale it by number of levels
%plot(scaledSig);

quanSig = round(scaledSig); %actual process of bit crush

shrunkSig = quanSig * 1/numLevels; %put it back between 0-1
%plot(shrunkSig);

y = 2 * shrunkSig -1; %bring it back to original scale value (-1 - 1)