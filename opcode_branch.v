
module opcode_branch(inst, address, rs, rt, rd ,immediate, opcode);

input [31:0] inst;
output reg [25:0] address;
output reg [31:0] opcode;
output reg [4:0] rs,rt,rd;
output reg [15:0] immediate;


reg [5:0] funct; 

always@(inst)
begin
	opcode <= inst;
	funct <= inst[5:0];
	
	case(inst[31:26])
	//Rformat
	6'b000000:
	begin
	
	if (funct == 6'b000000) //if inst is sll
	begin
		rs <= inst[20:16];
		rt <= inst[10:6];
		rd <= inst[15:11];
		immediate <= inst[15:0];
		address <= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;
	end
	
	else
	rs <= inst[25:21];
	rt <= inst[20:16];
	rd <= inst[15:11];
	immediate <= inst[15:0];
	address <= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;
	end
	
	//ori
	6'b001101:
	begin
	rs <= inst[25:21];
	rt <= inst[20:16];
	immediate <= inst[15:0];
	rd <= 5'bxxxxx;
	address <= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;
	end
	
	//addi
	6'b001000:
	begin
	rs <= inst[25:21];
	rt <= inst[20:16];
	immediate <= inst[15:0];
	rd <= 5'bxxxxx;
	address <= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;
	end
	
	//lw
	6'b100011:
	begin
	rs <= inst[25:21];
	rt <= inst[20:16];
	immediate <= inst[15:0];
	rd <= 5'bxxxxx;
	address <= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;
	end

	//beq
	6'b000100:
	begin
	rs <= inst[25:21];
	rt <= inst[20:16];
	immediate <= inst[15:0];
	rd <= 5'bxxxxx;
	address <= 26'bxxxxxxxxxxxxxxxxxxxxxxxxxx;
	end

	//j
	6'b000010:
	begin
	rs <= 5'bxxxxx;
	rt <= 5'bxxxxx;
	rd <= 5'bxxxxx;
	immediate <= 16'bxxxxxxxxxxxxxxxx;
	address <= inst[25:0];
	end
	endcase
end

endmodule