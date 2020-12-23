
module shift_left_26 (iinst, oinst);
input [25:0] iinst;
output [27:0] oinst;

reg [27:0] oinst;

always@(iinst)
begin
	oinst = iinst << 2;
end

endmodule
