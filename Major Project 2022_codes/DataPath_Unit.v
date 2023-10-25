`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2022 23:04:21
// Design Name: 
// Module Name: DataPath_Unit
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


module DataPath_Unit(
input clk,
input reset,
input [3:0] alu_op,
input [0:0] brnch,
input [0:0] mem_rd,
input [0:0] mem_to_rgs,
input [0:0] mem_wr,
input [0:0] alu_src,
input [0:0] reg_wr,
output [6:0] opcode,
output [2:0] op11,
output [1:0] op12,
output [1:0] op13,
output [1:0] op14,
output [1:0] op15,
output [1:0] op16,
output [1:0] op17,
output [1:0] op18,
output [1:0] op19,
output [2:0] op30,
output [1:0] op20
);
wire [4:0] ra;
wire [4:0] rb;
wire [4:0] wa;
wire [31:0] wda;
wire [31:0] rda;
wire [31:0] rdb;
wire [31:0] rdx;
wire [31:0] result;
wire [31:0] read_data;
reg [31:0] pc;
wire [31:0] shl;
wire [0:0] pc_sel;
wire [31:0] im_gen;
wire [3:0] alu_decode;
wire [31:0] read_addr;
wire [31:0] instruction;
reg [31:0] pc_addr;
wire [31:0] jmp_addr;
reg [31:0]d=1;


initial pc=-d;
//pc_addr
always @(posedge clk)
    pc_addr=pc+1;

//pc_mux

always @(posedge clk) begin
    if ((reset == 1)) begin
        if (pc_sel) begin
				pc = jmp_addr;
        end
        else begin
            pc = pc_addr;
        end
    end
    //
	else
		pc=-d;
    //
end

//pc_assign 
assign read_addr=pc;


inst_mem INST_MEM (
    .reset(reset), 
    .read_addr(read_addr), 
    .instruction(instruction), 
    .ra(ra), 
    .rb(rb), 
    .wa(wa), 
    .opcode(opcode)
    );
    
 reg_file REG_FILE (
    .reset(reset), 
    .clk(clk), 
    .ra(ra), 
    .rb(rb), 
    .wa(wa), 
    .wda(wda), 
    .reg_wr(reg_wr), 
    .rda(rda), 
    .rdb(rdb)
    );
    
 taken TAKEN (
    .result(result), 
    .brnch(brnch), 
    .pc_sel(pc_sel)
    );
    
 jmp_adder JMP_ADDR (
    .reset(reset), 
    .read_addr(read_addr), 
    .shl(shl), 
    .jmp_addr(jmp_addr)
    );
    
 
alu_control ALU_CONTROL (
    .reset(reset), 
    .instruction(instruction), 
    .alu_op(alu_op), 
    .alu_decode(alu_decode)
    );
    	 
//imm_gen(reset, instruction, im_gen);
imm_gen IMM_GEN (
    .reset(reset), 
    .instruction(instruction), 
    .im_gen(im_gen)
    );
	 	 
//alu_mux(reset, im_gen, rdb, rdx, alu_src);
alu_mux ALU_MUX (
    .reset(reset), 
    .im_gen(im_gen), 
    .rdb(rdb), 
    .rdx(rdx), 
    .alu_src(alu_src)
    );
	 
//alu(reset, alu_decode, rda, rdx, result);
alu ALU (
    .reset(reset), 
    .alu_decode(alu_decode), 
    .rda(rda), 
    .rdx(rdx), 
    .result(result)
    );
	 
//data_mem(reset, clk, result, mem_wr, mem_rd, rdb, read_data);
data_mem DATA_MEM (
    .im_gen(im_gen),
    .reset(reset), 
    .clk(clk), 
    .result(result), 
    .mem_wr(mem_wr), 
    .mem_rd(mem_rd), 
    .rdb(rdb), 
    .read_data(read_data)
    );	 
	 
//wda_mux(reset, wda, mem_to_rgs, result, read_data);
wda_mux WDA_MUX (
    .reset(reset), 
    .wda(wda), 
    .mem_to_rgs(mem_to_rgs), 
    .result(result), 
    .read_data(read_data)
    );
assign op11=pc[1:0];
assign op12=rda[1:0];
assign op13=pc_sel;
assign op14=jmp_addr[1:0];
assign op15=alu_decode[1:0];
assign op16=im_gen[1:0];
assign op17=rdx[1:0];
assign op18=result[1:0];
assign op19=read_data[1:0];
assign op20=wda[1:0];
assign op30=opcode[2:0];

endmodule
