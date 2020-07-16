%stepResonse

Fs = 48000;
Ts = 1/Fs;

x = [0.1 * ones(Fs,1); ones(Fs,1); 0.1 * ones(Fs,1)];

N = length(x);

%alpha = 0.9999;

responseTime = 0.05;
alpha = exp(-log(9)/(Fs*responseTime));

feedbackSample = 0;

for n = 1:N
    
    y(n,1) = (1-alpha) * x(n,1) + alpha * feedbackSample;
    feedbackSample = y(n,1);
    
end

plot(x); hold on;
plot(y); hold off;