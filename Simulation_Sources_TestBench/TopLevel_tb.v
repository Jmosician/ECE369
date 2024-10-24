`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - ProgramCounter_tb.v
// Description - Test the 'ProgramCounter.v' module.
////////////////////////////////////////////////////////////////////////////////

module TopLevel_tb(); 
    reg Rst, Clk;

    wire [31:0] PCValue;
    wire [31:0] WriteData;
    wire [31:0] Jr_Or_Not;
    wire [31:0] PCAddress;
    wire [31:0] PCResult;
    wire [31:0] Branch_output;

    TopLevel u0(
        .Clk(Clk),
        .Rst(Rst),
        .PCValue(PCValue),
        .WriteData(WriteData)
    );

    // Clock generation
    initial begin
        Clk <= 1;
        forever #100 Clk <= ~Clk;
        
        #1000
        
        $finish;
    end

    // Reset logic with a delay
    initial begin
        Rst <= 1;      // Assert reset
        #200 Rst <= 0; // Deassert reset after 200ns
    end

    // Display results at every positive clock edge
    always @(posedge Clk) begin
        $display("Time = %0t, PCValue = %d, WriteData = %d, Jr_Or_Not = %d, PCAddress = %d, PCResult = %d, Branch_output = %d", $time, PCValue, WriteData, Jr_Or_Not, PCAddress, PCResult, Branch_output);
    end

endmodule
