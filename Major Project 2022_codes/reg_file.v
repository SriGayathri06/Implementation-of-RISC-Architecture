`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:43 03/02/2022 
// Design Name: 
// Module Name:    reg_file 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
// File: reg_file.v
// Generated by MyHDL 0.11
// Date: Wed Mar  2 16:10:07 2022


`timescale 1ns/10ps

module reg_file (
    reset,
    clk,
    ra,
    rb,
    wa,
    wda,
    reg_wr,
    rda,
    rdb
);


input reset;
input [0:0] clk;
input [4:0] ra;
input [4:0] rb;
input [4:0] wa;
input [31:0] wda;
input [0:0] reg_wr;
output [31:0] rda;
reg [31:0] rda1;
output [31:0] rdb;
reg [31:0] rdb1;

reg [31:0] registers [0:32-1];
/*
integer i;
for(i=10;i<42;i=i+1)begin
	registers[i]=32'bi;
end
*/

always @(registers[0], registers[1], registers[2], registers[3], registers[4], registers[5], registers[6], registers[7], registers[8], registers[9], registers[10], registers[11], registers[12], registers[13], registers[14], registers[15], registers[16], registers[17], registers[18], registers[19], registers[20], registers[21], registers[22], registers[23], registers[24], registers[25], registers[26], registers[27], registers[28], registers[29], registers[30], registers[31], reset,ra,rb) begin: REG_FILE_READ
    if ((reset == 1)) begin
        if (ra) begin
            rda1 <= registers[ra];
        end
        //
        else begin
            rda1<=32'bX;
        end
        //
        if (rb) begin
            rdb1 <= registers[rb];
        end
        //
        else begin
            rdb1<=32'bX;
        end
    end
    else begin
        rdb1<=32'bX;
        rda1<=32'bX;
    end
end


always @(posedge clk) begin: REG_FILE_WRITE
    if ((reset == 1)) begin
        if (reg_wr==1) begin
            if(wa)
                registers[wa] <= wda;
        end
    end
       
end
assign rda=rda1;
assign rdb=rdb1;

endmodule