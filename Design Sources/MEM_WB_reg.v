`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 05:38:54 PM
// Design Name: 
// Module Name: MEM_WB_reg
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


module MEM_WB_reg(Clk,Rst,RegWrite_in,RegWrite_out,MemToReg_in,MemToReg_out,MemData_in,MemData_out,
ALUResult_in,ALUResult_out,MUXResult_in,MUXResult_out);
    input Clk,Rst;
    input RegWrite_in,MemToReg_in;
    input [31:0] MemData_in, ALUResult_in;
    input [4:0] MUXResult_in;
    
    output reg RegWrite_out, MemToReg_out;
    output reg [31:0] MemData_out, ALUResult_out;
    output reg [4:0] MUXResult_out;
    
    always @(posedge Clk) begin
        if (Rst) begin
            RegWrite_out<=0;
            MemToReg_out<=0;
            MemData_out<=32'b0;
            ALUResult_out<=32'b0;
            MUXResult_out<=5'b0;
        end
        else begin
            RegWrite_out<=RegWrite_in;
            MemToReg_out<=MemToReg_in;
            MemData_out<=MemData_in;
            ALUResult_out<=ALUResult_in;
            MUXResult_out<=MUXResult_in;
        end
        
    end



endmodule
