`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResult, Zero);

	input [5:0] ALUControl; // control bits for ALU operation
                                // you need to adjust the bitwidth as needed
	input signed [31:0] A, B;	    // inputs

	output reg[31:0] ALUResult;	// answer
	output reg Zero;	    // Zero=1 if ALUResult == 0

    /* Please fill in the implementation here... */
    always @(*) begin //do everything except data & jump
        case(ALUControl)
        6'b000000: begin //sll
            ALUResult <= A << B; end
        6'b000010: begin //srl
            ALUResult <= A >> B; end
        6'b100000: begin //add & addi
            ALUResult <= A + B; end
        6'b100010: begin //sub, beq
            ALUResult <= A - B; end
        6'b111000: begin //mul
            ALUResult <= A * B; end
        6'b100100: begin  //and, andi
            ALUResult <= A & B; end
        6'b100101: begin //or, ori
            ALUResult <= A | B; end
        6'b100111: begin //nor
            ALUResult <= ~(A | B); end
        6'b100110: begin //xor
            ALUResult <= A ^ B; end
        6'b101010: begin //slt, slti
            ALUResult <= (A < B); end
        6'b001000: begin //bgez
            ALUResult <= A < 0; end
        6'b001001: begin  //bne
            ALUResult <= (A == B); end
        6'b001010: begin //blez
            ALUResult <= A > 0; end
        6'b001011: begin //bltz
            ALUResult <= A >= 0; end
        6'b001111: begin //bgtz
            ALUResult <= A <= 0; end
        6'b110000: begin //j
            ALUResult <= 0; end
        
        default: begin
            ALUResult <= 32'bX; end
        
        endcase
        
         Zero = (ALUResult == 0) ? 1 : 0; // Compute Zero flag
        
    end 
    
  
        
    
       
        
    
endmodule

