`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [3:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;	        // inputs

	wire [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult(ALUResult), 
        .Zero(Zero)
    );

	initial begin
	
    ALUControl=4'b0000;
    A=4;
    B=8;
    #10
    
    ALUControl=4'b0001;
    A=12;
    B=4;
    #10
    
    A=2;
    B=4;
    #10
    
    ALUControl=4'b0010;
    A=6;
    B=4;
    #10	
    
    ALUControl=4'b0011;
    A=10;
    B=10;
    #10  
    
    A=4;
    B=10;
    #10  
    
    ALUControl=4'b0100;
    A=8;
    B=4;
    #10  
    
    ALUControl=4'b0101;
    A=8;
    B=4;
    #10
    
    ALUControl=4'b0110;
    A=8;
    B=4;
    #10
    
    ALUControl=4'b0111;
    A=2;
    B=4;
    #10
    
    A=4;
    B=2;
    #10
    
    A=4;
    B=4;
    #10
    
    ALUControl=4'b1000;
    A=-3;
    #10
    
    A=0;
    #10
    
    A=3;
    #10
    
    ALUControl=4'b1001;
    A=8;
    B=8;
    #10
    
    A=10;
    B=8;
    #10
    
    ALUControl=4'b1010;
    A=8;
    #10
    
    A=0;
    #10
    
    A=-8;
    #10
    
    ALUControl=4'b1011;
    A=8;
    #10
    
    A=0;
    #10
    
    A=-8;
    
    
	end

endmodule
