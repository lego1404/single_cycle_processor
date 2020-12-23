
module mux_5 (inst_a, inst_b, regdst, out);

input [4:0] inst_a, inst_b;
input regdst;
output reg [4:0] out;

always@(regdst)
begin
	case (regdst)
	1'b0:
	out <= inst_a;

	1'b1:
	out <= inst_b;
	endcase

end

endmodule
