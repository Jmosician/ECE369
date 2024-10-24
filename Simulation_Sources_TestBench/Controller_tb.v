`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2024 09:42:54 PM
// Design Name: 
// Module Name: Controller_tb
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


module Controller_tb();
    reg [31:0] Instruction;
    wire RegWrite, jump_target, ALUSrc, RegDst, Branch, MemWrite, MemRead, MemToReg, jr, ra, jal;
    wire [5:0] ALUOp;
    wire [1:0] load, store;
    
    
    Controller u0(
         .Instruction(Instruction),
         .RegWrite(RegWrite),
         .jump_target(jump_target),
         .ALUSrc(ALUSrc),
         .ALUOp(ALUOp),
         .RegDst(RegDst),
         .Branch(Branch), 
         .MemWrite(MemWrite), 
         .MemRead(MemRead),
         .MemToReg(MemToReg),
         .jr(jr), 
         .ra(ra), 
         .store(store), 
         .load(load), 
         .jal(jal)
    );
    
    initial begin
        #100
        Instruction=32'b00000000000000000000000000100000;
        #100
        Instruction=536870944;
        #100
        Instruction=32'b00000000000000000000000000100010;
        #100
        Instruction=32'b00000000000000000000000000100100;
    end


endmodule