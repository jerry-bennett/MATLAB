function vocalChain = vocalChain_fn(x,Fs,f,T,R,outGain,reverbLength)
%vocalChain.m
%this script demonstrates a vocal cahin comprimising of a high pass filter,
%compression, normalization reverb, and one last normalization

%filter around 80Hz

%initial parameters
Fs = 48000;
n = 12;

nyq = Fs/2;
Wn = f/nyq;

%highpass
h_hpf = fir1(n,Wn,'high');
sig1 = conv(h_hpf,x);

%compression
N = length(x);
attackTime = 0.1;
alphaA = exp(-log(9)/(Fs*attackTime));

releaseTime = 0.9;
alphaR = exp(-log(9)/(Fs*releaseTime));

gainSmoothPrev = 0;
y = zeros(N,1);

%compression algorithim
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
    
    z(n,1) = gr * in;
    q(n,1) = z(n,1) * outGain;
    grTrace(n,1) = gr;
    gainSmoothPrev = gainSmooth;
end

%normalize

%initialize max amp
maxAmp = 0;

%search through all samples for the max amp
for n = 1:N
    %go through the signal one sample at a time
    %find absolute value of each signal
    temp = abs(x(n,1));
    
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
i = g * x;

%convolution reverb

%reverb

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

%convolve
z = conv(IR,i);

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
figure('Name','Original Signal');
plot(sig1);
y = z/max(abs(z));
figure('Name','Processed Signal');
plot(y); hold off;

%plot signal

plot(x); hold on;
plot(grTrace); hold off;
sound(y,Fs);
end