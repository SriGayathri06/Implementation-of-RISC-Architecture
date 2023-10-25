`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2022 23:35:09
// Design Name: 
// Module Name: cpu_top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//`define simulation_time #160
module cpu_top_tb;

	// Inputs
	reg clk;
	reg reset;
	wire [31:0]op;

	// Instantiate the Unit Under Test (UUT)
	cpu_top uut (
		.clk(clk), 
		.reset(reset),
        .op(op)


	);

	initial begin
		clk<=0;
		reset<=0;
	end
	always begin
		#5 clk<=~clk;
    end

	always @(negedge clk)begin
		 reset<=1;
	end
	//$display("0x%0h",inst_ram[120]);

	 
endmodule
