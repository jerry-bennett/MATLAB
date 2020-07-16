% differenceEquation.m


% Input signal
[x,Fs] = audioread('AcGtr.wav');

N = length(x); % # samples in signal

% Delay length
dMS = 300;
dSec = dMS / 1000;
d = round(dSec*Fs); 

dry = 0.75; % range [0-1]
g1 = dry;
g2 = 1-dry; % wet path

% Loop for processing
for n = 1 : N

    if ( n-d < 1) 
        y(n,1) = g1*x(n,1);
     
    else    
        y(n,1) = g1 * x(n,1) + g2 * x(n-d,1);
    end
    
    
end


%sound(y,Fs);


% Multiple repetitions with parallel processing
% Impulse response example
x = [ 1 ; zeros(Fs-1,1)]; % Impulse
N = length(x);

g1 = 0.75;
g2 = 0.5;
g3 = 0.4;

d1 = round(0.2*Fs); % delay in samples
d2 = round(0.5*Fs); 

for n = 1:N
    
   if (n-d1 < 1)
       y(n,1) = g1 * x(n,1);
       
   elseif (n-d2 < 1)
       y(n,1) = g1 * x(n,1) + g2 * x(n-d1); 
       
   else 
       y(n,1) = g1 * x(n,1) + g2 * x(n-d1,1) + g3 * x(n-d2,1);
   end
   
end

%sound(y,Fs);
%stem(y);

% Multiple repetitions with feedback
clear y;
x = [1 ; zeros(3*Fs,1)];
N = length(x);
g1 = 1;
g2 = 0.5;

d = round(0.5 * Fs);
%impulse response = 'h'
for n = 1:N
    
   if ( n-d < 1)
       h(n,1) = g1 * x(n,1);
   else
       h(n,1) = g1 * x(n,1) + g2 * h(n-d,1); 
   end
    
end


%use IR with convolution
[x,Fs] = audioread('AcGtr.wav');

%load IR measurement
h = audioread('reverbIR.wav');
%seperate left and right channels of IR
hL = h(:,1);
hR = h(:,1);

%apply reverb
yL = conv(x,hL);
yR = conv(x,hR);

%combine to stereo signal
y = [yL, yR];

plot(h);