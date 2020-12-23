
module sign_ex(inst, in, out);

input [15:0] in;
input [31:0] inst;

output reg[31:0] out;

always @(inst)
begin

if ((inst[31:26] == 6'b000000) && (inst[5:0] == 6'b000000)) //sll
begin
out <= {26'b00000000000000000000000000,inst[10:6]};
end

else
out <= {{16{in[15]}}, in};

end

endmodule 