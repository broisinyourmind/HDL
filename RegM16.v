module RegM16 (clk,clr,Din,Q);

input clk,clr;
input [15:0] Din;
output [15:0] Q;
reg [15:0] Q;

always @(posedge clk)

begin
  
  if(clr)Q<=16'd0;
  else   Q<=Din;

end

endmodule
