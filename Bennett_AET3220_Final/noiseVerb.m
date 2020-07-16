function [y] = noiseVerb(x,Fs,reverbLength)

%convert seconds to samples
lengthSamples = reverbLength * Fs;

%synthesize white noise
noise = randn(lengthSamples,1);

%modify envelope
N = length(noise);
lenFadeSec = 1;
lenFadeSample = lenFadeSec * Fs;
fade = linspace(0,1,lenFadeSample).';
%create "ones" at beginning of sample so that fade doesn't happen
%until it is supposed to
ones(length(noise) - length(fade),1);

%S - cruve
period = lenFadeSec * 2; %fade = 0.5 cycle
f = 1/period;
Ts = 1/Fs;
t = [0:lenFadeSample-1].'*Ts;
fade = 0.5 * sin(2*pi*f*t + (-pi/2)) - 0.5;

%going through each element of x and mulitplying it by each element of the
%fade

fade = [ones(length(noise) - length(fade),1); fade   ];

N = length(noise);
%element-wise multiplication

for n = 1:N
    
    IR(n,1) = noise(n,1) * fade(n,1);
    
end 

%special MATLAB syntax
IR = noise .* fade;

%plot
figure('Name','IR');
plot(IR); hold on;
%convolve
z = conv(IR,x);

%normalize
%initialize max amp
maxAmp = 0;

%search through all samples for the max amp
for n = 1:N
    %go through the signal one sample at a time
    %find absolute value of each signal
    temp = abs(z(n,1));
    
    %compare
    if (temp > maxAmp)
        
        maxAmp = temp;
        
    end 
    
end

%desired level in dB
dBAmp = -4;
linAmp = 10 ^ (dBAmp/20);

%find scaler to normalize
g = linAmp/maxAmp;

%scale
y = z/max(abs(z));
figure('Name','Processed Signal');
plot(y); hold off;
end