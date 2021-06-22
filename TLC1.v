module TLC1 (clk,reset,count);
input clk,reset;
output reg [3:0] count;

always@(posedge clk)

if (reset)
count=count+1'd1;
else
count=0;

endmodule 
