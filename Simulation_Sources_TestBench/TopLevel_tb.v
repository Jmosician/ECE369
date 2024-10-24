`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - ProgramCounter_tb.v
// Description - Test the 'ProgramCounter.v' module.
////////////////////////////////////////////////////////////////////////////////

module TopLevel_tb(); 

	reg [31:0] Address;
	reg Rst, Clk;

	wire [31:0] PCValue;
    wire [31:0] WriteData;

    TopLevel u0(
        .Clk(Clk),
        .Rst(Rst),
        .PCValue(PCValue),
        .WriteData(WriteData)
    );
	initial begin
		Clk <= 1;
        Rst <= 0;
		forever #10 Clk <= ~Clk;
	end

    endmodule
    