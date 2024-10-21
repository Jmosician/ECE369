`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 02:17:29 PM
// Design Name: 
// Module Name: ID_EX_reg
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


module ID_EX_reg(Clk,Rst,PC_in,PC_out,ReadData1_in,ReadData1_out,ReadData2_in,ReadData2_out,SignExt_in,SignExt_out,RegWrite_in,RegWrite_out,ALUsrc_in,ALUsrc_out,
ALUOp_in,ALUOp_out,RegDest_in,RegDest_out,MemWrite_in,MemWrite_out,MemRead_in,MemRead_out,MemToReg_in,MemToReg_out, Branch_in, Branch_out,Instr20_16_in,Instr20_16_out, Instr15_11_in,Instr15_11_out, Instr26bit_in, Instr26bit_out);
input Clk,Rst;
input [31:0] PC_in, ReadData1_in, ReadData2_in, SignExt_in;
input RegWrite_in, ALUsrc_in, RegDest_in, MemWrite_in, MemRead_in,MemToReg_in,Branch_in;
input[5:0] ALUOp_in;
input[4:0] Instr20_16_in, Instr15_11_in;
input [25:0] Instr26bit_in;

output reg [31:0] PC_out, ReadData1_out, ReadData2_out, SignExt_out;
output reg RegWrite_out, ALUsrc_out, RegDest_out, MemWrite_out, MemRead_out,MemToReg_out,Branch_out;
output reg [5:0] ALUOp_out;
output reg [4:0] Instr20_16_out, Instr15_11_out;
output reg [25:0] Instr26bit_out;

reg [31:0] PC_reg, ReadData1_reg, ReadData2_reg, SignExt_reg;
reg RegWrite_reg, ALUsrc_reg, RegDest_reg, MemWrite_reg, MemRead_reg,MemToReg_reg,Branch_reg;
reg [5:0] ALUOp_reg;
reg [4:0] Instr20_16_reg, Instr15_11_reg;
reg [25:0] Instr26bit_reg;


    always @(posedge Clk)begin
        PC_reg<=PC_in;
        ReadData1_reg<=ReadData1_in;
        ReadData2_reg<=ReadData2_in;
        SignExt_reg<=SignExt_in;
        RegWrite_reg<=RegWrite_in;
        ALUsrc_reg<=ALUsrc_in;
        RegDest_reg<=RegDest_in;
        MemWrite_reg<=MemWrite_in;
        MemRead_reg<=MemRead_in;
        MemToReg_reg<=MemToReg_in;
        Branch_reg<=Branch_in;
        ALUOp_reg<=ALUOp_in;
        Instr20_16_reg<=Instr20_16_in;
        Instr15_11_reg<=Instr15_11_in;
        Instr26bit_reg<=Instr26bit_in;
    end
    
    always @(negedge Clk)begin
        PC_out<=PC_reg;
        ReadData1_out<=ReadData1_reg;
        ReadData2_out<=ReadData2_reg;
        SignExt_out<=SignExt_reg;
        RegWrite_out<=RegWrite_reg;
        ALUsrc_out<=ALUsrc_reg;
        RegDest_out<=RegDest_reg;
        MemWrite_out<=MemWrite_reg;
        MemRead_out<=MemRead_reg;
        MemToReg_out<=MemToReg_reg;
        Branch_out<=Branch_reg;
        ALUOp_out<=ALUOp_reg;
        Instr20_16_out<=Instr20_16_reg;
        Instr15_11_out<=Instr15_11_reg;
        Instr26bit_out<=Instr26bit_reg;
    end

endmodule
