
module data_counter(rst,in_clk, data, data3, data2, data1, data0);

input [31:0] data;
input rst, in_clk;
output reg[3:0] data3, data2, data1, data0;


always@(posedge in_clk or negedge rst)
begin
	
	if(!rst)
	begin
		data0 <=0;
		data1 <=0;
		data2 <=0;
		data3 <=0;
	end
	else
	
	begin
	
	data3 = (data % 10000) / 1000;
	data2 = (data % 1000) /100;
	data1 = (data % 100)/10;
	data0 = data % 10;
	
	end
	
end

endmodule 