
module jump_address(input_28, pc_4, address);

input [27:0]input_28;
input [31:0] pc_4;
output [31:0]address;

assign address = {pc_4[31:28], input_28};

endmodule 