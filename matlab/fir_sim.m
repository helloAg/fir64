clear;
clc;

load coef_scale.mat
%load fir_coef64.mat

fsample = 50e6;% Fs 50MHz
fpass = fsample/2*0.5;
fstop = fsample/2*0.6;

time = 0:1/fsample:40e-6;%time length 100us

f1 = fpass*0.1;%pass band signal freq;
f2 = fstop*1.5;%stop band signal freq;


signal_unit = sin(2*pi*f1*time);

signal_input =  round(2^11* signal_unit);
signal_filter = filter(coef_scale,1,signal_input);

signal_output = round(signal_filter/2^15);

wvtool(signal_input(1:1125),signal_output(100:1125));




