
module branch_address (pc, immediate, branch_address);

input [31:0] pc, immediate;
output [31:0] branch_address;

assign shifted = immediate << 2;

assign branch_address = shifted + pc;

endmodule 