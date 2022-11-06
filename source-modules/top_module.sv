/*----------------------------------------------------------------
  Top Module for Project 2
------------------------------------------------------------------*/
module Top_Module
	(
		input logic clk, reset
	);

logic rfwrite, Use_Imm;
logic [1:0] sel_PC, wdata_sel;
logic [2:0] func3, Extend_sel, br_type;
logic [3:0] ALUop;
logic [6:0] func7, opcode;

Datapath DP (.clk(clk), .reset(reset), .rfwrite(rfwrite), .Use_Imm(Use_Imm), 
			.wdata_sel(wdata_sel), .sel_PC(sel_PC), .br_type(br_type), .Extend_sel(Extend_sel), .ALUop(ALUop),
			.func3(func3), .func7(func7), .opcode(opcode));
			   
Controller CTRL (.func3(func3), .opcode(opcode), .func7(func7), .rfwrite(rfwrite), .Use_Imm(Use_Imm), 
				 .wdata_sel(wdata_sel), .sel_PC(sel_PC), .Extend_sel(Extend_sel), 
				.br_type(br_type), .ALUop(ALUop));

endmodule