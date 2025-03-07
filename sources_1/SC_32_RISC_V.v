`timescale 1ns / 1ps

module SC_32_RISC_V(

       input Clk,Reset
       
    );
    
   
    wire [31:0] Instr,ReadData,Pc,
                DataAdr,WriteData;
    wire MemWrite;
    RV32I_Processor Processor (
            
            .Clk(Clk),                   
            .Reset(Reset),                 
            .Instr(Instr),
            .MemWrite(MemWrite),
            .ReadData(ReadData),
            .Pc(Pc),
            .DataAdr(DataAdr),        
            .WriteData(WriteData)      
            
    );
    
     Instruction_memory Instr_mem (
    
            .A(Pc),
            .RD(Instr)
            
    );
    
    Data_Memory data_mem (
    
            .clk(Clk),     
            .we(MemWrite),      
            .a(DataAdr),
            .wd(WriteData),
            .rd(ReadData)
    );
    
endmodule
