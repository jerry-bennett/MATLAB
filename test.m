[x,Fs] = audioread('sw20Hz.wav');

N = length(x);
%{
for n = 1:N
    y(n,1) = (0.5792) * x(n,1) + (0.5792) * (x(n,1)-1) + (-0.1584) * (x(n,1)-2);
end
%}

for n = 1:N
    
    y(n,1) = 0.45 * x(n,1) + (-0.5) * (x(n,1)-1) + (0.05) * (x(n,1)-2);
    
end
freqz(x,y);
sound(y,Fs);