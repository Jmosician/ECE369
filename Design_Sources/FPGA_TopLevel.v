/* Group 28
    Jerald Ocaya: 50%
    Logan Goerge: 50%
*/
`timescale 1ns / 1ps
module FPGA_TopLevel(Clk, Reset, out7, en_out);
input Clk;
input Reset;
output [6:0] out7;
output [7:0] en_out;
wire Clkout;
wire [15:0] PCValue, WriteData;


Two4DigitDisplay s(Clkout,PCValue[15:0],WriteData[15:0],out7,en_out);
TopLevel a(Clk, Reset, PCValue, WriteData);
ClkDiv r(Clkout, 1'b0, Clk);

endmodule