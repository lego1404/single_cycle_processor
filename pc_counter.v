
module pc_counter(rst, in_clk, pc, pc1, pc2);

input in_clk, rst;
input [31:0] pc;

output reg[3:0] pc1, pc2;


always@(posedge in_clk or negedge rst)
begin
	if(!rst)
	begin
		pc1<=0;
		pc2<=0;
	end
	else
	begin
	
	
	pc1 = pc/10;
	pc2 = pc - (pc1 * 10);
	
	
	end

end

endmodule 