/*----------------------------------------------------------------
  Module for Datapath
------------------------------------------------------------------*/
module Datapath
	(
		input logic clk, reset, rfwrite, Use_Imm,
		input logic[2:0] Extend_sel, br_type, 
		input logic[1:0] sel_PC, wdata_sel,
		input logic[3:0] ALUop, 
		output logic[2:0] func3, 
		output logic[6:0] func7, opcode
	);

logic br_taken;
logic [3:0] mask;
logic [4:0] radd1, radd2, wadd, SLImm;
logic [11:0] Imm, SImm;
logic [12:0] BImm;
logic [19:0] UImm;
logic [20:0] JImm;
logic [31:0] rdata1, rdata2, wdata, PC, Instruction, Extended_Imm, Imm_out, 
			 Alu_result, Mem_outData, rs1_out, LSU_wdata;


Program_Counter Prog_C (clk, reset, br_taken, Alu_result, PC);
Instruction_Memory Inst (PC, Instruction);
Decoder decode (Instruction, radd1, radd2, wadd, SLImm, func3, func7, opcode, Imm, SImm, BImm, UImm, JImm);
Register Reg (clk, rfwrite, radd1, radd2, wadd, wdata, rdata1, rdata2);
Sign_Extender Extend(Extend_sel, Imm, SImm, SLImm, UImm, BImm, JImm, Extended_Imm);
Mux3x1 Mux_rs1(sel_PC, rdata1, PC, 32'b0, rs1_out);
Mux2x1 Mux_Imm(Use_Imm, rdata2, Extended_Imm, Imm_out);
Mux3x1 Mux_mem(wdata_sel, Alu_result, LSU_wdata, PC + 32'd4, wdata);
Data_Memory Data(clk, cs, rd_wr, mask, Alu_result, rdata2, Mem_outData);
Load_Store_Unit LSU(func3, opcode, Mem_outData, Alu_result, cs, rd_wr, mask, LSU_wdata);
ALU ALU_opr (rs1_out, Imm_out, ALUop, Alu_result);
Branch_Comparator Comparison(rdata1, rdata2, br_type, br_taken);

endmodule