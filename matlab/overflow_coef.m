%% check coef overflow
clear;
clc;
load fir_coef64
max_value_abs =  max(abs(Num))*(2^11);
if max_value_abs < 2^12 - 1;
    disp('coef no overflow');
    disp(['max abs value:',num2str(max_value_abs)]);
else
    disp('coef overflow!!');
    disp(['max abs value:',num2str(max_value_abs)]);
end    
