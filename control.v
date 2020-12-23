
module control(inst, regdst, jump, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite);

input [31:0] inst;
output reg regdst, jump, branch, memread, memtoreg, memwrite, alusrc, regwrite;
output reg [1:0] aluop;

always @ (inst)
begin
	case(inst[31:26])
	//R format, sll, add
	6'b000000:
	begin
	
	if (inst[5:0] == 6'b000000)
	begin
		regwrite<=1;
		regdst<=1;
		alusrc<=1;
		branch<=0;
		memwrite<=0;
		memtoreg<=0;
		aluop<=2'b10;
		jump<=0;
		memread<=0;
	end
	
	else
	begin
		regwrite<=1;
		regdst<=1;
		alusrc<=0;
		branch<=0;
		memwrite<=0;
		memtoreg<=0;
		aluop<=2'b10;
		jump<=0;
		memread<=0;
	end
	
	end

	//lw
	6'b100011:
	begin
		regwrite<=1;
		regdst<=0;
		alusrc<=1;
		branch<=0;
		memwrite<=0;
		memtoreg<=1;
		aluop<=2'b00;
		jump<=0;
		memread<=1;
	end

	//sw
	6'b101011:
	begin
		regwrite<=0;
		regdst<=1'bx;
		alusrc<=1;
		branch<=0;
		memwrite<=1;
		memtoreg<=1'bx;
		aluop<=2'b00;
		jump<=0;
		memread<=0;
	end

	//beq
	6'b000100:
	begin
		regwrite<=0;
		regdst<=1'bx;
		alusrc<=0;
		branch<=1;
		memwrite<=0;
		memtoreg<=1'b0; //1'bx
		aluop<=2'b01;
		jump<=0;
		memread<=0;
	end	

	//addi
	6'b001000:
	begin
		regwrite<=1;
		regdst<=0;
		alusrc<=1;
		branch<=0;
		memwrite<=0;
		memtoreg<=0;
		aluop<=2'b00;
		jump<=0;
		memread<=0;
	end	

	//ori
	6'b001101:
	begin
		regwrite<=1;
		regdst<=0;
		alusrc<=1;
		branch<=0;
		memwrite<=0;
		memtoreg<=0;
		aluop<=2'b11; //random number 11
		jump<=0;
		memread<=0;
	end	

	//j
	6'b000010:
	begin
		regwrite<=0;
		regdst<=1'bx;
		alusrc<=1'bx;
		branch<=0;
		memwrite<=0;
		memtoreg<=1'b0; //1'bx
		aluop<=2'bxx;
		jump<=1;
		memread<=0;
	end	


	endcase
end

endmodule