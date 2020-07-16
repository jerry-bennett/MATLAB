%amplitudeFades.m

[x, Fs] = audioread('sw440Hz.wav');

%plot(x);

lenFadeSec = 1;
lenFadeSample = lenFadeSec * Fs;

%fade = linspace(1,0,lenFadeSample).';
fade = linspace(0,1,lenFadeSample).';

fade = sqrt(fade); %makes it convex

%S - cruve
period = lenFadeSec * 2; %fade = 0.5 cycle
f = 1/period;
Ts = 1/Fs;
t = [0:lenFadeSample-1].'*Ts;
fade = 0.5 * sin(2*pi*f*t + (-pi/2)) - 0.5;

plot(fade);

%create "ones" at beginning of sample so that fade doesn't happen
%until it is supposed to
ones(length(x) - length(fade),1);

%going through each element of x and mulitplying it by each element of the
%fade

fade = [ones(length(x) - length(fade),1); fade   ];

N = length(x);
%element-wise multiplication

for n = 1:N
    
    y(n,1) = x(n,1) * fade(n,1);
    
end 

%special MATLAB syntax
y = x .* fade;

plot(y);