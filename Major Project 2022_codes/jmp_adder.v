`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:44 03/02/2022 
// Design Name: 
// Module Name:    jmp_adder 
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
// File: jmp_adder.v
// Generated by MyHDL 0.11
// Date: Wed Mar  2 16:10:07 2022


`timescale 1ns/10ps

module jmp_adder (
    reset,
    read_addr,
    shl,
    jmp_addr
);


input reset;
input [31:0] read_addr;
input [31:0] shl;
output [31:0] jmp_addr;
reg [31:0] jmp_addr1;




always @(read_addr, shl, reset) begin: JMP_ADDER_JADDER
    if ((reset == 1)) begin
        jmp_addr1 <= (read_addr + shl);
    end
    //
    else
        jmp_addr1<=32'bX;
    //
end
assign jmp_addr=jmp_addr1;
endmodule

