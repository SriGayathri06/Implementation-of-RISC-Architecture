`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:03 03/02/2022 
// Design Name: 
// Module Name:    alu 
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
module alu (
    reset,
    alu_decode,
    rda,
    rdx,
    result
);


input reset;
input [3:0] alu_decode;
input [31:0] rda;
input [31:0] rdx;
output [31:0] result;
reg [31:0] result1;




always @(reset,alu_decode,rda,rdx) begin: ALU_OPERATION
    if ((reset == 1)) begin
        case (alu_decode)
            'h0: begin
                result1 <= (rda & rdx);
            end
            'h1: begin
                result1 <= (rda | rdx);
            end
            'h2: begin
                result1 <= (rda + rdx);
            end
            'h6: begin
                result1 <= (rdx - rda);
            end
            'h7: begin
                result1 <= (rda ^ rdx);
            end
            'h3: begin
                result1 <= (rdx << rda);
            end
            'h8: begin
                result1 <= $signed($signed(rdx >>> rda));
            end
            'h4: begin
                result1 <= ($signed(rdx) < $signed(rda)) ? 1'b1 : 1'b0;
            end
            'h5: begin
                result1 <= (rdx < rda) ? 1'b1 : 1'b0;
            end
				/*
            'h9: begin
                if ((rda[31] == 0)) begin
                    result1 = $signed($signed(rda) >>> rdx);
                end
                else if ((rda[31] == 1)) begin
                    result1 = $signed($signed(rda) >>> rdx);
                    
                    result1[32-1:(31 - $signed({1'b0, rdx}))] = 2**rdx -1;
                end
            end
				*/
		    default: 
		       result1<=32'bX;
        endcase
    end
    //
    else 
        result1<=32'bX;
    //
end
assign result=result1;
endmodule
