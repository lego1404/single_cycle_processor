
module mux_32(input_a, input_b, signal, out);

input [31:0] input_a, input_b; 
input signal;
output reg [31:0] out;

always@(signal)
	case(signal)
	
	1'b0:
	out <= input_a;

	1'b1:
	out <= input_b;
	
	endcase


endmodule 