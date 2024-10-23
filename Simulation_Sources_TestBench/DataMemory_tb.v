`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg     [31:0]  Address;
    reg     [31:0]  WriteData;
    reg             Clk;
    reg             MemWrite;
    reg             MemRead;

    wire [31:0] ReadData;

    DataMemory u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData)
    ); 

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
    	Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	
	initial begin
	    Address = 32'b0;
        WriteData = 32'b0;
        MemWrite = 0;
        MemRead = 0;
        #20;
        
        Address = 16; 
        WriteData = 1024; // Data to be written
        MemWrite = 1'b1;
        MemRead = 1'b0;
        #20;
        
        
        MemWrite = 1'b0;
        MemRead = 1'b1;
        #20;
        
        Address=4;
        WriteData=64;
        MemWrite=1'b1;
        MemRead=1'b0;
        #20;
        
        MemWrite = 1'b0;
        MemRead = 1'b1;
        #20;
        
        Address=12;
        WriteData=3034;
        MemWrite=1'b0;
        MemRead=1'b1;
        #20
        
        Address=64;
        MemWrite=1'b0;
        MemRead=1'b1;
     
        
	end

endmodule

