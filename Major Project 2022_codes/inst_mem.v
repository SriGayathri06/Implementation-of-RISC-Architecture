`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:27 03/02/2022 
// Design Name: 
// Module Name:    inst_mem 
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
// File: inst_mem.v
// Generated by MyHDL 0.11
// Date: Wed Mar  2 16:10:07 2022




`timescale 1ns/10ps


module inst_mem (
    reset,
    read_addr,
    instruction,
    ra,
    rb,
    wa,
    opcode
);


input reset;
input [31:0] read_addr;
output [31:0] instruction;
reg [31:0] instruction1;
output [4:0] ra;
reg [4:0] ra1;
output [4:0] rb;
reg [4:0] rb1;
output [4:0] wa;
reg [4:0] wa1;
output [6:0] opcode;
reg [6:0] opcode1;

reg [31:0] inst_ram[0:127] ;
//reg [31:0] inst_ram[127:0];
//wire [31:0] inst_ram [0:128-1];
initial
begin
  $readmemb("F:/Vivado projects/Finalyear_Project/Finalyear_Project.srcs/sources_1/imports/MajorProject/mc_code", inst_ram);
end


always @(*) begin: INST_MEM_ITCM
    if ((reset == 1)) begin
        instruction1 <= inst_ram[read_addr];
        if ((instruction1[7-1:0] == 51)) begin
            ra1 <= instruction1[20-1:15];
            rb1 <= instruction1[25-1:20];
            opcode1 <= instruction1[7-1:0];
            wa1 <= instruction1[12-1:7];
        end
        else if ((instruction1[7-1:0] == 3)) begin
            ra1 <= instruction1[20-1:15];
            opcode1 <= instruction1[7-1:0];
            wa1 <= instruction1[12-1:7];
            rb1<=5'bX;
        end
        else if ((instruction1[7-1:0] == 35)) begin
            ra1 <= instruction1[20-1:15];
            rb1 <= instruction1[25-1:20];
            opcode1 <= instruction1[7-1:0];
            wa1 <= instruction1[25-1:20];
        end
        else if ((instruction1[7-1:0] == 99)) begin
            ra1<=instruction1[20-1:15];
            rb1 <= instruction1[25-1:20];
            opcode1 <= instruction1[7-1:0];
            wa1<=5'bX;
        end
        //
        else begin
            ra1<=4'bX;
            rb1<=4'bX;
            opcode1<=4'bX;
            wa1<=4'bX;
        end
        //
    end
    //
    else begin
        instruction1<=32'dX;
        ra1<=4'bX;
        rb1<=4'bX;
        opcode1<=4'bX;
        wa1<=4'bX;
    end
        
    //
end
assign instruction=instruction1;
assign ra=ra1;
assign rb=rb1;
assign opcode=opcode1;
assign wa=wa1;

endmodule








