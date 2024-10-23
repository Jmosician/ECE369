`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - ProgramCounter_tb.v
// Description - Test the 'ProgramCounter.v' module.
////////////////////////////////////////////////////////////////////////////////

module ProgramCounter_tb(); 

	reg [31:0] Address;
	reg Reset, Clk;

	wire [31:0] PCResult;

    ProgramCounter u0(
        .Address(Address), 
        .PCResult(PCResult), 
        .Reset(Reset), 
        .Clk(Clk)
    );
	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
    
    integer i;
    
	initial begin
	
    /* Please fill in the implementation here... */
    Address = 2;
    
	for(i = 0; i < 5; i = i + 1) begin
	   if (i == 3) begin
	   Reset <= 1; end
	   else begin
	   Reset <= 0; end
	   @(posedge Clk);
	   
	end    
	end
	


endmodule

