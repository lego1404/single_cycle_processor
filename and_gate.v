
module and_gate(branch, zero, out);

input branch, zero;
output out;

assign out = branch & zero;

endmodule 