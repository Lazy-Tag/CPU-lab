`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/02 20:13:10
// Design Name: 
// Module Name: MUX2X32
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


module MUX2X32(
    input [31:0] A0,
    input [31:0] A1,
    input S,
    output [31:0] Y);

    function [31:0] select;
        input [31:0] A0,A1;
        input S;
        case(S)
            1'b0:select = A0;
            1'b1:select = A1;
        endcase
    endfunction
    assign Y = select(A0, A1, S);
endmodule
