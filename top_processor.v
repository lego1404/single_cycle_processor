
module top_processor(rst, clk, seg0, seg1, seg2, seg3, seg4, seg5);

input rst, clk;
output[6:0] seg0, seg1, seg2, seg3, seg4, seg5;

wire [31:0] pc_out, inst_mem_out, rdata_1, rdata_2, extend_out, alu_mux_out,alu_out, data_mem_out, mem_mux_out, pc_4, jump_out, branch_out, branch_mux_out, pc_mux_out, opcode;
wire [25:0] j_address;
wire [27:0] sll_out;
wire [15:0] immediate;
wire [5:0] funct;
wire [4:0] rs, rt, rd, mux_5_out;
wire [3:0] alu_con_out, pc1, pc2, data3, data2, data1, data0;
wire [1:0] aluop;
wire regdst, regwrite, alusrc, memread, memwrite, memtoreg, branch,zero,
mux_signal, jump, out_clk;


	clk_dll clock(.rst(rst), .clk(clk), .out_clk(out_clk));

	pc_counter pc_count(.rst(rst), .in_clk(out_clk), .pc(pc_mux_out), .pc1(pc1), .pc2(pc2));
	seg7 pc_1(.digit(pc1), .seg(seg5));
	seg7 pc_2(.digit(pc2), .seg(seg4));

	
	
	
	pc program_counter(.rst(rst), .clk(out_clk), .newpc(pc_mux_out), .pc(pc_out));


	add_4 adding_4(.in(pc_out),.out(pc_4));

	instruction_memory inst_mem(.pc(pc_out), .inst(inst_mem_out));

	opcode_branch op_branch(.inst(inst_mem_out), .address(j_address), .rs(rs), .rt(rt), .rd(rd) ,.immediate(immediate), .opcode(opcode));

	control control_unit(.inst(opcode), .regdst(regdst), .jump(jump), .branch(branch), .memread(memread), .memtoreg(memtoreg), .aluop(aluop), .memwrite(memwrite), .alusrc(alusrc), .regwrite(regwrite));

	mux_5 m_5(.inst_a(rt), .inst_b(rd), .regdst(regdst), .out(mux_5_out));

	register register_memory(.clk(out_clk), .rreg1(rs), .rreg2(rt), .wreg(mux_5_out), .wdata(mem_mux_out), .regwrite(regwrite), .rdata1(rdata_1), .rdata2(rdata_2));

	sign_ex sign_extension(.inst(inst_mem_out),.in(immediate), .out(extend_out));

	funct_branch fun_branch(.immediate(immediate), .funct(funct));

	mux_32 alu_mux(.input_a(rdata_2), .input_b(extend_out), .signal(alusrc), .out(alu_mux_out));

	aludec alucontrol(.func(funct), .aluop(aluop), .alucontrol(alu_con_out));

	alu_mips alu(.a(rdata_1), .b(alu_mux_out), .control(alu_con_out), .outalu(alu_out), .zero(zero));

	data_memory data_mem(.clk(out_clk), .address(alu_out), .wdata(rdata_2), .memread(memread), .memwrite(memwrite), .rdata(data_mem_out));

	mux_32 mem_mux(.input_a(alu_out), .input_b(data_mem_out), .signal(memtoreg), .out(mem_mux_out));

	shift_left_26 sll_2(.iinst(j_address), .oinst(sll_out));

	jump_address jp_address(.input_28(sll_out), .pc_4(pc_4), .address(jump_out));

	and_gate andgate(.branch(branch), .zero(zero), .out(mux_signal));

	branch_address b_address(.pc(pc_4), .immediate(extend_out), .branch_address(branch_out));

	mux_32 branch_mux(.input_a(pc_4), .input_b(branch_out), .signal(mux_signal), .out(branch_mux_out));

	mux_32 pc_mux(.input_a(branch_mux_out), .input_b(jump_out), .signal(jump), .out(pc_mux_out));


data_counter data_count(.rst(rst),.in_clk(out_clk),.data(mem_mux_out), .data3(data3), .data2(data2), .data1(data1), .data0(data0));
seg7 data_3(.digit(data3), .seg(seg3));
seg7 data_2(.digit(data2), .seg(seg2));
seg7 data_1(.digit(data1), .seg(seg1));
seg7 data_0(.digit(data0), .seg(seg0));


endmodule 