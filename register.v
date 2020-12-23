
module register(clk, rreg1, rreg2, wreg, wdata, regwrite, rdata1, rdata2);

input [31:0] wdata;
input [4:0] rreg1,rreg2, wreg;
input regwrite, clk;
output reg[31:0] rdata1, rdata2;

reg [31:0] register[0:31];


always@(rreg1)
begin
	rdata1 <= register[rreg1];
end

always@(rreg2)
begin
	rdata2 <= register[rreg2];	
end



always@(posedge clk)
begin
	if(regwrite == 1)
	register[wreg] <= wdata;
		
end


initial
begin
$readmemb("register.mem", register);

$writememb("register.mem", register);

end


endmodule 