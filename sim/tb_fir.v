`timescale 1ns/1ns
module tb_fir;

	reg clk;
	reg rst;
	reg signed [11:0] signal_in;
	wire signed [11:0] signal_out;
	
	fir_12bit dut (
		.clk(clk),
		.rst(rst),
		.signal_in(signal_in),
		.signal_out(signal_out)
	);
	
	initial begin
	
		$dumpfile("vsim.vcd");
		$dumpvars();
		$dumpvars(1,tb_fir.dut);
		
		
		#100000
		$finish;
	end
	
	initial begin
	
		rst = 0;
		#15
		rst = 1;
		
	end
	
	initial begin
	
		clk = 0;
		forever #10 clk = ~clk;//50MHz
	
	end
	
	reg signed[11:0] mem[1600:0];
	
	initial begin
	
		$readmemb("signal_in.txt",mem);
	 
	end
	
	integer i = 0;
	
	initial begin
		#11;
		for(i=0;i<1601;i++) begin
		
			signal_in = mem[i];
		    #20;
		end
    end
	
	// always@(posedge clk) begin
	
		 // signal_out <= signal_in;
	
	// end
	
	//write data to txt file
	integer file;
	integer cnt = 0;
	
	initial begin
	    #33
		file = $fopen("dataout.txt","w");
	end
	
	always @(posedge clk) begin
		$fdisplay(file,signal_out);
		cnt <= cnt + 1;
		if(cnt == 1602) begin
			$fclose(file);
		end
	end
	
endmodule