`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2022 22:35:16
// Design Name: 
// Module Name: cpu_top
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

module cpu_top(
    input clk,
    input reset,
    output [31:0]op
    );

wire [3:0] alu_op;
wire [0:0] brnch;
wire [0:0] mem_rd;
wire [0:0] mem_to_rgs;
wire [0:0] mem_wr;
wire [0:0] alu_src;
wire [0:0] reg_wr;
wire [6:0] opcode;
wire [2:0] op11;
wire [1:0] op12;
wire op13;
wire [1:0] op14;
wire [1:0] op15;
wire [1:0] op16;
wire [1:0] op17;
wire [1:0] op18;
wire [1:0] op19;
wire [1:0] op20;
wire  op21;
wire  op22;
wire  op23;
wire  op24;
wire  op25;
wire  op26;
wire [3:0]op27;
wire [2:0]op30;

DataPath_Unit DU(
.clk(clk),
.reset(reset),
.alu_op(alu_op),
.brnch(brnch),
.mem_rd(mem_rd),
.mem_to_rgs(mem_to_rgs),
.mem_wr(mem_wr),
.alu_src(alu_src),
.reg_wr(reg_wr),
.opcode(opcode),
.op11(op11),
.op12(op12),
.op13(op13),
.op14(op14),
.op15(op15),
.op16(op16),
.op17(op17),
.op18(op18),
.op19(op19),
.op30(op30),
.op20(op20));

ControlPath_Unit CU(
.reset(reset),
.alu_op(alu_op),
.brnch(brnch),
.mem_rd(mem_rd),
.mem_to_rgs(mem_to_rgs),
.mem_wr(mem_wr),
.alu_src(alu_src),
.reg_wr(reg_wr),
.opcode(opcode),
.op21(op21),
.op22(op22),
.op23(op23),
.op24(op24),
.op25(op25),
.op26(op26),
.op27(op27)

    );
assign op[0]=op21;
assign op[1]=op22;
assign op[2]=op23;
assign op[3]=op24;
assign op[4]=op25;
assign op[5]=op26;
assign op[9:6]=op27;
assign op[11:10]=op11;
assign op[13:12]=op12;
assign op[14]=op13;
assign op[16:15]=op14;
assign op[18:17]=op15;
assign op[20:19]=op16;
assign op[22:21]=op17;
assign op[24:23]=op18;
assign op[26:25]=op19;
assign op[28:27]=op20;
assign op[31:29]=op30;

endmodule
