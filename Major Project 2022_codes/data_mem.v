`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:36 03/02/2022 
// Design Name: 
// Module Name:    data_mem 
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
// File: data_mem.v
// Generated by MyHDL 0.11
// Date: Wed Mar  2 16:10:07 2022


`timescale 1ns/10ps

module data_mem (
    reset,
    clk,
    result,
    mem_wr,
    mem_rd,
    rdb,
    read_data,
    im_gen
);

input [31:0]im_gen;
input reset;
input [0:0] clk;
input [31:0] result;
input [0:0] mem_wr;
input [0:0] mem_rd;
input [31:0] rdb;
output [31:0] read_data;
reg [31:0] read_data1;

reg [31:0] data_ram [0:128-1];

initial
 begin
  $readmemb("F:/Vivado projects/Finalyear_Project/Finalyear_Project.srcs/sources_1/imports/MajorProject/mc_data", data_ram);
 end

always @(posedge clk) begin: DATA_MEM_DTCM
    if ((reset == 1)) begin
        if (mem_wr) begin
            data_ram[result] <= rdb;
        end
        else if (mem_rd) begin
            read_data1 <= data_ram[result];
        end
        //
        else begin
            read_data1<=im_gen;
        end
        //
    end
    //
    else
        read_data1<=32'bX;
    //

end
assign read_data=read_data1;
endmodule

