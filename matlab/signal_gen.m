clear;
clc;

fsample = 50e6;% Fs 50MHz
fpass = fsample/2*0.2;
fstop = fsample/2*0.5;

time = 0:1/fsample:40e-6;%time length 40us

f1 = 0.5*fpass;
f2 = 1*fstop;

signal_unit =  0.5*sin(2*pi*f1*time);

signal_in = round( (2^11-1)*signal_unit );

wvtool(signal_in);



signal_write = dec2bin(signal_in + 2^12*(signal_in < 0),12);


fid = fopen('../sim/signal_in.txt','wt');
for n = 1:length(signal_write)
    fprintf(fid,'%s\n',signal_write(n,:));
end
fclose(fid);


