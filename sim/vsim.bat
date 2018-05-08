@echo off
iverilog -y ../src -o vsim.out tb_fir.v  
vvp vsim.out

if exist "vsim.gtkw" (gtkwave "vsim.gtkw") else (gtkwave "vsim.vcd")