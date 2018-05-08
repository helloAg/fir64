%% 
clear;
clc;
load fir_coef64;
Output_bitwith = 30;
input_bitwith = 12;

%coef_bitwith = Output_bitwith - input_bitwith - ceil(log2(sum(abs(Num))));%ceil 向上去整

coef_bitwith = 16;

coef_scale = round(2^( coef_bitwith - 1 )*Num);

save('coef_scale','coef_scale');
freqz(coef_scale);