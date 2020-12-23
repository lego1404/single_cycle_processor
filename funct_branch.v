
module funct_branch (immediate, funct);

input [15:0] immediate;
output [5:0] funct;

assign funct = immediate[5:0];


endmodule 