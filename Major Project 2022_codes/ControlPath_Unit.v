`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2022 23:08:10
// Design Name: 
// Module Name: ControlPath_Unit
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


module ControlPath_Unit(
input reset,
output[3:0] alu_op,
output [0:0] brnch,
output [0:0] mem_rd,
output [0:0] mem_to_rgs,
output [0:0] mem_wr,
output [0:0] alu_src,
output [0:0] reg_wr,
input [6:0] opcode,
output op21,op22,op23,op24,op25,op26,
output [3:0]op27
    );
    
 control CONTROL (
    .reset(reset), 
    .opcode(opcode), 
    .brnch(brnch), 
    .mem_rd(mem_rd), 
    .mem_to_rgs(mem_to_rgs), 
    .alu_op(alu_op), 
    .mem_wr(mem_wr), 
    .alu_src(alu_src), 
    .reg_wr(reg_wr)
    );
 
 assign op21=brnch;
 assign op22=mem_rd;
 assign op23=mem_to_rgs;
 assign op24=reg_wr;
 assign op25=mem_wr;
 assign op26=alu_src;
 assign op27=alu_op;
/*
 assign op21=0;
 assign op22=0;
 assign op23=0;
 assign op24=0;
 assign op25=0;
 assign op26=0;
 */
endmodule
