`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - RegisterFile.v
// Description - Test the register_file
// Suggested test case - First write arbitrary values into 
// the saved and temporary registers (i.e., register 8 through 25). Then, 2-by-2, 
// read values from these registers.
////////////////////////////////////////////////////////////////////////////////


module RegisterFile_tb();

	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg	[4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;
	reg Clk;

	wire [31:0] ReadData1;
	wire [31:0] ReadData2;
  

	RegisterFile u0(
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
    /* Please fill in the implementation here... */
	RegWrite = 0;
    WriteRegister = 0;
    WriteData = 0;
    ReadRegister1 = 1;
    ReadRegister2 = 2;
    
	
	#20
	RegWrite = 1; 
	WriteData = 1;
	WriteRegister = 1;
	
	#20     //ReadData1 should get value first
	WriteData = 2;
	WriteRegister = 2;
	
	#20                //ReadData1 = 1, ReadData2 = 2
	WriteData = 3;     
	WriteRegister = 3;
	
	#20
	WriteData = 4;
	WriteRegister = 4;
	
	#20            //ReadData1 = 3, ReadData2 = 4
	ReadRegister1 = 3;
	ReadRegister2 = 4;
	
	
	
	

	
	
	end

endmodule
