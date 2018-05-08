//15-Apr-2018 11:14:51
`timescale 1ns/1ps

module fir_12bit(
	input clk,
	input rst,
	input wire signed [11:0] signal_in,
	output wire signed [11:0] signal_out
);


reg signed [29:0] unit;
    
reg signed [11:0] delay_pipeline[63:0];

wire signed [15:0] coef[63:0];
// 64 coef begin
    assign coef[0] = 3;
    assign coef[1] = -37;
    assign coef[2] = -33;
    assign coef[3] = -17;
    assign coef[4] = 22;
    assign coef[5] = 64;
    assign coef[6] = 77;
    assign coef[7] = 38;
    assign coef[8] = -46;
    assign coef[9] = -131;
    assign coef[10] = -154;
    assign coef[11] = -74;
    assign coef[12] = 87;
    assign coef[13] = 242;
    assign coef[14] = 279;
    assign coef[15] = 133;
    assign coef[16] = -153;
    assign coef[17] = -421;
    assign coef[18] = -482;
    assign coef[19] = -228;
    assign coef[20] = 262;
    assign coef[21] = 727;
    assign coef[22] = 838;
    assign coef[23] = 403;
    assign coef[24] = -473;
    assign coef[25] = -1357;
    assign coef[26] = -1645;
    assign coef[27] = -850;
    assign coef[28] = 1112;
    assign coef[29] = 3805;
    assign coef[30] = 6394;
    assign coef[31] = 7978;
    assign coef[32] = 7978;
    assign coef[33] = 6394;
    assign coef[34] = 3805;
    assign coef[35] = 1112;
    assign coef[36] = -850;
    assign coef[37] = -1645;
    assign coef[38] = -1357;
    assign coef[39] = -473;
    assign coef[40] = 403;
    assign coef[41] = 838;
    assign coef[42] = 727;
    assign coef[43] = 262;
    assign coef[44] = -228;
    assign coef[45] = -482;
    assign coef[46] = -421;
    assign coef[47] = -153;
    assign coef[48] = 133;
    assign coef[49] = 279;
    assign coef[50] = 242;
    assign coef[51] = 87;
    assign coef[52] = -74;
    assign coef[53] = -154;
    assign coef[54] = -131;
    assign coef[55] = -46;
    assign coef[56] = 38;
    assign coef[57] = 77;
    assign coef[58] = 64;
    assign coef[59] = 22;
    assign coef[60] = -17;
    assign coef[61] = -33;
    assign coef[62] = -37;
    assign coef[63] = 3;
// 64 coef end
   reg signed [29:0] product[63:0];
   
   reg signed [29:0] sum_buf;
   
   reg signed [11:0] data_in_buf;
   
   always @(posedge clk or negedge rst) begin
		if(!rst) begin
			data_in_buf <= 0;
		end
        else begin
		    data_in_buf <= signal_in;
		end
		
	end

    
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
            delay_pipeline[0] <= 0;
	        delay_pipeline[1] <= 0;
			delay_pipeline[2] <= 0;
			delay_pipeline[3] <= 0;
			delay_pipeline[4] <= 0;
			delay_pipeline[5] <= 0;
			delay_pipeline[6] <= 0;
			delay_pipeline[7] <= 0;
			delay_pipeline[8] <= 0;
	        delay_pipeline[9] <= 0;
			delay_pipeline[10] <= 0;
			delay_pipeline[11] <= 0;
			delay_pipeline[12] <= 0;
			delay_pipeline[13] <= 0;
			delay_pipeline[14] <= 0;
			delay_pipeline[15] <= 0;
			delay_pipeline[16] <= 0;
	        delay_pipeline[17] <= 0;
			delay_pipeline[18] <= 0;
			delay_pipeline[19] <= 0;
			delay_pipeline[20] <= 0;
			delay_pipeline[21] <= 0;
			delay_pipeline[22] <= 0;
			delay_pipeline[23] <= 0;
			delay_pipeline[24] <= 0;
	        delay_pipeline[25] <= 0;
			delay_pipeline[26] <= 0;
			delay_pipeline[27] <= 0;
			delay_pipeline[28] <= 0;
			delay_pipeline[29] <= 0;
			delay_pipeline[30] <= 0;
			delay_pipeline[31] <= 0;
			delay_pipeline[32] <= 0;
	        delay_pipeline[33] <= 0;
			delay_pipeline[34] <= 0;
			delay_pipeline[35] <= 0;
			delay_pipeline[36] <= 0;
			delay_pipeline[37] <= 0;
			delay_pipeline[38] <= 0;
			delay_pipeline[39] <= 0;
			delay_pipeline[40] <= 0;
	        delay_pipeline[41] <= 0;
			delay_pipeline[42] <= 0;
			delay_pipeline[43] <= 0;
			delay_pipeline[44] <= 0;
			delay_pipeline[45] <= 0;
			delay_pipeline[46] <= 0;
			delay_pipeline[47] <= 0;
			delay_pipeline[48] <= 0;
	        delay_pipeline[49] <= 0;
			delay_pipeline[50] <= 0;
			delay_pipeline[51] <= 0;
			delay_pipeline[52] <= 0;
			delay_pipeline[53] <= 0;
			delay_pipeline[54] <= 0;
			delay_pipeline[55] <= 0;
			delay_pipeline[56] <= 0;
	        delay_pipeline[57] <= 0;
			delay_pipeline[58] <= 0;
			delay_pipeline[59] <= 0;
			delay_pipeline[60] <= 0;
			delay_pipeline[61] <= 0;
			delay_pipeline[62] <= 0;
			delay_pipeline[63] <= 0;
		end
		else begin
			delay_pipeline[0] <= data_in_buf;
	        delay_pipeline[1] <= delay_pipeline[0] ;
			delay_pipeline[2] <= delay_pipeline[1] ;
			delay_pipeline[3] <= delay_pipeline[2] ;
			delay_pipeline[4] <= delay_pipeline[3] ;
			delay_pipeline[5] <= delay_pipeline[4] ;
			delay_pipeline[6] <= delay_pipeline[5] ;
			delay_pipeline[7] <= delay_pipeline[6] ;
			delay_pipeline[8] <= delay_pipeline[7] ;
	        delay_pipeline[9] <= delay_pipeline[8] ;
			delay_pipeline[10] <=delay_pipeline[9] ;
			delay_pipeline[11] <=delay_pipeline[10];
			delay_pipeline[12] <=delay_pipeline[11];
			delay_pipeline[13] <=delay_pipeline[12];
			delay_pipeline[14] <=delay_pipeline[13];
			delay_pipeline[15] <=delay_pipeline[14];
			delay_pipeline[16] <=delay_pipeline[15];
	        delay_pipeline[17] <=delay_pipeline[16];
			delay_pipeline[18] <=delay_pipeline[17];
			delay_pipeline[19] <=delay_pipeline[18];
			delay_pipeline[20] <=delay_pipeline[19];
			delay_pipeline[21] <=delay_pipeline[20];
			delay_pipeline[22] <=delay_pipeline[21];
			delay_pipeline[23] <=delay_pipeline[22];
			delay_pipeline[24] <=delay_pipeline[23];
	        delay_pipeline[25] <=delay_pipeline[24];
			delay_pipeline[26] <=delay_pipeline[25];
			delay_pipeline[27] <=delay_pipeline[26];
			delay_pipeline[28] <=delay_pipeline[27];
			delay_pipeline[29] <=delay_pipeline[28];
			delay_pipeline[30] <=delay_pipeline[29];
			delay_pipeline[31] <=delay_pipeline[30];
			delay_pipeline[32] <=delay_pipeline[31];
	        delay_pipeline[33] <=delay_pipeline[32];
			delay_pipeline[34] <=delay_pipeline[33];
			delay_pipeline[35] <=delay_pipeline[34];
			delay_pipeline[36] <=delay_pipeline[35];
			delay_pipeline[37] <=delay_pipeline[36];
			delay_pipeline[38] <=delay_pipeline[37];
			delay_pipeline[39] <=delay_pipeline[38];
			delay_pipeline[40] <=delay_pipeline[39];
	        delay_pipeline[41] <=delay_pipeline[40];
			delay_pipeline[42] <=delay_pipeline[41];
			delay_pipeline[43] <=delay_pipeline[42];
			delay_pipeline[44] <=delay_pipeline[43];
			delay_pipeline[45] <=delay_pipeline[44];
			delay_pipeline[46] <=delay_pipeline[45];
			delay_pipeline[47] <=delay_pipeline[46];
			delay_pipeline[48] <=delay_pipeline[47];
	        delay_pipeline[49] <=delay_pipeline[48];
			delay_pipeline[50] <=delay_pipeline[49];
			delay_pipeline[51] <=delay_pipeline[50];
			delay_pipeline[52] <=delay_pipeline[51];
			delay_pipeline[53] <=delay_pipeline[52];
			delay_pipeline[54] <=delay_pipeline[53];
			delay_pipeline[55] <=delay_pipeline[54];
			delay_pipeline[56] <=delay_pipeline[55];
	        delay_pipeline[57] <=delay_pipeline[56];
			delay_pipeline[58] <=delay_pipeline[57];
			delay_pipeline[59] <=delay_pipeline[58];
			delay_pipeline[60] <=delay_pipeline[59];
			delay_pipeline[61] <=delay_pipeline[60];
			delay_pipeline[62] <=delay_pipeline[61];
			delay_pipeline[63] <=delay_pipeline[62];	
		end
	end
	
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			product[0] <= 0;
			product[1] <= 0;
			product[2] <= 0;
			product[3] <= 0;
			product[4] <= 0;
			product[5] <= 0;
			product[6] <= 0;
			product[7] <= 0;
			product[8] <= 0;
			product[9] <= 0;
			product[10] <= 0;
			product[11] <= 0;
			product[12] <= 0;
			product[13] <= 0;
			product[14] <= 0;
			product[15] <= 0;
			product[16] <= 0;
			product[17] <= 0;
			product[18] <= 0;
			product[19] <= 0;
			product[20] <= 0;
			product[21] <= 0;
			product[22] <= 0;
			product[23] <= 0;
			product[24] <= 0;
			product[25] <= 0;
			product[26] <= 0;
			product[27] <= 0;
			product[28] <= 0;
			product[29] <= 0;
			product[30] <= 0;
			product[31] <= 0;
			product[32] <= 0;
			product[33] <= 0;
			product[34] <= 0;
			product[35] <= 0;
			product[36] <= 0;
			product[37] <= 0;
			product[38] <= 0;
			product[39] <= 0;
			product[40] <= 0;
			product[41] <= 0;
			product[42] <= 0;
			product[43] <= 0;
			product[44] <= 0;
			product[45] <= 0;
			product[46] <= 0;
			product[47] <= 0;
			product[48] <= 0;
			product[49] <= 0;
			product[50] <= 0;
			product[51] <= 0;
			product[52] <= 0;
			product[53] <= 0;
			product[54] <= 0;
			product[55] <= 0;
			product[56] <= 0;
			product[57] <= 0;
			product[58] <= 0;
			product[59] <= 0;
			product[60] <= 0;
			product[61] <= 0;
			product[62] <= 0;
			product[63] <= 0;
		end
		else begin
			product[0] <=  coef[0]* delay_pipeline[0] ;
		    product[1] <=  coef[1]* delay_pipeline[1] ;
            product[2] <=  coef[2]* delay_pipeline[2] ;
            product[3] <=  coef[3]* delay_pipeline[3] ;
            product[4] <=  coef[4]* delay_pipeline[4] ;
            product[5] <=  coef[5]* delay_pipeline[5] ;
            product[6] <=  coef[6]* delay_pipeline[6] ;
            product[7] <=  coef[7]* delay_pipeline[7] ;
            product[8] <=  coef[8]* delay_pipeline[8] ;
            product[9] <=  coef[9]* delay_pipeline[9] ;
            product[10] <= coef[10]*delay_pipeline[10]; 
            product[11] <= coef[11]*delay_pipeline[11]; 
            product[12] <= coef[12]*delay_pipeline[12];
            product[13] <= coef[13]*delay_pipeline[13];
            product[14] <= coef[14]*delay_pipeline[14];
            product[15] <= coef[15]*delay_pipeline[15];
            product[16] <= coef[16]*delay_pipeline[16];
            product[17] <= coef[17]*delay_pipeline[17];
            product[18] <= coef[18]*delay_pipeline[18];
            product[19] <= coef[19]*delay_pipeline[19];
            product[20] <= coef[20]*delay_pipeline[20];
            product[21] <= coef[21]*delay_pipeline[21];
            product[22] <= coef[22]*delay_pipeline[22];
            product[23] <= coef[23]*delay_pipeline[23];
            product[24] <= coef[24]*delay_pipeline[24];
            product[25] <= coef[25]*delay_pipeline[25];
            product[26] <= coef[26]*delay_pipeline[26];
            product[27] <= coef[27]*delay_pipeline[27];
            product[28] <= coef[28]*delay_pipeline[28];
            product[29] <= coef[29]*delay_pipeline[29];
            product[30] <= coef[30]*delay_pipeline[30];
            product[31] <= coef[31]*delay_pipeline[31];
            product[32] <= coef[32]*delay_pipeline[32];
            product[33] <= coef[33]*delay_pipeline[33];
            product[34] <= coef[34]*delay_pipeline[34];
            product[35] <= coef[35]*delay_pipeline[35];
            product[36] <= coef[36]*delay_pipeline[36];
            product[37] <= coef[37]*delay_pipeline[37];
            product[38] <= coef[38]*delay_pipeline[38];
            product[39] <= coef[39]*delay_pipeline[39];
            product[40] <= coef[40]*delay_pipeline[40];
            product[41] <= coef[41]*delay_pipeline[41];
            product[42] <= coef[42]*delay_pipeline[42];
            product[43] <= coef[43]*delay_pipeline[43];
            product[44] <= coef[44]*delay_pipeline[44];
            product[45] <= coef[45]*delay_pipeline[45];
            product[46] <= coef[46]*delay_pipeline[46];
            product[47] <= coef[47]*delay_pipeline[47];
            product[48] <= coef[48]*delay_pipeline[48];
            product[49] <= coef[49]*delay_pipeline[49];
            product[50] <= coef[50]*delay_pipeline[50];
            product[51] <= coef[51]*delay_pipeline[51];
            product[52] <= coef[52]*delay_pipeline[52];
            product[53] <= coef[53]*delay_pipeline[53];
            product[54] <= coef[54]*delay_pipeline[54];
            product[55] <= coef[55]*delay_pipeline[55];
            product[56] <= coef[56]*delay_pipeline[56];
            product[57] <= coef[57]*delay_pipeline[57];
            product[58] <= coef[58]*delay_pipeline[58];
            product[59] <= coef[59]*delay_pipeline[59];
            product[60] <= coef[60]*delay_pipeline[60];
            product[61] <= coef[61]*delay_pipeline[61];
            product[62] <= coef[62]*delay_pipeline[62];
            product[63] <= coef[63]*delay_pipeline[63];
		end
	end
    
    always @(posedge clk or negedge rst) begin
		if (!rst) begin
			sum_buf <= 0;
		end
		else begin
			sum_buf <= product[0]+ product[1]+ product[2]+ product[3]
			+product[4]+product[5]+product[6]+product[7]
			+product[8]+product[9]+product[10]+product[11]
			+product[12]+product[13]+product[14]+product[15]
			+product[16]+product[17]+product[18]+product[19]
			+product[20]+product[21]+product[22]+product[23]
			+product[24]+product[25]+product[26]+product[27]
			+product[28]+product[29]+product[30]+product[31]
			+product[32]+product[33]+product[34]+product[35]
			+product[36]+product[37]+product[38]+product[39]
			+product[40]+product[41]+product[42]+product[43]
			+product[44]+product[45]+product[46]+product[47]
			+product[48]+product[49]+product[50]+product[51]
			+product[52]+product[53]+product[54]+product[55]
			+product[56]+product[57]+product[58]+product[59]
			+product[60]+product[61]+product[62]+product[63];
		end
	end	
	
	always @(sum_buf) begin
		if (!rst) begin
			unit <= 0;
		end
		else begin
		    unit <= (sum_buf >> 15);
		end
	end
	
	assign signal_out = unit[11:0];
	
endmodule	
	
