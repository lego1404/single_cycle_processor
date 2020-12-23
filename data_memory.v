
module data_memory (clk,address, wdata, memread, memwrite, rdata);

input [31:0] address,wdata;
input memread, memwrite,clk;
output reg[31:0] rdata;


reg [31:0] mem[0:63];


always@(posedge clk)
begin
	//lw
	if (memread==1&&memwrite==0)
	rdata<= mem[address];
	
	//sw
	else if(memread==0&&memwrite==1)
	mem[address] <=wdata;


end

initial
begin
$readmemb("memory.mem", mem);

$writememb("memory.mem", mem);

end

endmodule 