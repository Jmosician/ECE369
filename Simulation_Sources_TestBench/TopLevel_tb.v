`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - TopLevel_tb.v
// Description - Test the 'TopLevel.v' module with all pipeline stages
////////////////////////////////////////////////////////////////////////////////
module TopLevel_tb(); 
    // Test inputs
    reg Clk, Rst;

    // outputs
    wire [31:0] PCValue;
    wire [31:0] WriteData;

    TopLevel u0(
        // Inputs
        .Clk(Clk),
        .Rst(Rst),
        
        // IF Stage
        .PCValue(PCValue),
        .WriteData(WriteData)
    );

    // Clock generation
    initial begin
        Clk <= 1;
        forever #20 Clk <= ~Clk;
    end

    // Reset logic with a delay
    initial begin
        Rst <= 1;      // Assert reset
          // Deassert reset after 40ns
    end
    
    // Display results at every positive clock edge
    always @(posedge Clk) begin
        Rst <= 0;
   /*     $display("\n=== Time %0t ns ===", $time);
        
        // IF Stage
        $display("\nIF Stage:");
        $display("PCValue=%h, PCResult=%h, Instruction=%h, PCAddress=%h",
                 PCValue, PCResult, Instruction, PCAddress);
        
        // ID Stage
        $display("\nID Stage:");
        $display("InstructionID=%h, PCResultID=%h, ReadData1=%h, ReadData2=%h",
                 InstructionID, PCResultID, ReadData1, ReadData2);
        $display("SignExtend=%h, ALUOp=%h, Control Signals: Branch=%b RegWrite=%b Jump_Target=%b",
                 SignExtend, ALUOp, Branch, RegWrite, Jump_Target);
        
        // EX Stage
        $display("\nEX Stage:");
        $display("ALUResult=%h, ALUZero=%b, AddResult=%h",
                 ALUResult, ALUZero, AddResult);
        $display("ReadData1_EX=%h, ReadData2_EX=%h, SignExtend_EX=%h",
                 ReadData1_EX, ReadData2_EX, SignExtend_EX);
        
        // MEM Stage
        $display("\nMEM Stage:");
        $display("Branch_output=%h, ALUResult_MEM=%h, MemData_MEM=%h",
                 Branch_output, ALUResult_MEM, MemData_MEM);
        $display("Jr_Or_Not=%h, loadMuxResult=%h, storeMuxResult=%h",
                 Jr_Or_Not, loadMuxResult, storeMuxResult);
        
        // WB Stage
        $display("\nWB Stage:");
        $display("WriteData=%h, RegDestMuxResult_WB=%h, MemData_WB=%h",
                 WriteData, RegDestMuxResult_WB, MemData_WB);
           */    
    end   

endmodule