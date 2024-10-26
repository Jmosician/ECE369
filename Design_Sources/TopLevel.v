`timescale 1ns / 1ps
module TopLevel(Clk, Rst, PCValue, WriteData);
//hello
    input Clk,Rst;
    output wire [31:0] PCValue;
    output wire [31:0] WriteData;
    wire [31:0] Branch_output;
    wire [31:0] Instruction;
    wire [31:0] Jr_Or_Not;
    wire [31:0] PCResult;
    wire [31:0] InstructionID;
    wire [31:0] PCResultID;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire [4:0] WB_reg;
    wire write_mux_out;
    wire [31:0] SignExtend;
    wire [5:0] ALUOp;
    wire Branch, RegWrite, Jump_Target, ALUSrc, RegDst, MemWrite, MemRead, MemToReg, Jr, Ra, Jal;
    wire [1:0] Store, Load;
    wire [31:0] PCAddress;

//IF Stage
    ProgramCounter Pcount(.Address(PCAddress), .PCResult(PCValue), .Reset(Rst), .Clk(Clk));
    InstructionMemory InstructMem(.Address(PCValue), .Instruction(Instruction)); 
    PCAdder PCAdd(.PCResult(PCValue), .PCAddResult(PCResult));
    
    IF_ID_reg a(
        .Clk(Clk),.Rst(Rst),.PC_in(PCResult),
        .PC_out(PCResultID),.Instr_in(Instruction),.Instr_out(InstructionID)
    );

//ID Stage
    RegisterFile RegFile(
        .ReadRegister1(InstructionID[25:21]),
        .ReadRegister2(InstructionID[20:16]), 
        .WriteRegister(WB_reg),
        .WriteData(WriteData), 
        .RegWrite(RegWrite), .Clk(Clk), 
        .ReadData1(ReadData1), 
        .ReadData2(ReadData2)
    );


    

    SignExtension signext(.in(InstructionID[15:0]), .out(SignExtend));


    Controller controller(.Instruction(Instruction), .RegWrite(RegWrite), .jump_target(Jump_Target), 
    .ALUSrc(ALUSrc), .ALUOp(ALUOp), .RegDst(RegDst), .Branch(Branch), .MemWrite(MemWrite), .MemRead(MemRead), 
    .MemToReg(MemToReg), .jr(Jr), .ra(Ra), .store(Store), .load(Load), .jal(Jal)
    );

    wire [4:0] Instruction_20_16_EX;
    wire [4:0] Instruction_15_11_EX;
    wire [25:0] Instruction_25_0_EX;
    wire [31:0] PCResult_EX; 
    wire [31:0] Instruction_EX;
    wire [31:0] ReadData1_EX;
    wire [31:0] ReadData2_EX;
    wire [31:0] SignExtend_EX;
    wire [5:0] ALUOp_EX;
    wire Branch_EX, RegWrite_EX, Jump_Target_EX, ALUSrc_EX, RegDst_EX, MemWrite_EX, MemRead_EX, MemToReg_EX, Jr_EX, Ra_EX, Jal_EX;
    wire [1:0] Store_EX, Load_EX;




    ID_EX_reg b(
        .Clk(Clk),.Rst(Rst),.PC_in(PCResultID),.PC_out(PCResult_EX),
        .ReadData1_in(ReadData1),.ReadData1_out(ReadData1_EX),.ReadData2_in(ReadData2),.ReadData2_out(ReadData2_EX),
        .SignExt_in(SignExtend),.SignExt_out(SignExtend_EX),.RegWrite_in(RegWrite),.RegWrite_out(RegWrite_EX),
        .ALUsrc_in(ALUSrc),.ALUsrc_out(ALUSrc_EX),.ALUOp_in(ALUOp),.ALUOp_out(ALUOp_EX),.RegDest_in(RegDst),
        .RegDest_out(RegDst_EX),.MemWrite_in(MemWrite),.MemWrite_out(MemWrite_EX),.MemRead_in(MemRead),
        .MemRead_out(MemRead_EX),.MemToReg_in(MemToReg),.MemToReg_out(MemToReg_EX), .Branch_in(Branch), 
        .Branch_out(Branch_EX),.Instr20_16_in(InstructionID[20:16]),.Instr20_16_out(Instruction_20_16_EX), 
        .Instr15_11_in(InstructionID[15:11]),.Instr15_11_out(Instruction_15_11_EX), .Instr26bit_in(InstructionID[25:0]), 
        .Instr26bit_out(Instruction_25_0_EX),.ra_in(Ra),.ra_out(Ra_EX),.jr_in(Jr),.jr_out(Jr_EX), 
        .jump_target_in(Jump_Target),.jump_target_out(Jump_Target_EX),.load_in(Load),.load_out(Load_EX),
        .store_in(Store),.store_out(Store_EX),.jal_in(Jal),.jal_out(Jal_EX)
        );

//EX Stage
    wire [4:0] RegDestMuxResult;
    wire [31:0] jump_targetMuxResult;
    wire [31:0] ALUResult;
    wire [31:0] shiftResult;
    wire [31:0] ALUSrcMuxResult;
    wire ALUZero;
    wire [31:0] AddResult;
    
    Mux5Bit2To1 RegDestMux(.out(RegDestMuxResult), .inA(Instruction_20_16_EX), .inB(Instruction_15_11_EX), .sel(RegDst_EX));

    Mux32Bit2To1 jump_targetMux(.out(jump_targetMuxResult), .inA(SignExtend_EX), 
    .inB({6'b0, Instruction_25_0_EX}), .sel(Jump_Target_EX)
    );

    Mux32Bit2To1 ALUSrcMux(
    .out(ALUSrcMuxResult), .inA(ReadData2_EX), .inB(SignExtend_EX), .sel(ALUSrc_EX));
    ShiftLeft2 shifter(.Shift_in(jump_targetMuxResult),.Shift_out(shiftResult));
    ALU32Bit ALU(.ALUControl(ALUOp_EX), .A(ReadData1_EX), .B(ALUSrcMuxResult), .ALUResult(ALUResult), .Zero(ALUZero));
    Adder adder(.A(PCResult_EX), .B(shiftResult), .AddResult(AddResult)
    );
    
    wire Branch_MEM;
    wire MemWrite_MEM;
    wire MemRead_MEM;
    wire RegWrite_MEM;
    wire MemToReg_MEM;
    wire [31:0] AddResult_MEM;
    wire ALUZero_MEM;
    wire [31:0] ALUResult_MEM;
    wire [4:0] RegDestMuxResult_MEM;
    wire [31:0] ReadData2_MEM, ReadData1_MEM;
    wire Ra_MEM;
    wire [1:0] Load_MEM;
    wire [1:0] Store_MEM;
    wire Jal_MEM, Jr_MEM;

    EX_MEM_reg c(
    .Clk(Clk),.Rst(Rst),.jr_in(Jr_EX),.jr_out(Jr_MEM),.Branch_in(Branch_EX),
    .Branch_out(Branch_MEM),.MemWrite_in(MemWrite_EX),.MemWrite_out(MemWrite_MEM),.MemRead_in(MemRead_EX),
    .MemRead_out(MemRead_MEM),.RegWrite_in(RegWrite_EX),.RegWrite_out(RegWrite_MEM),
    .MemToReg_in(MemToReg_EX),.MemToReg_out(MemToReg_MEM),.AddResult_in(AddResult),
    .AddResult_out(AddResult_MEM),.Zero_in(ALUZero),.Zero_out(ALUZero_MEM),.ALUResult_in(ALUResult),
    .ALUResult_out(ALUResult_MEM),.MUXResult_in(RegDestMuxResult),.MUXResult_out(RegDestMuxResult_MEM),
    .ReadData1_in(ReadData1_EX),.ReadData1_out(ReadData1_MEM),.ReadData2_in(ReadData2_EX),.ReadData2_out(ReadData2_MEM),
    .ra_in(Ra_EX), .ra_out(Ra_MEM),.load_in(Load_EX),.load_out(Load_MEM),.store_in(Store_EX),
    .store_out(Store_MEM),.jal_in(Jal_EX),.jal_out(Jal_MEM)
    );

//MEM Stage
    wire [31:0] loadMuxResult;
    wire [31:0] storeMuxResult;
    wire [31:0] jalMuxResult;
    wire [31:0] MemData_MEM;

   
    ANDgate andgate(.Branch(Branch_MEM), .zero(ALUZero_MEM), .out(Branch_output));
   
    Mux32Bit3To1 loadMux(
    .out(loadMuxResult), .inA(ALUResult_MEM), .inB({16'b0, ALUResult_MEM}), 
    .inC({24'b0, ALUResult_MEM}), .sel(Load_MEM)
    );
    
    Mux32Bit2To1 jrMux(.out(Jr_Or_Not), .inA(AddResult_MEM), .inB(ReadData1_MEM), .sel(Jr_MEM));
    
    Mux32Bit3To1 storeMux(.out(storeMuxResult), .inA(ReadData2_MEM), 
    .inB({16'b0, ReadData2_MEM}), .inC({24'b0, ReadData2_MEM}), .sel(Store_MEM)
    );
    
    DataMemory datamemory(.Address(loadMuxResult), .WriteData(storeMuxResult), .Clk(Clk), .MemWrite(MemWrite_MEM), .MemRead(MemRead_MEM), .ReadData(MemData_MEM));

    Mux32Bit2To1 jalMux(.out(jalMuxResult),.inA(ALUResult_MEM),.inB(AddResult_MEM),.sel(Jal_MEM));

    wire Ra_WB, RegWrite_WB, MemToReg_WB;
    wire [31:0] jalMuxResult_WB;
    wire [31:0] MemData_WB;
    wire [4:0] RegDestMuxResult_WB;
    
    MEM_WB_reg d(
        .Clk(Clk),.Rst(Rst),.RegWrite_in(RegWrite_MEM),.RegWrite_out(RegWrite_WB),
        .MemToReg_in(MemToReg_MEM),.MemToReg_out(MemToReg_WB),.MemData_in(MemData_MEM),.MemData_out(MemData_WB),
        .MUXResult_in(jalMuxResult),.MUXResult_out(jalMuxResult_WB),.RegDestResult_in(RegDestMuxResult_MEM),
        .RegDestResult_out(RegDestMuxResult_WB),.ra_in(Ra_MEM), .ra_out(Ra_WB)
        );

//WB Stage
    //wire [31:0] MemToRegMuxResult;

    Mux32Bit2To1 MemToRegMux(.out(WriteData), .inA(MemData_WB), 
    .inB(jalMuxResult_WB), .sel(MemToReg_WB)
    );

    Mux5Bit2To1 writeMux(.out(WB_reg), .inA(RegDestMuxResult_WB), .inB(31), .sel(Ra_WB));
    Mux32Bit2To1 PCSrcMux(.out(PCAddress), .inA(PCResult), .inB(Jr_Or_Not), .sel(Branch_output));

endmodule