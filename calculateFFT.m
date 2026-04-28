function [freq,spectrum] = calculateFFT(data,fs)

%   data = time domain data vector to be taken fft
%   fs = sampling frequency of the data 

z=data;
z=z-mean(z);

% N = 16*2^nextpow2(length(z));
ZF = fft(z,length(z)); 

ZF = abs(ZF);

F = linspace(0,fs,length(ZF));

freq = F(1:length(F)/2);
spectrum = ZF(1:length(F)/2);

end

